From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:05:34 +0000
Subject: [PATCH 14/16] memcg: fix sparse warning: Using plain integer as NULL
Message-Id: <20090222000532.17557.52930.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  mm/memcontrol.c:1637:32: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 mm/memcontrol.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 8e4be9c..09d6650 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1634,7 +1634,7 @@ static int mem_cgroup_force_empty_list(struct mem_cgroup *mem,
 		pc = list_entry(list->prev, struct page_cgroup, lru);
 		if (busy = pc) {
 			list_move(&pc->lru, list);
-			busy = 0;
+			busy = NULL;
 			spin_unlock_irqrestore(&zone->lru_lock, flags);
 			continue;
 		}

