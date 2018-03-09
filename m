From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 16:17:06 +0000
Subject: [PATCH v2 07/17] mfd: smsc-ece1099: Improve a size determination in smsc_i2c_probe()
Message-Id: <1d0b572d-ed39-972e-dda6-4019d92e135d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
In-Reply-To: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Mar 2018 15:05:16 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Lee Jones requested a different source code layout for this transformation.
The change was rebased on source files from Linux next-20180308.

 drivers/mfd/smsc-ece1099.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index b9d96651cc0d..57b792eb58fd 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -37,8 +37,7 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 	int devid, rev, venid_l, venid_h;
 	int ret;
 
-	smsc = devm_kzalloc(&i2c->dev, sizeof(struct smsc),
-				GFP_KERNEL);
+	smsc = devm_kzalloc(&i2c->dev, sizeof(*smsc), GFP_KERNEL);
 	if (!smsc)
 		return -ENOMEM;
 
-- 
2.16.2

