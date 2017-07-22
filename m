From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Jul 2017 07:33:02 +0000
Subject: [PATCH] tile: array underflow in setup_maxnodemem()
Message-Id: <20170722073302.34qagmx66a6djxsi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@mellanox.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker correctly complains that we should have a lower bound
on "node" to prevent an array underflow.

Fixes: 867e359b97c9 ("arch/tile: core support for Tilera 32-bit chips.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/tile/kernel/setup.c b/arch/tile/kernel/setup.c
index 443a70bccc1c..b1474e7d9afb 100644
--- a/arch/tile/kernel/setup.c
+++ b/arch/tile/kernel/setup.c
@@ -140,7 +140,7 @@ static int __init setup_maxnodemem(char *str)
 {
 	char *endp;
 	unsigned long long maxnodemem;
-	long node;
+	unsigned long node;
 
 	node = str ? simple_strtoul(str, &endp, 0) : INT_MAX;
 	if (node >= MAX_NUMNODES || *endp != ':')
