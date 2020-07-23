From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jul 2020 14:26:14 +0000
Subject: [PATCH] scsi: isci: remove redundant initialization of variable status
Message-Id: <20200723142614.991416-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206141236.31651-1-colin.king@canonical.com>
In-Reply-To: <20180206141236.31651-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Intel SCU Linux support <intel-linux-scu@intel.com>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/isci/request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/isci/request.c b/drivers/scsi/isci/request.c
index 343d24c7e788..6561a07db189 100644
--- a/drivers/scsi/isci/request.c
+++ b/drivers/scsi/isci/request.c
@@ -3444,7 +3444,7 @@ struct isci_request *isci_tmf_request_from_tag(struct isci_host *ihost,
 int isci_request_execute(struct isci_host *ihost, struct isci_remote_device *idev,
 			 struct sas_task *task, u16 tag)
 {
-	enum sci_status status = SCI_FAILURE_UNSUPPORTED_PROTOCOL;
+	enum sci_status status;
 	struct isci_request *ireq;
 	unsigned long flags;
 	int ret = 0;
-- 
2.27.0
