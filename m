From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Dec 2018 09:19:36 +0000
Subject: [PATCH][misc-next] misc: cardreader: fix spelling mistake "invailid" -> "invalid"
Message-Id: <20181206091936.11871-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleksij Rempel <linux@rempel-privat.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in a couple of dev_dbg messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/cardreader/alcor_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
index 6872b8e29b4d..bcb10fa4bc3a 100644
--- a/drivers/misc/cardreader/alcor_pci.c
+++ b/drivers/misc/cardreader/alcor_pci.c
@@ -105,7 +105,7 @@ static int alcor_pci_find_cap_offset(struct alcor_pci_priv *priv,
 	while (1) {
 		pci_read_config_dword(pci, where, &val32);
 		if (val32 = 0xffffffff) {
-			dev_dbg(priv->dev, "find_cap_offset invailid value %x.\n",
+			dev_dbg(priv->dev, "find_cap_offset invalid value %x.\n",
 				val32);
 			return 0;
 		}
@@ -116,7 +116,7 @@ static int alcor_pci_find_cap_offset(struct alcor_pci_priv *priv,
 		}
 
 		if ((val32 & 0xff00) = 0x00) {
-			dev_dbg(priv->dev, "pci_find_cap_offset invailid value %x.\n",
+			dev_dbg(priv->dev, "pci_find_cap_offset invalid value %x.\n",
 				val32);
 			break;
 		}
-- 
2.19.1
