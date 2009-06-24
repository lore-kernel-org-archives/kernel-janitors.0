From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Wed, 24 Jun 2009 11:22:57 +0000
Subject: [PATCH] scsi: adding __init/__exit macros to ibmvstgt.c
Message-Id: <200906241322.58136.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, James.Bottomley@hansenpartnership.com, fujita.tomonori@lab.ntt.co.jp, akpm@linux-foundation.org, harvey.harrison@gmail.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, peterhuewe@gmx.de

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions from drivers/scsi/ibmvscsi/ibmvstgt.c
linux version 2.6.30 - linus git tree.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
I'm sorry if you receive this message twice - but my first message does 
not seemto be delivered to any of the mailing lists.
diff --git a/drivers/scsi/ibmvscsi/ibmvstgt.c b/drivers/scsi/ibmvscsi/ibmvstgt.c
index d5eaf97..30a25da 100644
--- a/drivers/scsi/ibmvscsi/ibmvstgt.c
+++ b/drivers/scsi/ibmvscsi/ibmvstgt.c
@@ -955,7 +955,7 @@ static struct srp_function_template ibmvstgt_transport_functions = {
 	.it_nexus_response = ibmvstgt_it_nexus_response,
 };
 
-static int ibmvstgt_init(void)
+static int __init ibmvstgt_init(void)
 {
 	int err = -ENOMEM;
 
@@ -986,7 +986,7 @@ release_transport:
 	return err;
 }
 
-static void ibmvstgt_exit(void)
+static void __exit ibmvstgt_exit(void)
 {
 	printk("Unregister IBM virtual SCSI driver\n");
 
