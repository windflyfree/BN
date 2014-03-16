local function test_user(id)
 userobj = get_user_by_id(id) --这里总是会有一个玩家对象泄漏
 print("only test", userobj:get_name())
end

test_user(id)