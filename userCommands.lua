--For java compile with :javac %
vim.api.nvim_create_user_command('Javac', function()
    -- Get the current file name and extension
    local file = vim.fn.expand('%')
    local extension = vim.fn.expand('%:e')

    -- Check if the file is a Java file
    if extension == 'java' then
        -- Compile the Java file
        local compile_cmd = 'javac ' .. file
        local compile_output = vim.fn.system(compile_cmd)

        -- If there are any compilation errors, print them
        if compile_output ~= '' then
            print(compile_output)
        else
            -- Extract the class name and run it
            local class_name = vim.fn.expand('%:t:r')  -- Get the file name without extension
            local run_cmd = 'java -cp ' .. vim.fn.expand('%:p:h') .. ' ' .. class_name
            local run_output = vim.fn.system(run_cmd)
            print(run_output)
        end
    else
        print('This is not a Java file!')
    end
end, {})


