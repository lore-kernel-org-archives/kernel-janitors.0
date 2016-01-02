From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jan 2016 20:56:31 +0000
Subject: [PATCH 3/3] NFC-mei_phy: Delete an unnecessary variable initialisation in mei_nfc_if_version()
Message-Id: <5688397F.50701@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56883849.2080304@users.sourceforge.net>
In-Reply-To: <56883849.2080304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Jan 2016 21:40:10 +0100

Omit explicit initialisation at the beginning for one local variable
that is redefined before its first use.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/nfc/mei_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 3c74028..99fd87d 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -105,7 +105,7 @@ static int mei_nfc_if_version(struct nfc_mei_phy *phy)
 {
 
 	struct mei_nfc_cmd cmd;
-	struct mei_nfc_reply *reply = NULL;
+	struct mei_nfc_reply *reply;
 	struct mei_nfc_if_version *version;
 	size_t if_version_length;
 	int bytes_recv, r;
-- 
2.6.3

