From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2019 07:11:22 +0000
Subject: [PATCH 4/4] misc: xilinx_sdfec: Prevent integer overflow in xsdfec_table_write()
Message-Id: <20190821071122.GD26957@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190821070606.GA26957@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The checking here needs to handle integer overflows because "offset" and
"len" come from the user.

Fixes: 20ec628e8007 ("misc: xilinx_sdfec: Add ability to configure LDPC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/xilinx_sdfec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 3fc53d20abf3..0bf3bcc8e1ef 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -611,7 +611,9 @@ static int xsdfec_table_write(struct xsdfec_dev *xsdfec, u32 offset,
 	 * Writes that go beyond the length of
 	 * Shared Scale(SC) table should fail
 	 */
-	if ((XSDFEC_REG_WIDTH_JUMP * (offset + len)) > depth) {
+	if (offset > depth / XSDFEC_REG_WIDTH_JUMP ||
+	    len > depth / XSDFEC_REG_WIDTH_JUMP ||
+	    offset + len > depth / XSDFEC_REG_WIDTH_JUMP) {
 		dev_dbg(xsdfec->dev, "Write exceeds SC table length");
 		return -EINVAL;
 	}
-- 
2.20.1
