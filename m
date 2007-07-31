From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:03:44 +0000
Subject: [PATCH 71] kernel/sched.c: kmalloc + memset conversion to kcalloc
Message-Id: <200708010003.45279.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, gregkh@suse.de

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 kernel/sched.c | 166559 -> 166517 (-42 bytes)
 kernel/sched.o | 445965 -> 445941 (-24 bytes)

 kernel/sched.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/kernel/sched.c	2007-07-26 13:07:44.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/kernel/sched.c	2007-07-31 15:10:55.000000000 +0200
@@ -5167,10 +5167,10 @@ static struct ctl_table sd_ctl_root[] 
 static struct ctl_table *sd_alloc_ctl_entry(int n)
 {
-	struct ctl_table *entry -		kmalloc(n * sizeof(struct ctl_table), GFP_KERNEL);
+	struct ctl_table *entry;
+
+	entry = kcalloc(n, sizeof(struct ctl_table), GFP_KERNEL);
 	BUG_ON(!entry);
-	memset(entry, 0, n * sizeof(struct ctl_table));
 	return entry;
 }

