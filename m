From: Dan Carpenter <error27@gmail.com>
Date: Wed, 11 Aug 2010 07:38:27 +0000
Subject: [patch 1/2] mvsas: missing goto statement
Message-Id: <20100811073826.GA30429@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: Jiri Slaby <jslaby@suse.cz>, Srinivas <satyasrinivasp@hcl.in>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If mvi_dev is NULL here, then we're supposed return with an error code
but the "goto out" was missing and it could result in a NULL
dereference.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index adedaa9..406246c 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1648,6 +1648,7 @@ int mvs_abort_task(struct sas_task *task)
 	if (!mvi_dev) {
 		mv_printk("%s:%d TMF_RESP_FUNC_FAILED\n", __func__, __LINE__);
 		rc = TMF_RESP_FUNC_FAILED;
+		goto out;
 	}
 
 	mvi = mvi_dev->mvi_info;
