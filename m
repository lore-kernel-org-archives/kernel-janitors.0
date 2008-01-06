From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:05:38 +0000
Subject: [PATCH 33a/33] include/scsi/scsi_tcq.h: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030538.30002.11018.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20080106030250.30002.96493.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@SteelEye.com
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Convert the typedef'ed 'Scsi_Cmnd' to 'struct scsi_cmnd'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---


diff --git a/include/scsi/scsi_tcq.h b/include/scsi/scsi_tcq.h
index cf4c219..341ed5a 100644
--- a/include/scsi/scsi_tcq.h
+++ b/include/scsi/scsi_tcq.h
@@ -86,7 +86,7 @@ static inline void scsi_deactivate_tcq(struct scsi_device *sdev, int depth)
 
 /**
  * scsi_populate_tag_msg - place a tag message in a buffer
- * @SCpnt:	pointer to the Scsi_Cmnd for the tag
+ * @SCpnt:	pointer to the scsi_cmnd for the tag
  * @msg:	pointer to the area to place the tag
  *
  * Notes:
