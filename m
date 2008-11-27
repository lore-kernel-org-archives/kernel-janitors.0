From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 27 Nov 2008 22:23:38 +0000
Subject: [PATCH] alim15x3: fix sparse warning
Message-Id: <493049e1.0ab6660a.0bc3.ffffaf3b@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-kernel@vger.kernel.org

Fix this sparse warning:

  drivers/ide/alim15x3.c:594:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/ide/alim15x3.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ide/alim15x3.c b/drivers/ide/alim15x3.c
index e56c7b7..45d2356 100644
--- a/drivers/ide/alim15x3.c
+++ b/drivers/ide/alim15x3.c
@@ -591,7 +591,7 @@ static int __init ali15x3_ide_init(void)
 
 static void __exit ali15x3_ide_exit(void)
 {
-	return pci_unregister_driver(&alim15x3_pci_driver);
+	pci_unregister_driver(&alim15x3_pci_driver);
 }
 
 module_init(ali15x3_ide_init);
-- 
1.5.6.3

