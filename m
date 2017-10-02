From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Oct 2017 22:33:22 +0000
Subject: [PATCH] mailbox: pcc: make structure pcc_mbox_driver static
Message-Id: <20171002223322.12073-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure pcc_mbox_driver is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'pcc_mbox_driver' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/pcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 9b7005e1345e..90ad0fa03ca2 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -579,7 +579,7 @@ static int pcc_mbox_probe(struct platform_device *pdev)
 	return ret;
 }
 
-struct platform_driver pcc_mbox_driver = {
+static struct platform_driver pcc_mbox_driver = {
 	.probe = pcc_mbox_probe,
 	.driver = {
 		.name = "PCCT",
-- 
2.14.1

