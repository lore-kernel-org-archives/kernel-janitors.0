From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:48:00 +0000
Subject: [PATCH v2 08/10] staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
In-Reply-To: <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Aug 2016 21:56:15 +0200

Prefer usage of the macro "pr_err" over the interface "printk".
Fix a typo in an error message.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on the source files from Linux next-20160809.

 drivers/staging/ks7010/ks7010_sdio.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 634ef42..bfca6a7 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -998,11 +998,11 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	/* private memory allocate */
 	netdev = alloc_etherdev(sizeof(*priv));
 	if (netdev = NULL) {
-		printk(KERN_ERR "ks7010 : Unable to alloc new net device\n");
+		pr_err(pr_fmt("Unable to alloc new net device\n"));
 		goto release_irq;
 	}
 	if (dev_alloc_name(netdev, "wlan%d") < 0) {
-		printk(KERN_ERR "ks7010 :  Couldn't get name!\n");
+		pr_err(pr_fmt("Couldn't get name!\n"));
 		goto free_dev;
 	}
 
@@ -1042,8 +1042,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	/* Upload firmware */
 	ret = ks7010_upload_firmware(priv, card);	/* firmware load */
 	if (ret) {
-		printk(KERN_ERR
-		       "ks7010: firmware load failed !! retern code = %d\n",
+		pr_err(pr_fmt("firmware load failed! return code = %d\n"),
 		       ret);
 		goto free_buf;
 	}
-- 
2.9.2

