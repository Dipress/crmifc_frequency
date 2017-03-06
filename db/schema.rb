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

ActiveRecord::Schema.define(version: 0) do

  create_table "address_area", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",  limit: 150, default: "0", null: false
    t.integer "cityid",             default: -1,  null: false
  end

  create_table "address_city", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "country_id",             default: 1,   null: false
    t.string  "title",      limit: 150, default: "0", null: false
    t.integer "pos",                    default: 1
  end

  create_table "address_config", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "table_id",  limit: 50,    null: false
    t.integer "record_id",               null: false
    t.string  "key",       limit: 50,    null: false
    t.text    "value",     limit: 65535, null: false
  end

  create_table "address_country", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",       default: "", null: false
    t.datetime "last_update",              null: false
  end

  create_table "address_house", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cityid_",                    default: 0,  null: false
    t.integer "streetid",                   default: 0,  null: false
    t.integer "house",                      default: 0,  null: false
    t.string  "frac",         limit: 30
    t.integer "amount",       limit: 2,     default: 0,  null: false
    t.string  "comment",      limit: 100
    t.integer "areaid",                     default: 0,  null: false
    t.integer "quarterid",                  default: 0,  null: false
    t.string  "box_index",    limit: 10
    t.date    "dt"
    t.text    "pod_diapazon", limit: 65535,              null: false
    t.string  "pod",          limit: 200,   default: "", null: false
    t.index ["streetid", "house", "frac"], name: "HouseU", unique: true, using: :btree
  end

  create_table "address_quarter", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",  limit: 150, default: "0", null: false
    t.integer "gid"
    t.integer "cityid",             default: -1,  null: false
  end

  create_table "address_street", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",   limit: 150, default: "0", null: false
    t.string  "p_index", limit: 6,   default: "",  null: false
    t.integer "cityid",              default: -1,  null: false
  end

  create_table "agent_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contract_id"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.decimal  "value",                     precision: 10, scale: 2
    t.string   "text"
    t.datetime "managed_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "confirmation_id"
    t.datetime "confirmation_at"
    t.integer  "agent_payment_currency_id"
    t.index ["agent_payment_currency_id"], name: "index_agent_payments_on_agent_payment_currency_id", using: :btree
    t.index ["contract_id"], name: "index_agent_payments_on_contract_id", using: :btree
    t.index ["manager_id"], name: "index_agent_payments_on_manager_id", using: :btree
    t.index ["user_id"], name: "index_agent_payments_on_user_id", using: :btree
  end

  create_table "bgs_group", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",    limit: 250, default: "", null: false
    t.string  "comment",  limit: 250, default: "", null: false
    t.bigint  "cgr",                  default: 0,  null: false
    t.string  "pids",     limit: 120
    t.string  "opids",                default: ""
    t.integer "cgr_mode", limit: 1,   default: 1,  null: false
  end

  create_table "bgs_group_action", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "gid",            default: 0, null: false
    t.string  "mid", limit: 10,             null: false
    t.integer "aid",            default: 0, null: false
    t.index ["gid"], name: "gid", using: :btree
  end

  create_table "bgs_group_menu", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "gid",                null: false
    t.string  "menu_id", limit: 50, null: false
    t.integer "hidden",  limit: 1,  null: false
  end

  create_table "bgs_module_action", primary_key: "module", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "data", limit: 65535, null: false
  end

  create_table "bgs_user_action", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "uid",            default: 0, null: false
    t.string  "mid", limit: 10,             null: false
    t.integer "aid",            default: 0, null: false
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "bgs_user_group", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "uid", default: 0, null: false
    t.integer "gid", default: 0, null: false
    t.index ["gid"], name: "gid", using: :btree
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "bill_account_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title",                      null: false
    t.string  "bank_title",                 null: false
    t.string  "account",      limit: 30,    null: false
    t.string  "bik",          limit: 30,    null: false
    t.string  "corr_account", limit: 30,    null: false
    t.integer "pid",                        null: false
    t.bigint  "gr",                         null: false
    t.text    "comment",      limit: 65535
  end

  create_table "bill_attribute_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",   null: false
    t.string  "name",  null: false
    t.string  "value", null: false
    t.date    "start"
    t.date    "end"
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "bill_contract_doc_type_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",      default: 0, null: false
    t.integer "doc_type", default: 0, null: false
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "bill_data_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",                                                                   null: false
    t.integer "type",                                                                  null: false
    t.integer "account_id",                                                            null: false
    t.integer "number",                                                                null: false
    t.integer "number_in_month",                                                       null: false
    t.integer "number_in_year",                                                        null: false
    t.string  "format_number",   limit: 30,                                            null: false
    t.integer "uid",                                                                   null: false
    t.integer "yy",                                                                    null: false
    t.integer "mm",                                                                    null: false
    t.date    "create_dt"
    t.date    "pay_dt"
    t.integer "status",          limit: 1,                                             null: false
    t.integer "unload_status",                                                         null: false
    t.decimal "summ",                             precision: 12, scale: 2,             null: false
    t.binary  "xml",             limit: 16777215,                                      null: false
    t.integer "payment_id",                                                            null: false
    t.integer "npid",                                                      default: 1
    t.integer "pay_uid"
    t.index ["cid"], name: "cid", using: :btree
    t.index ["create_dt"], name: "create_dt", using: :btree
    t.index ["mm"], name: "mm", using: :btree
    t.index ["yy"], name: "yy", using: :btree
  end

  create_table "bill_doc_type_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "type",     limit: 1,     default: 0,  null: false
    t.string  "title",    limit: 200,   default: "", null: false
    t.string  "pattern",  limit: 200,                null: false
    t.text    "pos_list", limit: 65535,              null: false
    t.integer "opt",      limit: 1,                  null: false
    t.string  "comment",  limit: 250,   default: "", null: false
    t.text    "setup",    limit: 65535
    t.integer "npid",                   default: 1
  end

  create_table "bill_invoice_data_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",                                                                   null: false
    t.integer "type",                                                                  null: false
    t.integer "number",                                                                null: false
    t.integer "number_in_month",                                                       null: false
    t.integer "number_in_year",                                                        null: false
    t.string  "format_number",   limit: 30,                                            null: false
    t.integer "yy",                                                                    null: false
    t.integer "mm",                                                                    null: false
    t.date    "create_dt"
    t.integer "unload_status",                                                         null: false
    t.decimal "summ",                             precision: 12, scale: 2,             null: false
    t.integer "show_ready",      limit: 1,                                             null: false
    t.binary  "xml",             limit: 16777215,                                      null: false
    t.integer "npid",                                                      default: 2
    t.index ["cid"], name: "cid", using: :btree
    t.index ["create_dt"], name: "create_dt", using: :btree
    t.index ["mm"], name: "mm", using: :btree
    t.index ["yy"], name: "yy", using: :btree
  end

  create_table "bill_numeration_pool_2", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title",   limit: 50
    t.string "pattern", limit: 50
  end

  create_table "bill_numeration_pool_2_log", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "uid",                       default: 0, null: false
    t.integer  "cid",                       default: 0, null: false
    t.integer  "oid",                       default: 0, null: false
    t.text     "description", limit: 65535
    t.integer  "action",                    default: 0, null: false
    t.datetime "dt",                                    null: false
  end

  create_table "billing_event_bus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "time",                     null: false
    t.binary   "event", limit: 4294967295
  end

  create_table "calculate_period_1", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",   default: 0, null: false
    t.date    "start"
    t.date    "end"
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "calculate_period_6", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",   default: 0, null: false
    t.date    "start"
    t.date    "end"
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "calculate_period_8", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "cid",   default: 0, null: false
    t.date    "start"
    t.date    "end"
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "card_action_11", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "type",      limit: 1,  null: false
    t.datetime "dtime"
    t.integer  "dealer_id",            null: false
    t.integer  "count",                null: false
    t.float    "summ",      limit: 24, null: false
    t.float    "cost",      limit: 24, null: false
  end

  create_table "card_action_12", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "type",      limit: 1,  null: false
    t.datetime "dtime"
    t.integer  "dealer_id",            null: false
    t.integer  "count",                null: false
    t.float    "summ",      limit: 24, null: false
    t.float    "cost",      limit: 24, null: false
  end

  create_table "card_action_13", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "type",      limit: 1,  null: false
    t.datetime "dtime"
    t.integer  "dealer_id",            null: false
    t.integer  "count",                null: false
    t.float    "summ",      limit: 24, null: false
    t.float    "cost",      limit: 24, null: false
  end

  create_table "card_action_card_11", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "action_id", null: false
    t.integer "card_id",   null: false
    t.index ["action_id"], name: "action_id", using: :btree
  end

  create_table "card_action_card_12", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "action_id", null: false
    t.integer "card_id",   null: false
    t.index ["action_id"], name: "action_id", using: :btree
  end

  create_table "card_action_card_13", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "action_id", null: false
    t.integer "card_id",   null: false
    t.index ["action_id"], name: "action_id", using: :btree
  end

  create_table "card_data_13", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "card_code",                default: 0,   null: false
    t.integer  "cs_id",                    default: 0,   null: false
    t.string   "card_pin_code", limit: 32, default: "",  null: false
    t.float    "summa",         limit: 24, default: 0.0, null: false
    t.date     "date1"
    t.date     "date2"
    t.integer  "status",        limit: 1,  default: 0,   null: false
    t.integer  "sid_pay",                  default: 0,   null: false
    t.integer  "sid_act",                  default: 0,   null: false
    t.integer  "pid",                      default: 0,   null: false
    t.integer  "pt",                       default: 0,   null: false
    t.integer  "did",                      default: 0,   null: false
    t.date     "d_date"
    t.integer  "cid",                      default: 0,   null: false
    t.datetime "date"
    t.index ["card_code"], name: "cc", using: :btree
    t.index ["cs_id"], name: "cs_id", using: :btree
    t.index ["did"], name: "did", using: :btree
    t.index ["sid_act"], name: "sid_act", using: :btree
    t.index ["sid_pay"], name: "sid_pay", using: :btree
  end

  create_table "card_dealer_13", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "type",                           default: 0,   null: false
    t.string  "title",              limit: 150, default: "",  null: false
    t.date    "date1"
    t.date    "date2"
    t.string  "login",              limit: 15,  default: "",  null: false
    t.string  "pswd",               limit: 32
    t.string  "pt",                             default: "0"
    t.string  "comment",                        default: "",  null: false
    t.integer "error",                                        null: false
    t.string  "ip",                 limit: 15,                null: false
    t.integer "params",                         default: 0
    t.integer "cansel_time"
    t.integer "st_request",                     default: 0,   null: false
    t.integer "st_finded",                      default: 0,   null: false
    t.integer "st_payed",                       default: 0,   null: false
    t.integer "cid",                                          null: false
    t.float   "card_percent",       limit: 24,                null: false
    t.float   "pay_percent",        limit: 24,                null: false
    t.string  "card_contract",      limit: 250,               null: false
    t.string  "pay_contract",       limit: 250,               null: false
    t.integer "pay_comission_type", limit: 1,                 null: false
    t.integer "contract_id",                                  null: false
  end

  create_table "card_series_11", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title"
    t.integer "free",  null: false
  end

  create_table "card_series_12", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title"
    t.integer "free",  null: false
  end

  create_table "card_series_13", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title"
    t.integer "free",  null: false
  end

  create_table "contract", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "gr",                                                        default: 0,     null: false
    t.string   "title",              limit: 150,                            default: "",    null: false
    t.integer  "title_pattern_id",                                                          null: false
    t.string   "pswd",               limit: 32,                             default: "",    null: false
    t.date     "date1"
    t.date     "date2"
    t.integer  "mode",               limit: 1,                              default: 0,     null: false
    t.decimal  "closesumma",                       precision: 10, scale: 2,                 null: false
    t.integer  "pgid",                                                      default: 0,     null: false
    t.integer  "pfid",                                                      default: 0,     null: false
    t.boolean  "fc",                                                        default: false, null: false
    t.string   "comment",            limit: 100,                            default: "",    null: false
    t.boolean  "del",                                                       default: false, null: false
    t.integer  "scid",                                                      default: 0,     null: false
    t.text     "sub_list",           limit: 65535,                                          null: false
    t.integer  "sub_mode",           limit: 1,                                              null: false
    t.integer  "status",             limit: 1,                              default: 0,     null: false
    t.date     "status_date"
    t.datetime "last_tariff_change"
    t.integer  "crm_customer_id",                                           default: 0,     null: false
    t.index ["crm_customer_id"], name: "crm_customer_id", using: :btree
    t.index ["crm_customer_id"], name: "crm_id", using: :btree
    t.index ["date1"], name: "date1", using: :btree
    t.index ["del"], name: "del", using: :btree
    t.index ["scid"], name: "scid", using: :btree
    t.index ["title"], name: "title", using: :btree
  end

  create_table "contract_account", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "yy",    limit: 2,                          default: 0, null: false
    t.integer "mm",    limit: 1,                          default: 0, null: false
    t.integer "cid",                                      default: 0, null: false
    t.integer "sid",                                      default: 0, null: false
    t.decimal "summa",           precision: 15, scale: 5
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "contract_balance", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "yy",     limit: 2,                          default: 0, null: false
    t.integer "mm",     limit: 1,                          default: 0, null: false
    t.integer "cid",                                       default: 0, null: false
    t.decimal "summa1",           precision: 10, scale: 2,             null: false
    t.decimal "summa2",           precision: 10, scale: 2,             null: false
    t.decimal "summa3",           precision: 10, scale: 2,             null: false
    t.decimal "summa4",           precision: 10, scale: 2,             null: false
    t.index ["cid"], name: "cid", using: :btree
  end

  create_table "contract_charge", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "dt",                                                        null: false
    t.integer  "cid",                                          default: 0,  null: false
    t.integer  "pt",                                           default: 0,  null: false
    t.integer  "uid",                                          default: 0,  null: false
    t.decimal  "summa",               precision: 10, scale: 2,              null: false
    t.string   "comment", limit: 200,                          default: "", null: false
    t.datetime "lm",                                                        null: false
    t.index ["cid", "dt"], name: "cid_dt", using: :btree
    t.index ["cid"], name: "cid", using: :btree
    t.index ["dt", "cid"], name: "dt_cid", using: :btree
    t.index ["pt"], name: "pt", using: :btree
    t.index ["uid"], name: "uid", using: :btree
  end

  create_table "contract_charge_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "title", limit: 50, default: "", null: false
    t.integer "flag",  limit: 1,  default: 0,  null: false
    t.integer "type",  limit: 1,  default: 0,  null: false
    t.integer "up",               default: 0,  null: false
  end

end
