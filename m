From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Dec 2011 06:35:39 +0000
Subject: [patch] nfc: signedness bug in __nci_request()
Message-Id: <20111209063539.GA20287@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, Ilan Elias <ilane@ti.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

wait_for_completion_interruptible_timeout() returns -ERESTARTSYS if
interrupted so completion_rc needs to be signed.  The current code
probably returns -ETIMEDOUT if we hit this situation, but after this
patch is applied it will return -ERESTARTSYS.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 37de28e..c55f233 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -71,7 +71,7 @@ static int __nci_request(struct nci_dev *ndev,
 	__u32 timeout)
 {
 	int rc = 0;
-	unsigned long completion_rc;
+	long completion_rc;
 
 	ndev->req_status = NCI_REQ_PEND;
 
