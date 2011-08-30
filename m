From: "Nandigama, Nagalakshmi" <Nagalakshmi.Nandigama@lsi.com>
Date: Tue, 30 Aug 2011 10:48:34 +0000
Subject: RE: [patch] [SCSI] mptfusion: unlock on error in mpt_config()
Message-Id: <A6888A6805518E4EA4AF7072A28264A6042AD54397@inbmail02.lsi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110827095930.GK3775@shale.localdomain>
In-Reply-To: <20110827095930.GK3775@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, "Moore, Eric" <Eric.Moore@lsi.com>, "Desai, Kashyap" <Kashyap.Desai@lsi.com>
Cc: Support <support@lsi.com>, DL-MPT Fusion Linux <DL-MPTFusionLinux@lsi.com>, "open list:LSILOGIC MPT FUSI..." <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

The patch seem to be fine. Please consider this patch as Acked-by: "Nandigama, Nagalakshmi" <Nagalakshmi.Nandigama@lsi.com>


Regards,
Nagalakshmi


-----Original Message-----
From: Dan Carpenter [mailto:error27@gmail.com] 
Sent: Saturday, August 27, 2011 3:30 PM
To: Moore, Eric; Desai, Kashyap
Cc: Support; DL-MPT Fusion Linux; open list:LSILOGIC MPT FUSI...; kernel-janitors@vger.kernel.org
Subject: [patch] [SCSI] mptfusion: unlock on error in mpt_config()

We introduced a new return here and forgot to unlock the mutex.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
index e9c6a60..e72320e 100644
--- a/drivers/message/fusion/mptbase.c
+++ b/drivers/message/fusion/mptbase.c
@@ -6482,6 +6482,7 @@ mpt_config(MPT_ADAPTER *ioc, CONFIGPARMS *pCfg)
 				printk(MYIOC_s_INFO_FMT "%s: host reset in"
 					" progress mpt_config timed out.!!\n",
 					__func__, ioc->name);
+				mutex_unlock(&ioc->mptbase_cmds.mutex);
 				return -EFAULT;
 			}
 			spin_unlock_irqrestore(&ioc->taskmgmt_lock, flags);
