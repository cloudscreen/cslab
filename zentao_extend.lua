local _M = {
{
	desc = "编辑任务",
	sigid = 360101,
    saas_id = 36,
    event_id = 360045,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/task-batchEdit-\d{1,4}.html]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[names]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [==[
				local z_name = {}
				local z_pid = {}
				local z_type = {}
				local z_pri = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^names") then
						table.insert(z_name, context.request.body.form[value])
					elseif string.find(value, "^taskIDList") then
						table.insert(z_pid, context.request.body.form[value])
					elseif string.find(value, "^types") then
						table.insert(z_type, context.request.body.form[value])
					elseif string.find(value, "^pris") then
						table.insert(z_pri, context.request.body.form[value])
					end
				end
				context.var.z_name = table.concat(z_name, '、')
				context.var.z_pid = table.concat(z_pid, '、')
				context.var.z_type = table.concat(z_type, '、')
				context.var.z_pri = table.concat(z_pri, '、')
				return true
			]==]
		}
	},
	session = "${sid}",
	event_info = "任务ID：${z_name}，最新名称：${z_pid}，任务类型：${z_type}，优先级：${z_pri}"
},
{
	desc = "编辑需求",
	sigid = 360102,
    saas_id = 36,
    event_id = 360016,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/story-batchEdit-storyBatchEdit.html",
    match_request = {
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local z_pid = {}
				local z_title = {}
				local z_plan = {}
				local z_source = {}
				local z_pri = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^storyIDList") then
						table.insert(z_pid, context.request.body.form[value])
					elseif string.find(value, "^titles") then
						table.insert(z_title, context.request.body.form[value])
					elseif string.find(value, "^plans") then
						table.insert(z_plan, context.request.body.form[value])
					elseif string.find(value, "^sources") then
						table.insert(z_source, context.request.body.form[value])
					elseif string.find(value, "^pris") then
						table.insert(z_pri, context.request.body.form[value])
					end
				end
				context.var.z_pid = table.concat(z_pid, '、')
				context.var.z_title = table.concat(z_title, '、')
				context.var.z_plan = table.concat(z_plan, '、')
				context.var.z_source = table.concat(z_source, '、')
				context.var.z_pri = table.concat(z_pri, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "需求ID：${z_pid}，最新名称：${z_title}，所属计划ID：${z_plan}，需求来源：${z_source}，优先级：${z_pri}"
},
{
	desc = "编辑计划",
	sigid = 360103,
    saas_id = 36,
    event_id = 360013,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/productplan-batchEdit-.+?]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[title]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[lastProduct=(?<product>.+?);]] 
		},
		{
			by_code = [[
				local z_pid = {}
				local z_title = {}
				local z_begin = {}
				local z_end = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^id") then
						table.insert(z_pid, context.request.body.form[value])
					elseif string.find(value, "^title") then
						table.insert(z_title, context.request.body.form[value])
					elseif string.find(value, "^begin") then
						table.insert(z_begin, context.request.body.form[value])
					elseif string.find(value, "^end") then
						table.insert(z_end, context.request.body.form[value])
					end
				end
				context.var.z_pid = table.concat(z_pid, '、')
				context.var.z_title = table.concat(z_title, '、')
				context.var.z_begin = table.concat(z_begin, '、')
				context.var.z_end = table.concat(z_end, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "计划ID：${z_pid}，最新名称：${z_title}，最新开始日期：${z_begin}，最新结束日期：${z_end}，所属产品ID：${product}"
},
{
	desc = "编辑产品",
	sigid = 360104,
    saas_id = 36,
    event_id = 360009,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/product-batchEdit.html",
    match_request = {
		{
			by_obj = "context.request.body.raw",
			pattern = [[codes]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local z_pid = {}
				local z_name = {}
				local z_code = {}
				local z_po = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^productIDList") then
						table.insert(z_pid, context.request.body.form[value])
					elseif string.find(value, "^names") then
						table.insert(z_name, context.request.body.form[value])
					elseif string.find(value, "^codes") then
						table.insert(z_code, context.request.body.form[value])
					elseif string.find(value, "^POs") then
						table.insert(z_po, context.request.body.form[value])
					end
				end
				context.var.z_pid = table.concat(z_pid, '、')
				context.var.z_name = table.concat(z_name, '、')
				context.var.z_code = table.concat(z_code, '、')
				context.var.z_po = table.concat(z_po, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "产品ID：${z_pid}，最新名称：${z_name}，最新代码：${z_code}，产品负责人账号：${z_po}"
},
{
	desc = "计划关联需求",
	sigid = 360105,
    saas_id = 36,
    event_id = 360083,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/productplan-linkStory-.+?html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/productplan-linkStory-(?<z_pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local keys = {}
				if context.request.body.form["stories[]"][2] then
					for key,value in pairs(context.request.body.form["stories[]"]) do
						table.insert(keys,value)
					end
					context.var.keys = table.concat(keys, '、')
				else
					context.var.keys = context.request.body.form["stories[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "计划ID：${z_pid}，需求ID：${keys}"
},
{
	desc = "发布关联Bug",
	sigid = 360106,
    saas_id = 36,
    event_id = 360084,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/release-linkBug]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/release-linkBug-(?<z_pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local bugs = {}
				for key,value in pairs(context.request.body.form) do
					if string.find(key, "^bugs") then
						table.insert(bugs, value)
					end
				end
				context.var.bugs = table.concat(bugs, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "发布ID：${z_pid}，BugID：${bugs}"
},
{
	desc = "版本关联Bug",
	sigid = 360114,
    saas_id = 36,
    event_id = 360085,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/build-linkBug.+?html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/build-linkBug-(?<pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local bugs = {}
				for key,value in pairs(context.request.body.form) do
					if string.find(key, "^bugs") then
						table.insert(bugs, value)
					end
				end
				context.var.bugs = table.concat(bugs, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "版本ID：${pid}，BugID：${bugs}"
},
{
	desc = "项目关联产品",
	sigid = 360107,
    saas_id = 36,
    event_id = 360086,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/project-manageproducts-\d{1,4}.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/project-manageproducts-(?<z_pid>.+?).html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local products = {}
				for key,value in pairs(context.request.body.form) do
					if string.find(key, "^products") then
						table.insert(products, value)
					end
				end
				context.var.products = table.concat(products, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "项目ID：${z_pid}，产品ID：${products}"
},
{
	desc = "测试任务关联用例",
	sigid = 360108,
    saas_id = 36,
    event_id = 360087,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testtask-linkCase-\d{1,4}.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testtask-linkCase-(?<z_pid>.+?).html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local cases = {}
				if context.request.body.form["cases[]"][2] then
					for key,value in pairs(context.request.body.form["cases[]"]) do
						table.insert(cases,value)
					end
					context.var.cases = table.concat(cases, '、')
				else 
					context.var.cases = context.request.body.form["cases[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "测试任务ID：${z_pid}，用例ID：${cases}"
},
{
	desc = "套件关联用例",
	sigid = 360109,
    saas_id = 36,
    event_id = 360088,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testsuite-linkCase-\d{1,4}.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testsuite-linkCase-(?<z_pid>.+?).html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local cases = {}
				if context.request.body.form["cases[]"][2] then
					for key,value in pairs(context.request.body.form["cases[]"]) do
						table.insert(cases,value)
					end
					context.var.cases = table.concat(cases, '、')
				else
					context.var.cases = context.request.body.form["cases[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "套件ID：${z_pid}，用例ID：${cases}"
},
{
	desc = "项目关联需求",
	sigid = 360110,
    saas_id = 36,
    event_id = 360089,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/project-linkStory-\d{1,4}.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/project-linkStory-(?<z_pid>.+?).html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [==[
				local stories = {}
				local products = {}
				if context.request.body.form["stories[]"][2] then
					for key,value in pairs(context.request.body.form["stories[]"]) do
						table.insert(stories,value)
						local products_str = "products[" .. value .. "]"
						table.insert(products, context.request.body.form[products_str])
					end
					context.var.stories = table.concat(stories, '、')
					context.var.products = table.concat(products, '、')
				else 
					context.var.stories = context.request.body.form["stories[]"]
					local products_str = "products[" .. context.var.stories .. "]"
					context.var.products = context.request.body.form[products_str]
				end
				return true
			]==]
		}
	},
	session = "${sid}",
	event_info = "项目ID：${z_pid}，需求ID：${stories}，产品ID：${products}"
},
{
	desc = "创建需求",
	sigid = 360111,
    saas_id = 36,
    event_id = 360015,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/story-batchCreate-\d{1,4}-.+?html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/story-batchCreate-(?<z_pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local title = {}
				local plan = {}
				local pri = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^title") and context.request.body.form[value] ~= "" then
						table.insert(title, context.request.body.form[value])
					end
				end
				context.var.title = table.concat(title, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "需求名称：${title}，所属产品ID：${z_pid}"
},
{
	desc = "提Bug",
	sigid = 360112,
    saas_id = 36,
    event_id = 360055,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/bug-batchCreate-\d{1,4}-.+?html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/bug-batchCreate-(?<z_pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local title = {}
				local types = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^title") and context.request.body.form[value] ~= "" then
						table.insert(title, context.request.body.form[value])
					end
				end
				context.var.title = table.concat(title, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "Bug标题：${title}，所属产品ID：${z_pid}"
},
{
	desc = "建用例",
	sigid = 360113,
    saas_id = 36,
    event_id = 360062,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testcase-batchCreate-\d{1,4}-.+?html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testcase-batchCreate-(?<z_pid>.+?)-.+?html]]
		},
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local title = {}
				local story = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^title") and context.request.body.form[value] ~= "" then
						table.insert(title, context.request.body.form[value])
					elseif string.find(value, "^story") and context.request.body.form[value] ~= "0" then
						table.insert(story, context.request.body.form[value])
					end
				end
				context.var.title = table.concat(title, '、')
				context.var.story = table.concat(story, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "用例标题：${title}，相关需求ID：${story}，所属产品ID：${z_pid}"
},
{
	desc = "关闭Bug",
	sigid = 360115,
    saas_id = 36,
    event_id = 360060,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/bug-batchClose.html",
    match_request = {
		{
			by_obj = "context.request.body.raw",
			pattern = [[bugIDList]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local bugs = {}
				if context.request.body.form["bugIDList[]"][2] then
					for key,value in pairs(context.request.body.form["bugIDList[]"]) do
						table.insert(bugs, value)
					end
					context.var.bugs = table.concat(bugs, '、')
				else
					context.var.bugs = context.request.body.form["bugIDList[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "BugID：${bugs}"
},
{
	desc = "指派Bug",
	sigid = 360116,
    saas_id = 36,
    event_id = 360059,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/bug-batchAssignTo-\d{1,4}-product.html]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[assignedTo]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_obj = [=[context.request.body.form["assignedTo"]]=],
			value = "assign"
		},
		{
			by_code = [[
				local bugs = {}
				if 	context.request.body.form["bugIDList[]"][2] then
					for key,value in pairs(context.request.body.form["bugIDList[]"]) do
						table.insert(bugs, value)
					end
					context.var.bugs = table.concat(bugs, '、')
				else 
					context.var.bugs = context.request.body.form["bugIDList[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "BugID：${bugs}，指派给：${assign}"
},
{
	desc = "解决Bug",
	sigid = 360117,
    saas_id = 36,
    event_id = 360057,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/bug-batchResolve.+?html]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[bugIDList]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local bugs = {}
				if context.request.body.form["bugIDList[]"][2] then
					for key,value in pairs(context.request.body.form["bugIDList[]"]) do
						table.insert(bugs, value)
					end
					context.var.bugs = table.concat(bugs, '、')
				else
					context.var.bugs = context.request.body.form["bugIDList[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "BugID：${bugs}"
},
{
	desc = "编辑用例",
	sigid = 360118,
    saas_id = 36,
    event_id = 360063,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/testcase-batchEdit.html",
    match_request = {
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local caseid = {}
				local titles = {}
				local pris = {}
				local z_end = {}
				local keys = {}
				for key in pairs(context.request.body.form) do
					table.insert(keys, key)
				end
				table.sort(keys)
				for key,value in pairs(keys) do
					if string.find(value, "^caseIDList") then
						table.insert(caseid, context.request.body.form[value])
					elseif string.find(value, "^titles") then
						table.insert(titles, context.request.body.form[value])
					elseif string.find(value, "^pris") then
						table.insert(pris, context.request.body.form[value])
					end
				end
				context.var.caseid = table.concat(caseid, '、')
				context.var.titles = table.concat(titles, '、')
				context.var.pris = table.concat(pris, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "用例ID：${caseid}，最新标题：${titles}，优先级：${pris}"
},
{
	desc = "执行用例",
	sigid = 360119,
    saas_id = 36,
    event_id = 360064,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testtask-batchRun-\d{1,4}-id_desc.html]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[version]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local caseid = {}
				for key in pairs(context.request.body.form) do
					if string.find(key, "^version") then
						table.insert(caseid, string.match(key, "%d+"))
					end
				end
				context.var.caseid = table.concat(caseid, '、')
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "用例ID：${caseid}"
},
{
	desc = "删除用例",
	sigid = 360120,
    saas_id = 36,
    event_id = 360065,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/testcase-batchDelete-\d{1,4}.html]]
		},
		{
			by_obj = "context.request.body.raw",
			pattern = [[caseIDList]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_code = [[
				local caseid = {}
				if context.request.body.form["caseIDList[]"][2] then
					for key,value in pairs(context.request.body.form["caseIDList[]"]) do
						table.insert(caseid, value)
					end
					context.var.caseid = table.concat(caseid, '、')
				else 
					context.var.caseid = context.request.body.form["caseIDList[]"]
				end
				return true
			]]
		}
	},
	session = "${sid}",
	event_info = "用例ID：${caseid}"
},
{
	desc = "编辑模块",
	sigid = 360121,
    saas_id = 36,
    event_id = 360033,
    event_category_id = 230,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"POST"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/tree-edit-\d{1,4}-story.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/tree-edit-(?<pid>.+?)-story.html]]
		},
		{
			by_obj = [=[context.request.body.form["name"]]=],
			value = "name"
		},
		{
			by_obj = [=[context.request.body.form["root"]]=],
			value = "root"
		},
		{
			by_obj = [=[context.request.body.form["short"]]=],
			value = "short"
		}
	},
	session = "${sid}",
	event_info = "模块ID：${pid}，最新名称：${name}，简称：${short}，所属产品ID：${root}"
},
{
	desc = "删除计划",
	sigid = 360122,
    saas_id = 36,
    event_id = 360014,
    event_category_id = 110,
    protocol = {
        {scheme = "http", port = 8081}
    },
    method = {"GET"},
    host = {"zentao.cloudscreen.com"},
    path = "/zentao/*",
    match_request = {
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/product[p|P]lan-delete-\d{1,4}-yes.html]]
		}
    },
	capture_request = {
		{
			by_obj = "context.request.header.cookie",
			pattern = [[zentaosid=(?<sid>.+?)$]]
		},
		{
			by_obj = "context.request.path",
			pattern = [[/zentao/product[p|P]lan-delete-(?<pid>.+?)-yes.html]]
		}
	},
	session = "${sid}",
	event_info = "计划ID：${pid}"
}

}
return _M