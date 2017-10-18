From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Oct 2017 07:54:41 +0000
Subject: [PATCH] platform/chrome: cros_ec: Array underflow in show_ec_version()
Message-Id: <20171018075441.bmqnqj77kwczznwo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benson Leung <bleung@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>

msg->data[] is a zero size array so we're putting the NUL terminator one
character before the start of the array.

Fixes: a841178445bb ("mfd: cros_ec: Use a zero-length array for command data")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/chrome/cros_ec_sysfs.c b/drivers/platform/chrome/cros_ec_sysfs.c
index 0fd88eb03d39..8a8e2a101ad0 100644
--- a/drivers/platform/chrome/cros_ec_sysfs.c
+++ b/drivers/platform/chrome/cros_ec_sysfs.c
@@ -175,7 +175,7 @@ static ssize_t show_ec_version(struct device *dev,
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Build info:    EC error %d\n", msg->result);
 	else {
-		msg->data[sizeof(msg->data) - 1] = '\0';
+		msg->data[EC_HOST_PARAM_SIZE - 1] = '\0';
 		count += scnprintf(buf + count, PAGE_SIZE - count,
 				   "Build info:    %s\n", msg->data);
 	}
