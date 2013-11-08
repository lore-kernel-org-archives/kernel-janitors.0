From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Nov 2013 09:45:33 +0000
Subject: [patch] metag: off by one in setup_bootmem_node()
Message-Id: <20131108094533.GD27977@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "nid = MAX_NUMNODES" then we write beyond the end of the node_data[]
array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/metag/mm/numa.c b/arch/metag/mm/numa.c
index 9ae578c..b172aa4 100644
--- a/arch/metag/mm/numa.c
+++ b/arch/metag/mm/numa.c
@@ -34,7 +34,7 @@ void __init setup_bootmem_node(int nid, unsigned long start, unsigned long end)
 	unsigned long pgdat_paddr;
 
 	/* Don't allow bogus node assignment */
-	BUG_ON(nid > MAX_NUMNODES || nid <= 0);
+	BUG_ON(nid >= MAX_NUMNODES || nid <= 0);
 
 	start_pfn = start >> PAGE_SHIFT;
 	end_pfn = end >> PAGE_SHIFT;
