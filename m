From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Jan 2015 07:48:01 +0000
Subject: [patch] Input: cyapa - off by on in cyapa_update_fw_store()
Message-Id: <20150122074801.GA11491@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Dudley Du <dudl@cypress.com>, Jingoo Han <jg1.han@samsung.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

If "(count = NAME_MAX)" then we could end up putting the NUL terminator
one space beyond the end of the fw_name[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 64c6128..58f4f6f 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1013,7 +1013,7 @@ static ssize_t cyapa_update_fw_store(struct device *dev,
 	char fw_name[NAME_MAX];
 	int ret, error;
 
-	if (count > NAME_MAX) {
+	if (count >= NAME_MAX) {
 		dev_err(dev, "File name too long\n");
 		return -EINVAL;
 	}
