classdef tBlocking < matlab.unittest.TestCase
    methods (Test)
        function testNormalPass(testCase)
            % Simple passing test — confirms test runner works
            testCase.verifyEqual(1 + 1, 2);
        end

        function testKeyboardBlock(testCase)
            % keyboard stops execution waiting for debug input
            % In a non-interactive worker, this should timeout or be skipped
            keyboard;
            testCase.verifyTrue(true);
        end

        function testInputBlock(testCase)
            % input() waits for user input from stdin
            % In a non-interactive worker, this should timeout or error
            answer = input('Enter a number: ');
            testCase.verifyEqual(answer, 42);
        end
    end
end
