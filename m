From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Mar 2017 10:52:53 +0000
Subject: [PATCH 2/2] switchtec: fix some error codes
Message-Id: <20170313105253.GB24989@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>
Cc: Stephen Bates <stephen.bates@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

We shouldn't be changing these negative error codes to positive.

Fixes: dbdb73b1e2c0 ("MicroSemi Switchtec management interface driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index 82ae08956457..fcde98161d9a 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -656,7 +656,7 @@ static ssize_t switchtec_dev_write(struct file *filp, const char __user *data,
 
 	rc = lock_mutex_and_test_alive(stdev);
 	if (rc)
-		return -rc;
+		return rc;
 
 	if (stuser->state != MRPC_IDLE) {
 		rc = -EBADE;
@@ -700,7 +700,7 @@ static ssize_t switchtec_dev_read(struct file *filp, char __user *data,
 
 	rc = lock_mutex_and_test_alive(stdev);
 	if (rc)
-		return -rc;
+		return rc;
 
 	if (stuser->state = MRPC_IDLE) {
 		mutex_unlock(&stdev->mrpc_mutex);
@@ -722,7 +722,7 @@ static ssize_t switchtec_dev_read(struct file *filp, char __user *data,
 
 	rc = lock_mutex_and_test_alive(stdev);
 	if (rc)
-		return -rc;
+		return rc;
 
 	if (stuser->state != MRPC_DONE) {
 		mutex_unlock(&stdev->mrpc_mutex);
