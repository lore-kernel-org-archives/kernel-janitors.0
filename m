From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:17 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/mfd/
Message-Id: <1141570937.13183.14.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79519092870209418=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============79519092870209418==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this patch converts drivers/mfd/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/mfd/ucb1x00-core.c.orig	2006-03-05 09:47:31.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/mfd/ucb1x00-core.c	2006-03-05 09:47:41.000000000 +0100
@@ -483,13 +483,11 @@ static int ucb1x00_probe(struct mcp *mcp
 		goto err_disable;
 	}
 
-	ucb = kmalloc(sizeof(struct ucb1x00), GFP_KERNEL);
+	ucb = kzalloc(sizeof(struct ucb1x00), GFP_KERNEL);
 	ret = -ENOMEM;
 	if (!ucb)
 		goto err_disable;
 
-	memset(ucb, 0, sizeof(struct ucb1x00));
-
 	ucb->cdev.class = &ucb1x00_class;
 	ucb->cdev.dev = &mcp->attached_device;
 	strlcpy(ucb->cdev.class_id, "ucb1x00", sizeof(ucb->cdev.class_id));
--- linux-2.6.16-rc5-mm1/drivers/mfd/mcp-core.c.orig	2006-03-05 09:47:50.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/mfd/mcp-core.c	2006-03-05 09:47:59.000000000 +0100
@@ -200,9 +200,8 @@ struct mcp *mcp_host_alloc(struct device
 {
 	struct mcp *mcp;
 
-	mcp = kmalloc(sizeof(struct mcp) + size, GFP_KERNEL);
+	mcp = kzalloc(sizeof(struct mcp) + size, GFP_KERNEL);
 	if (mcp) {
-		memset(mcp, 0, sizeof(struct mcp) + size);
 		spin_lock_init(&mcp->lock);
 		mcp->attached_device.parent = parent;
 		mcp->attached_device.bus = &mcp_bus_type;



--===============79519092870209418==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79519092870209418==--
