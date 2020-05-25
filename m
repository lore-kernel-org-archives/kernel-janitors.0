From: Till Varoquaux <till.varoquaux@gmail.com>
Date: Mon, 25 May 2020 06:10:43 +0000
Subject: [PATCH] staging: greybus: loopback: fix a spelling error.
Message-Id: <20200518051314.1785567-1-till.varoquaux@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, pure.logic@nexus-software.ie
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, trivial@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Till Varoquaux <till.varoquaux@gmail.com>, Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org

Successed -> succeeded.

Signed-off-by: Till Varoquaux <till.varoquaux@gmail.com>

---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 583d9708a191..2471448ba42a 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -135,7 +135,7 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	/* Report 0 for min and max if no transfer successed */		\
+	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
 		return sprintf(buf, "0\n");				\
 	return sprintf(buf, "%" #type "\n", gb->name.field);		\
-- 
2.25.4
