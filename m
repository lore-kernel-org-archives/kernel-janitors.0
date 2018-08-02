From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 02 Aug 2018 08:27:21 +0000
Subject: [PATCH] eeprom: idt_89hpesx: clean up an error pointer vs NULL inconsistency
Message-Id: <20180802082720.calhmn77gmkmcb2d@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huy Duong <qhuyduong@hotmail.com>, Serge Semin <fancer.lancer@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We check for IS_ERR_OR_NULL() here, but later we check the same thing
for NULL only.  It turns out that it can only be NULL so we can make the
checking consistent by removing the ERR_PTR stuff.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 119eb05a5a91..8a4659518c33 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -1128,7 +1128,7 @@ static void idt_get_fw_data(struct idt_89hpesx_dev *pdev)
 
 	device_for_each_child_node(dev, fwnode) {
 		ee_id = idt_ee_match_id(fwnode);
-		if (IS_ERR_OR_NULL(ee_id)) {
+		if (!ee_id) {
 			dev_warn(dev, "Skip unsupported EEPROM device");
 			continue;
 		} else
