From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 14:44:43 +0000
Subject: [patch] drm: fix a test for AST2200 in ast_init_dram_reg()
Message-Id: <20121003144443.GB18056@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There is a typo here so the test for AST2200 doesn't work.  Clang found
this:
drivers/gpu/drm/ast/ast_post.c:282:42: warning: comparison of constant
	2200 with expression of type 'enum ast_chip' is always false
	[-Wtautological-constant-out-of-range-compare]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 6edbee6..56b3eab3 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -279,7 +279,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
 				;
 			} while (ast_read32(ast, 0x10100) != 0xa8);
 		} else {/* AST2100/1100 */
-			if (ast->chip = AST2100 || ast->chip = 2200)
+			if (ast->chip = AST2100 || ast->chip = AST2200)
 				dram_reg_info = ast2100_dram_table_data;
 			else
 				dram_reg_info = ast1100_dram_table_data;
