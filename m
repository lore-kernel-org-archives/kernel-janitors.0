From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2015 08:13:15 +0000
Subject: [patch] udf: fix udf_load_pvoldesc()
Message-Id: <20150520081315.GA21948@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>, Fabian Frederick <fabf@skynet.be>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are some missing braces here which means this function never
succeeds.

Fixes: e9d4cf411f75 ('udf: improve error management in udf_CS0toUTF8()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/udf/super.c b/fs/udf/super.c
index c6a8f5f..b96f190 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -937,12 +937,13 @@ static int udf_load_pvoldesc(struct super_block *sb, sector_t block)
 		udf_debug("volIdent[] = '%s'\n", UDF_SB(sb)->s_volume_ident);
 	}
 
-	if (!udf_build_ustr(instr, pvoldesc->volSetIdent, 128))
+	if (!udf_build_ustr(instr, pvoldesc->volSetIdent, 128)) {
 		ret = udf_CS0toUTF8(outstr, instr);
 		if (ret < 0)
 			goto out_bh;
 
 		udf_debug("volSetIdent[] = '%s'\n", outstr->u_name);
+	}
 
 	ret = 0;
 out_bh:
