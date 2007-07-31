From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:14:57 +0000
Subject: [PATCH 78] fs/proc/vmcore.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010014.58099.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, gregkh@suse.de

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/proc/vmcore.c | 16780 -> 16727 (-53 bytes)
 fs/proc/vmcore.o | 113032 -> 112744 (-288 bytes)

 fs/proc/vmcore.c |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/proc/vmcore.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/proc/vmcore.c	2007-07-31 15:51:05.000000000 +0200
@@ -178,12 +178,7 @@ const struct file_operations proc_vmcore

 static struct vmcore* __init get_new_element(void)
 {
-	struct vmcore *p;
-
-	p = kmalloc(sizeof(*p), GFP_KERNEL);
-	if (p)
-		memset(p, 0, sizeof(*p));
-	return p;
+	return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
 }

 static u64 __init get_vmcore_size_elf64(char *elfptr)
