From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Apr 2020 10:20:13 +0000
Subject: [PATCH][next] scsi: qla2xxx: make 1 bit bit-fields unsigned int
Message-Id: <20200428102013.1040598-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Arun Easi <aeasi@marvell.com>, Himanshu Madhani <himanshu.madhani@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The bitfields mpi_fw_dump_reading and mpi_fw_dumped are currently signed
which is not recommended as the representation is an implementation defined
behaviour.  Fix this by making the bit-fields unsigned ints.

Fixes: cbb01c2f2f63 ("scsi: qla2xxx: Fix MPI failure AEN (8200) handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/qla2xxx/qla_def.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/qla2xxx/qla_def.h b/drivers/scsi/qla2xxx/qla_def.h
index daa9e936887b..172ea4e5887d 100644
--- a/drivers/scsi/qla2xxx/qla_def.h
+++ b/drivers/scsi/qla2xxx/qla_def.h
@@ -4248,8 +4248,8 @@ struct qla_hw_data {
 	int		fw_dump_reading;
 	void		*mpi_fw_dump;
 	u32		mpi_fw_dump_len;
-	int		mpi_fw_dump_reading:1;
-	int		mpi_fw_dumped:1;
+	unsigned int	mpi_fw_dump_reading:1;
+	unsigned int	mpi_fw_dumped:1;
 	int		prev_minidump_failed;
 	dma_addr_t	eft_dma;
 	void		*eft;
-- 
2.25.1
