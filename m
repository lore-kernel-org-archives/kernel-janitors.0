From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Jun 2020 14:16:29 +0000
Subject: [PATCH] exfat: Fix pontential use after free in exfat_load_upcase_table()
Message-Id: <20200608141629.GA1912173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <namjae.jeon@samsung.com>, Tetsuhiro Kohada <kohada.t2@gmail.com>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code calls brelse(bh) and then dereferences "bh" on the next line
resulting in a possible use after free.  The brelse() should just be
moved down a line.

Fixes: b676fdbcf4c8 ("exfat: standardize checksum calculation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/exfat/nls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/nls.c b/fs/exfat/nls.c
index c1ec056954974..57b5a7a4d1f7a 100644
--- a/fs/exfat/nls.c
+++ b/fs/exfat/nls.c
@@ -692,8 +692,8 @@ static int exfat_load_upcase_table(struct super_block *sb,
 				index++;
 			}
 		}
-		brelse(bh);
 		chksum = exfat_calc_chksum32(bh->b_data, i, chksum, CS_DEFAULT);
+		brelse(bh);
 	}
 
 	if (index >= 0xFFFF && utbl_checksum = chksum)
-- 
2.26.2
