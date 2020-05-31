From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 31 May 2020 10:06:03 +0000
Subject: [PATCH] MIPS: ralink: bootrom: mark a function as __init to save some memory
Message-Id: <20200531100603.597847-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: john@phrozen.org, tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'bootrom_setup()' is only called via 'postcore_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/mips/ralink/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/bootrom.c b/arch/mips/ralink/bootrom.c
index 88bcce59beeb..94ca8379b83c 100644
--- a/arch/mips/ralink/bootrom.c
+++ b/arch/mips/ralink/bootrom.c
@@ -31,7 +31,7 @@ static const struct file_operations bootrom_file_ops = {
 	.release	= single_release,
 };
 
-static int bootrom_setup(void)
+static int __init bootrom_setup(void)
 {
 	debugfs_create_file("bootrom", 0444, NULL, NULL, &bootrom_file_ops);
 	return 0;
-- 
2.25.1
