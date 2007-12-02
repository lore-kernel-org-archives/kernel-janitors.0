From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Dec 2007 20:06:54 +0000
Subject: [PATCH 3/3] drivers/serial/uartlite.c: Add missing of_node_put
Message-Id: <Pine.LNX.4.64.0712022105480.3361@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jacmet@sunsite.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There should be an of_node_put when breaking out of a loop that iterates
using for_each_compatible_node.

This was detected and fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
identifier d;
type T;
expression e;
iterator for_each_compatible_node;
@@

T *d;
...
for_each_compatible_node(d,...)
  {... when != of_node_put(d)
       when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/serial/uartlite.c b/drivers/serial/uartlite.c
--- a/drivers/serial/uartlite.c 2007-11-12 10:35:57.000000000 +0100
+++ b/drivers/serial/uartlite.c 2007-12-02 17:43:57.000000000 +0100
@@ -393,6 +393,7 @@ static inline void __init ulite_console_
 			continue;
 
 		ulite_ports[id].mapbase = res.start;
+		of_node_put(np);
 		return;
 	}
 }
