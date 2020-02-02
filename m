From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 02 Feb 2020 14:23:41 +0000
Subject: [PATCH] defxx: Fix a sentinel at the end of a 'eisa_device_id' structure
Message-Id: <20200202142341.22124-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: macro@linux-mips.org, ralf@linux-mips.org, davem@davemloft.net, akpm@linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'struct eisa_device_id' must be ended by an empty string, not a NULL
pointer. Otherwise, a NULL pointer dereference may occur in
'eisa_bus_match()'.

Also convert some spaces to tab to please 'checkpatch.pl'.

Fixes: e89a2cfb7d7b ("[TC] defxx: TURBOchannel support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/fddi/defxx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/fddi/defxx.c b/drivers/net/fddi/defxx.c
index 077c68498f04..7ef0c57f07c6 100644
--- a/drivers/net/fddi/defxx.c
+++ b/drivers/net/fddi/defxx.c
@@ -3768,11 +3768,11 @@ static void dfx_pci_unregister(struct pci_dev *pdev)
 
 #ifdef CONFIG_EISA
 static const struct eisa_device_id dfx_eisa_table[] = {
-        { "DEC3001", DEFEA_PROD_ID_1 },
-        { "DEC3002", DEFEA_PROD_ID_2 },
-        { "DEC3003", DEFEA_PROD_ID_3 },
-        { "DEC3004", DEFEA_PROD_ID_4 },
-        { }
+	{ "DEC3001", DEFEA_PROD_ID_1 },
+	{ "DEC3002", DEFEA_PROD_ID_2 },
+	{ "DEC3003", DEFEA_PROD_ID_3 },
+	{ "DEC3004", DEFEA_PROD_ID_4 },
+	{ "" }
 };
 MODULE_DEVICE_TABLE(eisa, dfx_eisa_table);
 
-- 
2.20.1
