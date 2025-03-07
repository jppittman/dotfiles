return {
	"rafamadriz/friendly-snippets",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node

		-- Add custom Go snippets
		ls.add_snippets("go", {
			-- Error handling snippet
			s("iferr", {
				t("if err != nil {"), t({"", "\t"}),
				t("return "), i(1, "err"), t({"", "}"}),
			}),

			-- For loop snippet
			s("forr", {
				t("for "), i(1, "_"), t(", "), i(2, "v"), t(" := range "), i(3, "slice"), t({" {", "\t"}),
				i(0), t({"", "}"}),
			}),

			-- Function declaration
			s("func", {
				t("func "), i(1, "name"), t("("), i(2), t(") "), i(3, "return_type"), t({" {", "\t"}),
				i(0), t({"", "}"}),
			}),

			-- Test function
			s("test", {
				t("func Test"), i(1, "Name"), t("(t *testing.T) {"), t({"", "\t"}),
				i(0), t({"", "}"}),
			}),

			s("testt", {
				t("func Test"), i(1, "Name"), t("(t *testing.T) {"), t({"", "\t"}),
				t("tests := []struct {"), t({"", "\t\t"}),
				t("name string"), t({"", "\t\t"}),
				i(2, "input"), t(" "), i(3, "type"), t({"", "\t\t"}),
				t("want "), i(4, "type"), t({"", "\t"}),
				t("}{"), t({"", "\t\t"}),
				t("{"), t({"", "\t\t\t"}),
				t("name: \""), i(5, "test case"), t("\","), t({"", "\t\t\t"}),
				i(6, "input"), t(": "), i(7), t(","), t({"", "\t\t\t"}),
				t("want: "), i(8), t(","), t({"", "\t\t"}),
				t("},"), t({"", "\t"}),
				t("}"), t({"", "\t"}),
				t({"", "\t"}),
				t("for _, tt := range tests {"), t({"", "\t\t"}),
				t("t.Run(tt.name, func(t *testing.T) {"), t({"", "\t\t\t"}),
				t("got := "), i(9, "FunctionUnderTest"), t("(tt."), i(10, "input"), t(")"), t({"", "\t\t\t"}),
				t("if got != tt.want {"), t({"", "\t\t\t\t"}),
				t("t.Errorf(\""), i(11, "FunctionUnderTest"), t("() = %v, want %v\", got, tt.want)"), t({"", "\t\t\t"}),
				t("}"), t({"", "\t\t"}),
				t("})"), t({"", "\t"}),
				t("}"), t({"", "}"}),
			}),
		})
	end
}
