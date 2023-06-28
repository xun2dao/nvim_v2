local config = {
	options = {
		g = {
			-- 设置为1，进入markdown文件后，自动打开预览
			mkdp_auto_start = 0,
			-- 设置为1，退出markdown文件后，自动退出预览
			mkdp_auto_close = 1,
			-- 设置为0，就会随着编辑自动刷新预览，设置为1，保存后才会更新预览
			mkdp_refresh_slow = 0,
			-- 设置为1，可以应用于所有文件，设置为0，只应用在markdown上
			mkdp_command_for_global = 0,
			-- 设置为1，预览服务器可以访问网络中的其他人
			mkdp_open_to_the_world = 0,
			-- 当在远程vim上工作，却要在本地浏览器上浏览时，有用
			mkdp_open_ip = "",
			-- 指定用于预览的浏览器
			mkdp_browser = "/usr/bin/google-chrome",
			-- 设置为1，会在命令行，打印出预览页面的URL
			mkdp_echo_preview_url = 0,
			-- 一个自定义的用于打开预览页面的函数
			mkdp_browserfunc = "",
			-- mkit : 用于渲染的markdown-it选项
			-- katex : 用于数学
			-- uml : markdown-it-plantuml 选项
			-- maid: mermaid options
			-- disable_sync_scroll: 是否禁止同步滚动，默认为0
			-- middle: 光标总是出现在预览页面的中间
			-- top : 光标总是出现在预览页面的顶部
			-- relative : 光标总是出现在预览页面的相对位置
			-- hide_yaml_meta: 是否隐藏yaml元数据，默认为1
			-- sequence diagrams: is-sequence-diagrams 选项
			-- content_editable: 是否允许对预览页面进行内容编辑，默认为v:false
			-- disable_filename : 是否禁止预览页面显示文件头，默认为0
			mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 0,
				toc = {},
			},

			-- 使用自定义的markdown风格，必须是绝对路径
			-- 比如 '/Users/username/highlight.css'或者 expand('~/highlight.css')
			mkdp_markdown_css = "",
			-- 使用自定义的高亮风格，必须是绝对路径
			mkdp_highlight_css = "",
			-- 使用一个自定义的端口去启动预览服务器，或者空，就随机选择
			mkdp_port = "",
			-- 预览页面的标题
			mkdp_page_title = "「${name}」",
			-- 设置识别的文件类型，该文件类型可以使用MarkdowPreview命令
			mkdp_filetypes = { "markdown" },

			-- 设置默认主题背景
			mkdp_theme = "dark",
		},
	},
}
return config
