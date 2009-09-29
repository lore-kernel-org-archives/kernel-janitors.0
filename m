From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Tue, 29 Sep 2009 01:24:55 +0000
Subject: [PATCH] hid: adding __init/__exit macros to twinhan.c
Message-Id: <200909290324.56042.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907021908.39275.PeterHuewe@gmx.de>
In-Reply-To: <200907021908.39275.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: Bruno Premont <bonbons@linux-vserver.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of the twinhan driver in hid.

Jiri, I guess this time you can decide wether it's the hid or the trivial 
tree ;) - thanks jiri for all your patience and work!

linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/hid/hid-twinhan.c b/drivers/hid/hid-twinhan.c
index b05f602..c40afc5 100644
--- a/drivers/hid/hid-twinhan.c
+++ b/drivers/hid/hid-twinhan.c
@@ -132,12 +132,12 @@ static struct hid_driver twinhan_driver = {
 	.input_mapping = twinhan_input_mapping,
 };
 
-static int twinhan_init(void)
+static int __init twinhan_init(void)
 {
 	return hid_register_driver(&twinhan_driver);
 }
 
-static void twinhan_exit(void)
+static void __exit twinhan_exit(void)
 {
 	hid_unregister_driver(&twinhan_driver);
 }
