From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 06 Jan 2008 03:04:27 +0000
Subject: [PATCH 19/33][SCSI] ibmvscsi: Convert 'Scsi_Cmnd' to 'struct scsi_cmnd'
Message-Id: <20080106030427.30002.30771.sendpatchset@thinktank.campus.ltu.se>
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
Last item before 'drivers/scsi/scsi_typedefs.h' can be removed.


diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 5f2396c..d517f32 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -375,7 +375,7 @@ static int map_sg_list(struct scsi_cmnd *cmd, int nseg,
 
 /**
  * map_sg_data: - Maps dma for a scatterlist and initializes decriptor fields
- * @cmd:	Scsi_Cmnd with the scatterlist
+ * @cmd:	scsi_cmnd with the scatterlist
  * @srp_cmd:	srp_cmd that contains the memory descriptor
  * @dev:	device for which to map dma memory
  *
