From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:28:45 +0000
Subject: [patch] ore: signedness bug in _sp2d_min_pg()
Message-Id: <20121002082845.GH12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This for loop doesn't work correctly when "p" is unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/exofs/ore_raid.c b/fs/exofs/ore_raid.c
index 5f376d1..b963f38 100644
--- a/fs/exofs/ore_raid.c
+++ b/fs/exofs/ore_raid.c
@@ -203,7 +203,7 @@ static unsigned _sp2d_min_pg(struct __stripe_pages_2d *sp2d)
 
 static unsigned _sp2d_max_pg(struct __stripe_pages_2d *sp2d)
 {
-	unsigned p;
+	int p;
 
 	for (p = sp2d->pages_in_unit - 1; p >= 0; --p) {
 		struct __1_page_stripe *_1ps = &sp2d->_1p_stripes[p];
