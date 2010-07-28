From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 28 Jul 2010 16:40:03 +0000
Subject: [PATCH 05/10] mm: check kmalloc() return value
Message-Id: <1280335203-23305-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Nick Piggin <npiggin@suse.de>, Jan Beulich <jbeulich@novell.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

kmalloc() may fail, if so return -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 mm/vmalloc.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b7e314b..f63684a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2437,8 +2437,11 @@ static int vmalloc_open(struct inode *inode, struct file *file)
 	unsigned int *ptr = NULL;
 	int ret;
 
-	if (NUMA_BUILD)
+	if (NUMA_BUILD) {
 		ptr = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
+		if (ptr = NULL)
+			return -ENOMEM;
+	}
 	ret = seq_open(file, &vmalloc_op);
 	if (!ret) {
 		struct seq_file *m = file->private_data;
-- 
1.7.0.4

