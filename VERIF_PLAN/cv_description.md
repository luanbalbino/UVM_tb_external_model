# Covergroups description

## Direct coverpoints

| Coverpoint | Description             | Coverage Goal | Minimum Hit Count   |                 Coverage Status                     |
|------------|-------------------------|---------------|---------------------|-----------------------------------------------------|
| a          | [3:0] input stream        | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |
| b          | [3:0] input stream        | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |
| c          | [3:0] input stream        | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |
| d          | [3:0] input stream        | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |
| sel        | [1:0] input selector      | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |
| y          | [3:0] output              | 100%          | -                   |    <span style="color: green ;">**Covered**</span>  |




## Cross coverage 

| Cross Coverpoints             | Description              | Coverage Goal | Minimum Hit Count | Coverage Status                                 |
|-------------------------------|--------------------------|---------------|-------------------|-------------------------------------------------|
| input a, input sel            | Input a, sel = 2'bXX     |   100%        |        -          | <span style="color: green ;">**Covered**</span> |
| input b, input sel            | Input b, sel = 2'bXX     |   100%        |        -          | <span style="color: green ;">**Covered**</span> |
| input c, input sel            | Input c, sel = 2'bXX     |   100%        |        -          | <span style="color: green ;">**Covered**</span> |
| input d, input sel            | Input d, sel = 2'bXX     |   100%        |        -          | <span style="color: green ;">**Covered**</span> |
| input d, input sel            | Input d, sel = 2'bXX     |   100%        |        -          | <span style="color: green ;">**Covered**</span> |
| input en, output y            | Input en=1, y = 4'bXXXX  |   100%        |        -          | <span style="color: green ;">**Covered**</span> |




------
[Back to Main](readme.md)