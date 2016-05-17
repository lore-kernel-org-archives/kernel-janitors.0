From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 17 May 2016 14:38:40 +0000
Subject: [PATCH 1/7] snic: fix typo
Message-Id: <1463495926-13728-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Narsimhulu Musini <nmusini@cisco.com>
Cc: kernel-janitors@vger.kernel.org, Sesidhar Baddela <sebaddel@cisco.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

firmare -> firmware

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/snic/snic_fwint.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/snic/snic_fwint.h b/drivers/scsi/snic/snic_fwint.h
index c5f9e19..2a045a5 100644
--- a/drivers/scsi/snic/snic_fwint.h
+++ b/drivers/scsi/snic/snic_fwint.h
@@ -92,7 +92,7 @@ enum snic_io_status {
 }; /* end of enum snic_io_status */
 
 /*
- * snic_io_hdr : host <--> firmare
+ * snic_io_hdr : host <--> firmware
  *
  * for any other message that will be queued to firmware should
  *  have the following request header

