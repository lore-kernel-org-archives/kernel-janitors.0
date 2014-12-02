From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Dec 2014 21:17:10 +0000
Subject: [patch] Input: lm8323 - missing error check in lm8323_set_disable()
Message-Id: <20141202211710.GA19955@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Fugang Duan <B38611@freescale.com>, Johan Hovold <johan@kernel.org>, Bryan Wu <cooloney@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

The missing error handling here is not especially harmful but static
checkers complain that "i" can be used uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index cb32e2b..21bea52 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -616,6 +616,8 @@ static ssize_t lm8323_set_disable(struct device *dev,
 	unsigned int i;
 
 	ret = kstrtouint(buf, 10, &i);
+	if (ret)
+		return ret;
 
 	mutex_lock(&lm->lock);
 	lm->kp_enabled = !i;
