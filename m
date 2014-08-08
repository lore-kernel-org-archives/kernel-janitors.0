From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 Aug 2014 10:07:42 +0000
Subject: =?UTF-8?q?=5BPATCH=201/14=5D=20i2c=3A=20mpc=3A=20delete=20unneeded=20test=20before=20of=5Fnode=5Fput
Message-Id: <1407492475-26283-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Of_node_put supports NULL as its argument, so the initial test is not
necessary.

Suggested by Uwe Kleine-K=C3=B6nig.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

-if (e)
   of_node_put(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/i2c/busses/i2c-mpc.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6a32aa0..0edf630 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -341,8 +341,7 @@ static u32 mpc_i2c_get_sec_cfg_8xxx(void)
 			iounmap(reg);
 		}
 	}
-	if (node)
-		of_node_put(node);
+	of_node_put(node);
=20
 	return val;
 }

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
