From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 06:34:09 +0000
Subject: [patch] fusion: fix error handling of mpt_register()
Message-Id: <20100806063409.GO9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Moore <Eric.Moore@lsi.com>
Cc: support@lsi.com, Alexey Dobriyan <adobriyan@gmail.com>, James Bottomley <James.Bottomley@suse.de>, Kashyap Desai <kashyap.desai@lsi.com>, DL-MPTFusionLinux@lsi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

mpt_register() returns a positive int between 1 and
MPT_MAX_PROTOCOL_DRIVERS.  It returns MPT_MAX_PROTOCOL_DRIVERS if there
is no slot available.  Most places don't check the return but this is
how it's done in mptctl.c as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/message/fusion/mptlan.c b/drivers/message/fusion/mptlan.c
index cbe9607..42affb1 100644
--- a/drivers/message/fusion/mptlan.c
+++ b/drivers/message/fusion/mptlan.c
@@ -1454,7 +1454,7 @@ static int __init mpt_lan_init (void)
 
 	LanCtx = mpt_register(lan_reply, MPTLAN_DRIVER,
 				"lan_reply");
-	if (LanCtx <= 0) {
+	if (LanCtx >= MPT_MAX_PROTOCOL_DRIVERS) {
 		printk (KERN_ERR MYNAM ": Failed to register with MPT base driver\n");
 		return -EBUSY;
 	}
