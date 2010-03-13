From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Mar 2010 14:56:21 +0000
Subject: [patch] memcontrol: fix potential null deref
Message-Id: <20100313145621.GA3569@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kamezawa.hiroyu@jp.fujitsu.com
Cc: Daisuke Nishimura <nishimura@mxp.nes.nec.co.jp>, Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Balbir Singh <balbir@linux.vnet.ibm.com>

There was a potential null deref introduced in:
c62b1a3b31b5 memcg: use generic percpu instead of private implementation

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 7973b52..e1e0996 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -3691,8 +3691,10 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
 	else
 		mem = vmalloc(size);
 
-	if (mem)
-		memset(mem, 0, size);
+	if (!mem)
+		return NULL;
+
+	memset(mem, 0, size);
 	mem->stat = alloc_percpu(struct mem_cgroup_stat_cpu);
 	if (!mem->stat) {
 		if (size < PAGE_SIZE)
