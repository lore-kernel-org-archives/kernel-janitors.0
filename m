From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:43:01 +0000
Subject: [PATCH] USB: host: whci: remove redundant variable t
Message-Id: <20180713094301.18585-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable t is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 't' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/whci/pzl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/whci/pzl.c b/drivers/usb/host/whci/pzl.c
index bb84366f7bd3..ef52aeb02fde 100644
--- a/drivers/usb/host/whci/pzl.c
+++ b/drivers/usb/host/whci/pzl.c
@@ -96,9 +96,7 @@ static enum whc_update pzl_process_qset(struct whc *whc, struct whc_qset *qset)
 
 	while (qset->ntds) {
 		struct whc_qtd *td;
-		int t;
 
-		t = qset->td_start;
 		td = &qset->qtd[qset->td_start];
 		status = le32_to_cpu(td->status);
 
-- 
2.17.1

