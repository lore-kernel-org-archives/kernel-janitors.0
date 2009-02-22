From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:01:13 +0000
Subject: [PATCH 02/16] x86,
Message-Id: <20090222000105.17557.49889.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  arch/x86/mm/numa_32.c:197:24: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/mm/numa_32.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/mm/numa_32.c b/arch/x86/mm/numa_32.c
index d1f7439..3957cd6 100644
--- a/arch/x86/mm/numa_32.c
+++ b/arch/x86/mm/numa_32.c
@@ -194,7 +194,7 @@ void *alloc_remap(int nid, unsigned long size)
 	size = ALIGN(size, L1_CACHE_BYTES);
 
 	if (!allocation || (allocation + size) >= node_remap_end_vaddr[nid])
-		return 0;
+		return NULL;
 
 	node_remap_alloc_vaddr[nid] += size;
 	memset(allocation, 0, size);

