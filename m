From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:14 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/rapidio
Message-Id: <1141570934.13183.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13467704254878576=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============13467704254878576==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/rapidio to kzalloc usage.
Not tested.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/rapidio/rio-scan.c.orig	2006-03-05 11:22:20.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/rapidio/rio-scan.c	2006-03-05 11:22:35.000000000 +0100
@@ -298,11 +298,10 @@ static struct rio_dev *rio_setup_device(
 	struct rio_switch *rswitch;
 	int result, rdid;
 
-	rdev = kmalloc(sizeof(struct rio_dev), GFP_KERNEL);
+	rdev = kzalloc(sizeof(struct rio_dev), GFP_KERNEL);
 	if (!rdev)
 		goto out;
 
-	memset(rdev, 0, sizeof(struct rio_dev));
 	rdev->net = net;
 	rio_mport_read_config_32(port, destid, hopcount, RIO_DEV_ID_CAR,
 				 &result);
@@ -785,9 +784,8 @@ static struct rio_net __devinit *rio_all
 {
 	struct rio_net *net;
 
-	net = kmalloc(sizeof(struct rio_net), GFP_KERNEL);
+	net = kzalloc(sizeof(struct rio_net), GFP_KERNEL);
 	if (net) {
-		memset(net, 0, sizeof(struct rio_net));
 		INIT_LIST_HEAD(&net->node);
 		INIT_LIST_HEAD(&net->devices);
 		INIT_LIST_HEAD(&net->mports);



--===============13467704254878576==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13467704254878576==--
