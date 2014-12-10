## Задача

Задача на 10 минут - написать класс, который моделирует поведение тумбочки. Поведение у неё, как выяснилось,
довольно затейливое. Во-первых, открыв один любой ящик, вы блокируете два остальных. Невозможно последовательно
открыть два ящика:

Однако, есть небольшой хак. Можно открыть два ящика одновременно. Для этого нужно ухватиться за оба и аккуратно
потянуть. Оба ящика откроются. Наловчившись, можно одновременно открыть верхний и нижний, оставив средний закрытым.
Третий ящик при этом блокируется. Теперь, вы можете закрывать и открывать открытые ящики - они не будут
блокироваться до тех пор, пока вы не закроете оба одновременно. Тогда тумба вернётся в исходное состояние.

Переходим к самому сложному. Можно аккуратно вытащить три ящика сразу. Тут поведение совсем нестандартное. Если из
положения "все открыты" вы будете вытаскивать и задвигать только один ящик, то он не будет блокироваться. Если закрыть
сразу два, то они будут взаимно блокироваться. То есть, закрыв два из положения "все открыты", вы сможете
последовательно открыть только один, второй будет заблокирован. Однако, вы сможете применить хак из пункта 2 и
аккуратно открыть два одновременно.