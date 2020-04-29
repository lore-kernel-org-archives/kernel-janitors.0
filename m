From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Apr 2020 13:23:23 +0000
Subject: [PATCH] i2c: stm32f7: prevent array underflow in stm32f7_get_lower_rate()
Message-Id: <20200429132323.GB815283@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Alain Volmat <alain.volmat@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

We want to break with "i" set to zero whether we find the rate we want
or not.  In the current code, if we don't find the rate we want then it
exits the loop with "i" set to -1 and results in an array underflow.

Fixes: 09cc9a3bce91 ("i2c: stm32f7: allows for any bus frequency")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 9c9e10ea91991..bff3479fe122a 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -607,7 +607,7 @@ static u32 stm32f7_get_lower_rate(u32 rate)
 {
 	int i = ARRAY_SIZE(stm32f7_i2c_specs);
 
-	while (i--)
+	while (--i)
 		if (stm32f7_i2c_specs[i].rate < rate)
 			break;
 
-- 
2.26.2
