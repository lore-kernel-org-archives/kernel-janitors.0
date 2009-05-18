From: Chris Sanford <crsanford@gmail.com>
Date: Mon, 18 May 2009 23:31:21 +0000
Subject: [PATCH] include KERN_* constant in printk calls
Message-Id: <20090518233121.GC3109@chrisubuntu-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: mingo@elte.hu, peterz@infradead.org

Add the KERN_CONT constant to two printk calls.

Signed-off-by: Chris Sanford <crsanford@gmail.com>

---


diff --git a/kernel/sched.c b/kernel/sched.c
index 26efa47..6a2ed16 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -7319,7 +7319,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 	printk(KERN_DEBUG "%*s domain %d: ", level, "", level);
 
 	if (!(sd->flags & SD_LOAD_BALANCE)) {
-		printk("does not load-balance\n");
+		printk(KERN_CONT "does not load-balance\n");
 		if (sd->parent)
 			printk(KERN_ERR "ERROR: !SD_LOAD_BALANCE domain"
 					" has parent");
@@ -7340,7 +7340,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 	printk(KERN_DEBUG "%*s groups:", level + 1, "");
 	do {
 		if (!group) {
-			printk("\n");
+			printk(KERN_CONT "\n");
 			printk(KERN_ERR "ERROR: group is NULL\n");
 			break;
 		}
