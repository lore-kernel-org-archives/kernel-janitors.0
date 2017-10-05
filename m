From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 09:47:12 +0000
Subject: [PATCH] NFC: fdp: make struct nci_ops static
Message-Id: <20171005094712.28627-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David S . Miller" <davem@davemloft.net>, Stephen Hemminger <stephen@networkplumber.org>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure nci_ops is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warning:
symbol 'nci_ops' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index ec50027b0d8b..d5784a47fc13 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -726,7 +726,7 @@ static struct nci_driver_ops fdp_prop_ops[] = {
 	},
 };
 
-struct nci_ops nci_ops = {
+static struct nci_ops nci_ops = {
 	.open = fdp_nci_open,
 	.close = fdp_nci_close,
 	.send = fdp_nci_send,
-- 
2.14.1

