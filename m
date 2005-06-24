From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 24 Jun 2005 10:56:49 +0000
Subject: [KJ] [PATCH] sizeof(*dev) : arch/arm/common/sa1111.c
Message-Id: <20050624105649.GH5023@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22001786917861099=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22001786917861099==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
when using sizeof consider using the variable and not the type, that way
if the type of the variable is changed we don't have to go seaching
all instances of sizeof(type).

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

diff -urpN -X dontdiff 2.6.12-orig/arch/arm/common/sa1111.c 2.6.12/arch/arm/common/sa1111.c
--- 2.6.12-orig/arch/arm/common/sa1111.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/arch/arm/common/sa1111.c	2005-06-24 11:57:54.819080152 +0200
@@ -543,12 +543,12 @@ sa1111_init_one_child(struct sa1111 *sac
 	struct sa1111_dev *dev;
 	int ret;
 
-	dev = kmalloc(sizeof(struct sa1111_dev), GFP_KERNEL);
+	dev = kmalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	memset(dev, 0, sizeof(struct sa1111_dev));
+	memset(dev, 0, sizeof(*dev));
 
 	snprintf(dev->dev.bus_id, sizeof(dev->dev.bus_id),
 		 "%4.4lx", info->offset);
@@ -623,11 +623,11 @@ __sa1111_probe(struct device *me, struct
 	unsigned int has_devs, val;
 	int i, ret = -ENODEV;
 
-	sachip = kmalloc(sizeof(struct sa1111), GFP_KERNEL);
+	sachip = kmalloc(sizeof(*sachip), GFP_KERNEL);
 	if (!sachip)
 		return -ENOMEM;
 
-	memset(sachip, 0, sizeof(struct sa1111));
+	memset(sachip, 0, sizeof(*sachip));
 
 	spin_lock_init(&sachip->lock);
 
@@ -811,7 +811,7 @@ static int sa1111_suspend(struct device 
 	if (level != SUSPEND_DISABLE)
 		return 0;
 
-	save = kmalloc(sizeof(struct sa1111_save_data), GFP_KERNEL);
+	save = kmalloc(sizeof(*save), GFP_KERNEL);
 	if (!save)
 		return -ENOMEM;
 	dev->power.saved_state = save;

--===============22001786917861099==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22001786917861099==--
