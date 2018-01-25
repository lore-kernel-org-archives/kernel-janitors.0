From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jan 2018 14:27:27 +0000
Subject: [PATCH] mptfusion: Add bounds check in mptctl_hp_targetinfo()
Message-Id: <20180125142727.GA23945@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>
Cc: Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains about an out of bounds read:

    drivers/message/fusion/mptctl.c:2786 mptctl_hp_targetinfo()
    error: buffer overflow 'hd->sel_timeout' 255 <= u32max.

It's true that we probably should have a bounds check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mptctl.c
index 8d12017b9893..4470630dd545 100644
--- a/drivers/message/fusion/mptctl.c
+++ b/drivers/message/fusion/mptctl.c
@@ -2687,6 +2687,8 @@ mptctl_hp_targetinfo(unsigned long arg)
 				__FILE__, __LINE__, iocnum);
 		return -ENODEV;
 	}
+	if (karg.hdr.id >= MPT_MAX_FC_DEVICES)
+		return -EINVAL;
 	dctlprintk(ioc, printk(MYIOC_s_DEBUG_FMT "mptctl_hp_targetinfo called.\n",
 	    ioc->name));
 
