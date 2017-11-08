From: Colin King <colin.king@canonical.com>
Date: Wed, 08 Nov 2017 13:46:36 +0000
Subject: [PATCH] USB: host: whci: remove redundant variable t
Message-Id: <20171108134636.27026-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable t is assigned but never read, it is redundant and therefore
can be removed. Cleans up clang warning:

drivers/usb/host/whci/asl.c:106:3: warning: Value stored to 't' is
never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/whci/asl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/whci/asl.c b/drivers/usb/host/whci/asl.c
index c5ac9efb076a..276fb34c8efd 100644
--- a/drivers/usb/host/whci/asl.c
+++ b/drivers/usb/host/whci/asl.c
@@ -90,9 +90,7 @@ static uint32_t process_qset(struct whc *whc, struct whc_qset *qset)
 
 	while (qset->ntds) {
 		struct whc_qtd *td;
-		int t;
 
-		t = qset->td_start;
 		td = &qset->qtd[qset->td_start];
 		status = le32_to_cpu(td->status);
 
-- 
2.14.1

