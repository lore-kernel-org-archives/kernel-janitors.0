From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 13 Jan 2014 16:12:09 +0000
Subject: [PATCH 4/4] staging: tidspbridge: adjust error return code (bugfix)
Message-Id: <alpine.DEB.2.10.1401131711220.2084@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Omar Ramirez Luna <omar.ramirez@copitl.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The variable status is initialized to either 0 or an error code.  Return
status to propagate the error value.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier i;
constant c;
@@

-T i;
<... when != i
-i = c;
...>
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Most remove functions only return 0, as this one did before the change.  So
perhaps the correct solution is to remove the status variable?

 drivers/staging/tidspbridge/rmgr/drv_interface.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/tidspbridge/rmgr/drv_interface.c b/drivers/staging/tidspbridge/rmgr/drv_interface.c
index cafca46..74d31da 100644
--- a/drivers/staging/tidspbridge/rmgr/drv_interface.c
+++ b/drivers/staging/tidspbridge/rmgr/drv_interface.c
@@ -589,7 +589,7 @@ func_cont:
 		class_destroy(bridge_class);

 	}
-	return 0;
+	return status;
 }

 #ifdef CONFIG_PM

