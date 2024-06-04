modelName = 'and_gate_model';
load_system(modelName);

open_system(modelName);

set_param(modelName, 'SystemTargetFile', 'ert.tlc');

set_param(modelName, 'Toolchain', 'MinGW64 | gmake (64-bit Windows)');

set_param(modelName, 'Solver', 'FixedStepDiscrete');

set_param(modelName, 'FixedStep', '0.1');

rtwbuild(modelName);

checkIDs = {'mathworks.jmaab.ar_0001', 'mathworks.jmaab.ar_0002',
            'mathworks.jmaab.jc_0241', 'mathworks.jmaab.jc_0242',
            'mathworks.jmaab.jc_0201', 'mathworks.jmaab.jc_0211',
            'mathworks.jmaab.jc_0231', 'mathworks.jmaab.jc_0243',
            'mathworks.jmaab.jc_0247', 'mathworks.jmaab.jc_0244',
            'mathworks.jmaab.jc_0222', 'mathworks.jmaab.jc_0232',
            'mathworks.jmaab.jc_0245', 'mathworks.jmaab.jc_0246',
            'mathworks.jmaab.jc_0795', 'mathworks.jmaab.jc_0796',
            'mathworks.jmaab.jc_0791', 'mathworks.jmaab.jc_0792',
            'mathworks.jmaab.jc_0700', 'mathworks.maab.na_0019'};

results = ModelAdvisor.run(modelName, checkIDs);


function tests = test_and_gate_model()
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
    load_system('and_gate_model.slx');
end

function teardownOnce(testCase)
end



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
