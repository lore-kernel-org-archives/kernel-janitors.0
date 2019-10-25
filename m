From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 13:12:27 +0000
Subject: [PATCH] extcon: sm5502: remove redundant assignment to variable cable_type
Message-Id: <20191025131227.24894-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable cable_type is being initialized with a value that
is never read and is being re-assigned a little later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/extcon/extcon-sm5502.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-sm5502.c b/drivers/extcon/extcon-sm5502.c
index b3d93baf4fc5..bcf65aaca5d2 100644
--- a/drivers/extcon/extcon-sm5502.c
+++ b/drivers/extcon/extcon-sm5502.c
@@ -276,7 +276,7 @@ static int sm5502_muic_set_path(struct sm5502_muic_info *info,
 /* Return cable type of attached or detached accessories */
 static unsigned int sm5502_muic_get_cable_type(struct sm5502_muic_info *info)
 {
-	unsigned int cable_type = -1, adc, dev_type1;
+	unsigned int cable_type, adc, dev_type1;
 	int ret;
 
 	/* Read ADC value according to external cable or button */
-- 
2.20.1
