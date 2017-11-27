From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:06:10 +0000
Subject: [PATCH] ambassador: fix incorrect indentation of assignment statement
Message-Id: <20171127130610.10260-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove one extraneous level of indentation on assignment statement.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/ambassador.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/ambassador.c b/drivers/atm/ambassador.c
index dd286ad404f8..9287ec958b70 100644
--- a/drivers/atm/ambassador.c
+++ b/drivers/atm/ambassador.c
@@ -2258,7 +2258,7 @@ static int amb_probe(struct pci_dev *pci_dev,
 
 	PRINTD (DBG_INFO, "registered Madge ATM adapter (no. %d) (%p) at %p",
 		dev->atm_dev->number, dev, dev->atm_dev);
-		dev->atm_dev->dev_data = (void *) dev;
+	dev->atm_dev->dev_data = (void *) dev;
 
 	// register our address
 	amb_esi (dev, dev->atm_dev->esi);
-- 
2.14.1

