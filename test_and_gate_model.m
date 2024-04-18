function tests = test_and_gate_model()
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    load_system('and_gate_model.slx');
end

function teardownOnce(testCase)
end



%% Test Functions
function testAND_TrueTrue(testCase)
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '1');
    sim('and_gate_model.slx');
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');

    testCase.verifyEqual(double(a), 1)
    clear ans
end
function testAND_TrueFalse(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '1');
    set_param('and_gate_model/Constant1', 'Value', '0');

    sim('and_gate_model.slx');

    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    testCase.verifyEqual(double(a), 0)
    clear ans
end

function testAND_FalseTrue(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '0');
    set_param('and_gate_model/Constant1', 'Value', '1');

    sim('and_gate_model.slx');
    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    testCase.verifyEqual(double(a), 0)
    clear ans
end
function testAND_FalseFalse(testCase)
    % Test case: a = 1, b = 1
    set_param('and_gate_model/Constant', 'Value', '0');
    set_param('and_gate_model/Constant1', 'Value', '0');

    sim('and_gate_model.slx');

    save matlab.mat;
    load matlab.mat ans;
    a=ans.simout.Data;
    
   % output = get_param('and_gate_model/Display', 'Format');
    
    testCase.verifyEqual(double(a), 0)
    clear ans
end
