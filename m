From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Feb 2019 13:20:36 +0000
Subject: [PATCH 05/12] tee: optee: add missing of_node_put after of_device_is_available
Message-Id: <1550928043-14889-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Add an of_node_put when a tested device node is not available.

The semantic patch that fixes this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
identifier f;
local idexpression e;
expression x;
@@

e = f(...);
... when != of_node_put(e)
    when != x = e
    when != e = x
    when any
if (<+...of_device_is_available(e)...+>) {
  ... when != of_node_put(e)
(
  return e;
|
+ of_node_put(e);
  return ...;
)
}
// </smpl>

Fixes: db878f76b9ff ("tee: optee: take DT status property into account")
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tee/optee/core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff -u -p a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -703,8 +703,10 @@ static int __init optee_driver_init(void
 		return -ENODEV;
 
 	np = of_find_matching_node(fw_np, optee_match);
-	if (!np || !of_device_is_available(np))
+	if (!np || !of_device_is_available(np)) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	optee = optee_probe(np);
 	of_node_put(np);
