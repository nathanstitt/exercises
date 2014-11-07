# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141107194147) do

  create_table "administrators", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "administrators", ["user_id"], name: "index_administrators_on_user_id", unique: true

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "attachments", force: true do |t|
    t.integer  "parent_id",   null: false
    t.string   "parent_type", null: false
    t.string   "asset",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attachments", ["asset"], name: "index_attachments_on_asset"
  add_index "attachments", ["parent_id", "parent_type", "asset"], name: "index_attachments_on_parent_id_and_parent_type_and_asset", unique: true

  create_table "authors", force: true do |t|
    t.integer  "publication_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "authors", ["publication_id", "user_id"], name: "index_authors_on_publication_id_and_user_id", unique: true
  add_index "authors", ["user_id"], name: "index_authors_on_user_id"

  create_table "class_licenses", force: true do |t|
    t.integer  "license_id", null: false
    t.string   "class_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "class_licenses", ["class_name"], name: "index_class_licenses_on_class_name"
  add_index "class_licenses", ["license_id", "class_name"], name: "index_class_licenses_on_license_id_and_class_name", unique: true

  create_table "combo_choice_answers", force: true do |t|
    t.integer  "combo_choice_id", null: false
    t.integer  "answer_id",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "combo_choice_answers", ["answer_id", "combo_choice_id"], name: "index_combo_choice_answers_on_answer_id_and_combo_choice_id", unique: true
  add_index "combo_choice_answers", ["combo_choice_id"], name: "index_combo_choice_answers_on_combo_choice_id"

  create_table "combo_choices", force: true do |t|
    t.integer  "stem_id",                                           null: false
    t.decimal  "correctness", precision: 3, scale: 2, default: 0.0, null: false
    t.text     "feedback"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "combo_choices", ["stem_id", "correctness"], name: "index_combo_choices_on_stem_id_and_correctness"

  create_table "commontator_comments", force: true do |t|
    t.string   "creator_type"
    t.integer  "creator_id"
    t.string   "editor_type"
    t.integer  "editor_id"
    t.integer  "thread_id",                     null: false
    t.text     "body",                          null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   default: 0
    t.integer  "cached_votes_down", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"

  create_table "commontator_subscriptions", force: true do |t|
    t.string   "subscriber_type", null: false
    t.integer  "subscriber_id",   null: false
    t.integer  "thread_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"

  create_table "commontator_threads", force: true do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id"
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true

  create_table "copyright_holders", force: true do |t|
    t.integer  "publication_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "copyright_holders", ["publication_id", "user_id"], name: "index_copyright_holders_on_publication_id_and_user_id", unique: true
  add_index "copyright_holders", ["user_id"], name: "index_copyright_holders_on_user_id"

  create_table "deputizations", force: true do |t|
    t.integer  "deputizer_id", null: false
    t.integer  "deputy_id",    null: false
    t.string   "deputy_type",  null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "deputizations", ["deputizer_id"], name: "index_deputizations_on_deputizer_id"
  add_index "deputizations", ["deputy_id", "deputy_type", "deputizer_id"], name: "index_deputizations_on_d_id_and_d_type_and_d_id", unique: true

  create_table "derivations", force: true do |t|
    t.integer  "derived_publication_id", null: false
    t.integer  "source_publication_id"
    t.text     "custom_attribution"
    t.datetime "hidden_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "derivations", ["derived_publication_id", "hidden_at"], name: "index_derivations_on_derived_publication_id_and_hidden_at"
  add_index "derivations", ["source_publication_id", "derived_publication_id"], name: "index_derivations_on_source_p_id_and_derived_p_id", unique: true

  create_table "editors", force: true do |t|
    t.integer  "publication_id", null: false
    t.integer  "user_id",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "editors", ["publication_id", "user_id"], name: "index_editors_on_publication_id_and_user_id", unique: true
  add_index "editors", ["user_id"], name: "index_editors_on_user_id"

  create_table "exercises", force: true do |t|
    t.string   "title"
    t.text     "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercises", ["title"], name: "index_exercises_on_title"

  create_table "fine_print_contracts", force: true do |t|
    t.string   "name",       null: false
    t.integer  "version"
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fine_print_contracts", ["name", "version"], name: "index_fine_print_contracts_on_name_and_version", unique: true

  create_table "fine_print_signatures", force: true do |t|
    t.integer  "contract_id", null: false
    t.integer  "user_id",     null: false
    t.string   "user_type",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fine_print_signatures", ["contract_id"], name: "index_fine_print_signatures_on_contract_id"
  add_index "fine_print_signatures", ["user_id", "user_type", "contract_id"], name: "index_fine_print_signatures_on_u_id_and_u_type_and_c_id", unique: true

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.string   "language",    null: false
    t.text     "description"
    t.text     "code",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "libraries", ["language"], name: "index_libraries_on_language"
  add_index "libraries", ["name"], name: "index_libraries_on_name"

  create_table "license_compatibilities", force: true do |t|
    t.integer  "original_license_id", null: false
    t.integer  "combined_license_id", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "license_compatibilities", ["combined_license_id", "original_license_id"], name: "index_license_compatibilities_on_c_l_id_and_o_l_id", unique: true
  add_index "license_compatibilities", ["original_license_id"], name: "index_license_compatibilities_on_original_license_id"

  create_table "licenses", force: true do |t|
    t.string   "name",                                 null: false
    t.string   "title",                                null: false
    t.string   "url",                                  null: false
    t.text     "publishing_contract",                  null: false
    t.text     "copyright_notice",                     null: false
    t.boolean  "requires_attribution", default: true,  null: false
    t.boolean  "share_alike",          default: false, null: false
    t.boolean  "no_derivatives",       default: false, null: false
    t.boolean  "non_commercial",       default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "licenses", ["name"], name: "index_licenses_on_name", unique: true
  add_index "licenses", ["title"], name: "index_licenses_on_title", unique: true
  add_index "licenses", ["url"], name: "index_licenses_on_url", unique: true

  create_table "list_editors", force: true do |t|
    t.integer  "editor_id",   null: false
    t.string   "editor_type", null: false
    t.integer  "list_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "list_editors", ["editor_id", "editor_type", "list_id"], name: "index_list_editors_on_editor_id_and_editor_type_and_list_id", unique: true
  add_index "list_editors", ["list_id"], name: "index_list_editors_on_list_id"

  create_table "list_exercises", force: true do |t|
    t.integer  "list_id",                             null: false
    t.integer  "exercise_id",                         null: false
    t.decimal  "credit",      precision: 5, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "list_exercises", ["exercise_id", "list_id"], name: "index_list_exercises_on_exercise_id_and_list_id", unique: true
  add_index "list_exercises", ["list_id", "credit"], name: "index_list_exercises_on_list_id_and_credit"

  create_table "list_nestings", force: true do |t|
    t.integer  "parent_list_id", null: false
    t.integer  "child_list_id",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "list_nestings", ["child_list_id"], name: "index_list_nestings_on_child_list_id", unique: true
  add_index "list_nestings", ["parent_list_id"], name: "index_list_nestings_on_parent_list_id"

  create_table "list_owners", force: true do |t|
    t.integer  "owner_id",   null: false
    t.string   "owner_type", null: false
    t.integer  "list_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_owners", ["list_id"], name: "index_list_owners_on_list_id"
  add_index "list_owners", ["owner_id", "owner_type", "list_id"], name: "index_list_owners_on_owner_id_and_owner_type_and_list_id", unique: true

  create_table "list_readers", force: true do |t|
    t.integer  "reader_id",   null: false
    t.string   "reader_type", null: false
    t.integer  "list_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "list_readers", ["list_id"], name: "index_list_readers_on_list_id"
  add_index "list_readers", ["reader_id", "reader_type", "list_id"], name: "index_list_readers_on_reader_id_and_reader_type_and_list_id", unique: true

  create_table "lists", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["name"], name: "index_lists_on_name"

  create_table "logic_libraries", force: true do |t|
    t.integer  "logic_id",   null: false
    t.integer  "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logic_libraries", ["library_id"], name: "index_logic_libraries_on_library_id"
  add_index "logic_libraries", ["logic_id", "library_id"], name: "index_logic_libraries_on_logic_id_and_library_id", unique: true

  create_table "logic_variable_values", force: true do |t|
    t.integer  "logic_variable_id", null: false
    t.integer  "seed",              null: false
    t.text     "value",             null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "logic_variable_values", ["logic_variable_id", "seed"], name: "index_logic_variable_values_on_logic_variable_id_and_seed", unique: true
  add_index "logic_variable_values", ["seed"], name: "index_logic_variable_values_on_seed"

  create_table "logic_variables", force: true do |t|
    t.integer  "logic_id",   null: false
    t.string   "variable",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logic_variables", ["logic_id", "variable"], name: "index_logic_variables_on_logic_id_and_variable", unique: true

  create_table "logics", force: true do |t|
    t.integer  "parent_id",   null: false
    t.string   "parent_type", null: false
    t.string   "language",    null: false
    t.text     "code",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "logics", ["language"], name: "index_logics_on_language"
  add_index "logics", ["parent_id", "parent_type", "language"], name: "index_logics_on_parent_id_and_parent_type_and_language", unique: true

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type"
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "openstax_accounts_accounts", force: true do |t|
    t.integer  "openstax_uid", null: false
    t.string   "username",     null: false
    t.string   "access_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "openstax_accounts_accounts", ["access_token"], name: "index_openstax_accounts_accounts_on_access_token", unique: true
  add_index "openstax_accounts_accounts", ["first_name"], name: "index_openstax_accounts_accounts_on_first_name"
  add_index "openstax_accounts_accounts", ["full_name"], name: "index_openstax_accounts_accounts_on_full_name"
  add_index "openstax_accounts_accounts", ["last_name"], name: "index_openstax_accounts_accounts_on_last_name"
  add_index "openstax_accounts_accounts", ["openstax_uid"], name: "index_openstax_accounts_accounts_on_openstax_uid", unique: true
  add_index "openstax_accounts_accounts", ["username"], name: "index_openstax_accounts_accounts_on_username", unique: true

  create_table "openstax_accounts_group_members", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "openstax_accounts_group_members", ["group_id", "user_id"], name: "index_openstax_accounts_group_members_on_group_id_and_user_id", unique: true
  add_index "openstax_accounts_group_members", ["user_id"], name: "index_openstax_accounts_group_members_on_user_id"

  create_table "openstax_accounts_group_nestings", force: true do |t|
    t.integer  "member_group_id",    null: false
    t.integer  "container_group_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "openstax_accounts_group_nestings", ["container_group_id"], name: "index_openstax_accounts_group_nestings_on_container_group_id"
  add_index "openstax_accounts_group_nestings", ["member_group_id"], name: "index_openstax_accounts_group_nestings_on_member_group_id", unique: true

  create_table "openstax_accounts_group_owners", force: true do |t|
    t.integer  "group_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "openstax_accounts_group_owners", ["group_id", "user_id"], name: "index_openstax_accounts_group_owners_on_group_id_and_user_id", unique: true
  add_index "openstax_accounts_group_owners", ["user_id"], name: "index_openstax_accounts_group_owners_on_user_id"

  create_table "openstax_accounts_groups", force: true do |t|
    t.integer  "openstax_uid",                               null: false
    t.boolean  "is_public",                  default: false, null: false
    t.string   "name"
    t.text     "cached_subtree_group_ids"
    t.text     "cached_supertree_group_ids"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "openstax_accounts_groups", ["is_public"], name: "index_openstax_accounts_groups_on_is_public"
  add_index "openstax_accounts_groups", ["openstax_uid"], name: "index_openstax_accounts_groups_on_openstax_uid", unique: true

  create_table "publications", force: true do |t|
    t.integer  "publishable_id",                        null: false
    t.string   "publishable_type",                      null: false
    t.integer  "license_id"
    t.integer  "number",                                null: false
    t.integer  "version",                               null: false
    t.datetime "published_at"
    t.datetime "yanked_at"
    t.datetime "embargoed_until"
    t.boolean  "embargo_children_only", default: false, null: false
    t.boolean  "major_change",          default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "publications", ["embargoed_until"], name: "filtered_index_publications_on_embargoed_until", where: "embargo_children_only=0"
  add_index "publications", ["embargoed_until"], name: "index_publications_on_embargoed_until"
  add_index "publications", ["license_id"], name: "index_publications_on_license_id"
  add_index "publications", ["number", "publishable_type", "version"], name: "filtered_index_publications_on_number_and_p_type_and_version", where: "major_change=0"
  add_index "publications", ["number", "publishable_type", "version"], name: "index_publications_on_number_and_publishable_type_and_version", unique: true
  add_index "publications", ["publishable_id", "publishable_type"], name: "index_publications_on_publishable_id_and_publishable_type", unique: true
  add_index "publications", ["published_at"], name: "index_publications_on_published_at"
  add_index "publications", ["yanked_at"], name: "index_publications_on_yanked_at"

  create_table "question_dependencies", force: true do |t|
    t.integer  "parent_question_id",                    null: false
    t.integer  "dependent_question_id",                 null: false
    t.boolean  "is_optional",           default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "question_dependencies", ["dependent_question_id", "parent_question_id"], name: "index_question_dependencies_on_dependent_q_id_and_parent_q_id", unique: true
  add_index "question_dependencies", ["parent_question_id"], name: "index_question_dependencies_on_parent_question_id"

  create_table "questions", force: true do |t|
    t.integer  "exercise_id", null: false
    t.text     "stimulus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["exercise_id"], name: "index_questions_on_exercise_id"

  create_table "required_libraries", force: true do |t|
    t.integer  "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "required_libraries", ["library_id"], name: "index_required_libraries_on_library_id", unique: true

  create_table "solutions", force: true do |t|
    t.integer  "question_id", null: false
    t.string   "title"
    t.text     "summary"
    t.text     "details",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "solutions", ["question_id"], name: "index_solutions_on_question_id"
  add_index "solutions", ["title"], name: "index_solutions_on_title"

  create_table "sorts", force: true do |t|
    t.integer  "domain_id"
    t.string   "domain_type"
    t.integer  "sortable_id",   null: false
    t.string   "sortable_type", null: false
    t.integer  "position",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sorts", ["domain_id", "domain_type", "sortable_type", "position"], name: "index_sorts_on_d_id_and_d_type_and_s_type_and_position", unique: true
  add_index "sorts", ["sortable_id", "sortable_type", "domain_id", "domain_type"], name: "index_sorts_on_s_id_and_s_type_and_d_id_and_d_type", unique: true
  add_index "sorts", ["sortable_id", "sortable_type"], name: "index_sorts_on_sortable_id_and_sortable_type", unique: true, where: "domain_id IS NULL"
  add_index "sorts", ["sortable_type", "position"], name: "index_sorts_on_sortable_type_and_position", unique: true, where: "domain_id IS NULL"

  create_table "stem_answers", force: true do |t|
    t.integer  "stem_id",                                           null: false
    t.integer  "answer_id",                                         null: false
    t.decimal  "correctness", precision: 3, scale: 2, default: 0.0, null: false
    t.text     "feedback"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "stem_answers", ["answer_id", "stem_id"], name: "index_stem_answers_on_answer_id_and_stem_id", unique: true
  add_index "stem_answers", ["stem_id", "correctness"], name: "index_stem_answers_on_stem_id_and_correctness"

  create_table "stems", force: true do |t|
    t.integer  "question_id", null: false
    t.text     "content",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "stems", ["question_id"], name: "index_stems_on_question_id"

  create_table "stylings", force: true do |t|
    t.integer  "stylable_id",   null: false
    t.string   "stylable_type", null: false
    t.string   "style",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stylings", ["stylable_id", "stylable_type", "style"], name: "index_stylings_on_stylable_id_and_stylable_type_and_style", unique: true
  add_index "stylings", ["style"], name: "index_stylings_on_style"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "trusted_applications", force: true do |t|
    t.integer  "application_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trusted_applications", ["application_id"], name: "index_trusted_applications_on_application_id", unique: true

  create_table "users", force: true do |t|
    t.integer  "account_id",                                        null: false
    t.datetime "deleted_at"
    t.boolean  "show_public_domain_attribution",    default: true,  null: false
    t.boolean  "forward_notifications_to_deputies", default: false, null: false
    t.boolean  "receive_role_notifications",        default: true,  null: false
    t.boolean  "receive_access_notifications",      default: true,  null: false
    t.boolean  "receive_comment_notifications",     default: true,  null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", unique: true
  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at"

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
