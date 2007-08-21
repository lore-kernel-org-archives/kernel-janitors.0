From: Shaun Zinck <shaun.zinck@gmail.com>
Date: Tue, 21 Aug 2007 04:03:20 +0000
Subject: [PATCH] video/geode: fix warnings
Message-Id: <20070820230320.6741bb15@shaun>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove the double declaration of variable 'opt'.

Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
---
This is my first patch so I mostly wanted to make sure I got the formatting right.
Does this look OK?

diff --git a/drivers/video/geode/lxfb_core.c b/drivers/video/geode/lxfb_core.c
index 5e30b40..67d6bf6 100644
--- a/drivers/video/geode/lxfb_core.c
+++ b/drivers/video/geode/lxfb_core.c
@@ -559,12 +559,10 @@ static struct pci_driver lxfb_driver = {
 };
 
 #ifndef MODULE
 static int __init lxfb_setup(char *options)
 {
-	char *opt;
-
 	if (!options || !*options)
 		return 0;
 
 	while (1) {
 		char *opt = strsep(&options, ",");
