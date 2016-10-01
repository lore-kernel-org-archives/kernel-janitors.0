From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:23 +0000
Subject: [PATCH 06/15] mfd: tc3589x: improve function-level documentation
Message-Id: <1475351192-27079-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use the correct function name in one case and adjust a variable name to
that of the corresponding function parameter in another case.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/tc3589x.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 274bf39..cc9e563 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -53,7 +53,7 @@ int tc3589x_reg_read(struct tc3589x *tc3589x, u8 reg)
 EXPORT_SYMBOL_GPL(tc3589x_reg_read);
 
 /**
- * tc3589x_reg_read() - write a single TC3589x register
+ * tc3589x_reg_write() - write a single TC3589x register
  * @tc3589x:	Device to write to
  * @reg:	Register to read
  * @data:	Value to write
@@ -118,7 +118,7 @@ int tc3589x_block_write(struct tc3589x *tc3589x, u8 reg, u8 length,
  * @tc3589x:	Device to write to
  * @reg:	Register to write
  * @mask:	Mask of bits to set
- * @values:	Value to set
+ * @val:	Value to set
  */
 int tc3589x_set_bits(struct tc3589x *tc3589x, u8 reg, u8 mask, u8 val)
 {

