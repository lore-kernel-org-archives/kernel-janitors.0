From: Julia Lawall <julia@diku.dk>
Date: Fri, 07 Aug 2009 07:00:34 +0000
Subject: Re: [PATCH 1/3] arch/powerpc: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0908070859540.20445@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908062203380.19100@ask.diku.dk>
	<4A7BCAF1.5070605@uw.no>
In-Reply-To: <4A7BCAF1.5070605@uw.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel K." <dk@uw.no>
Cc: kernel-janitors@vger.kernel.org, paulus@samba.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

From: Julia Lawall <julia@diku.dk>

Check that the result of kmalloc/kzalloc is not NULL before dereferencing it.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/sysdev/fsl_rio.c       |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index cbb3bed..757a83f 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -1057,6 +1057,10 @@ int fsl_rio_setup(struct of_device *dev)
 			law_start, law_size);
 
 	ops = kmalloc(sizeof(struct rio_ops), GFP_KERNEL);
+	if (!ops) {
+		rc = -ENOMEM;
+		goto err_ops;
+	}
 	ops->lcread = fsl_local_config_read;
 	ops->lcwrite = fsl_local_config_write;
 	ops->cread = fsl_rio_config_read;
@@ -1064,6 +1068,10 @@ int fsl_rio_setup(struct of_device *dev)
 	ops->dsend = fsl_rio_doorbell_send;
 
 	port = kzalloc(sizeof(struct rio_mport), GFP_KERNEL);
+	if (!port) {
+		rc = -ENOMEM;
+		goto err_port;
+	}
 	port->id = 0;
 	port->index = 0;
 
@@ -1071,7 +1079,7 @@ int fsl_rio_setup(struct of_device *dev)
 	if (!priv) {
 		printk(KERN_ERR "Can't alloc memory for 'priv'\n");
 		rc = -ENOMEM;
-		goto err;
+		goto err_priv;
 	}
 
 	INIT_LIST_HEAD(&port->dbells);
@@ -1169,11 +1177,13 @@ int fsl_rio_setup(struct of_device *dev)
 
 	return 0;
 err:
-	if (priv)
-		iounmap(priv->regs_win);
-	kfree(ops);
+	iounmap(priv->regs_win);
 	kfree(priv);
+err_priv:
 	kfree(port);
+err_port:
+	kfree(ops);
+err_ops:
 	return rc;
 }
 
