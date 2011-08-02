From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:35:03 +0000
Subject: [PATCH 10/11] arch/openrisc/mm/init.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-11-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Bonn <jonas@southpole.se>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@openrisc.net, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/openrisc/mm/init.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
--- a/arch/openrisc/mm/init.c
+++ b/arch/openrisc/mm/init.c
@@ -222,8 +222,7 @@ void __init mem_init(void)
 {
 	int codesize, reservedpages, datasize, initsize;
 
-	if (!mem_map)
-		BUG();
+	BUG_ON(!mem_map);
 
 	set_max_mapnr_init();
 

