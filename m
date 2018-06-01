From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Jun 2018 13:48:56 +0000
Subject: [PATCH] mailbox: PCC: make struct pcc_mbox_driver static
Message-Id: <20180601134856.13322-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure pcc_mbox_driver is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
drivers/mailbox/pcc.c:576:24: warning: symbol 'pcc_mbox_driver' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/pcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index fc3c237daef2..26976554372b 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -573,7 +573,7 @@ static int pcc_mbox_probe(struct platform_device *pdev)
 	return ret;
 }
 
-struct platform_driver pcc_mbox_driver = {
+static struct platform_driver pcc_mbox_driver = {
 	.probe = pcc_mbox_probe,
 	.driver = {
 		.name = "PCCT",
-- 
2.17.0

