From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 09:56:33 +0000
Subject: [PATCH] percpu: Fix a typo
Message-Id: <20190721095633.10979-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dennis@kernel.org, tj@kernel.org, cl@linux.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/perpcu/percpu/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 mm/percpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index 9821241fdede..febf7c7c888e 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -2220,7 +2220,7 @@ static void pcpu_dump_alloc_info(const char *lvl,
  * @base_addr: mapped address
  *
  * Initialize the first percpu chunk which contains the kernel static
- * perpcu area.  This function is to be called from arch percpu area
+ * percpu area.  This function is to be called from arch percpu area
  * setup path.
  *
  * @ai contains all information necessary to initialize the first
-- 
2.20.1
