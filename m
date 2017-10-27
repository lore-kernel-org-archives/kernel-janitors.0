From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Oct 2017 15:52:30 +0000
Subject: [PATCH] input: mxs-lradc: remove redundant assignment to pointer input
Message-Id: <20171027155230.12887-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'input' is being initialized with ts->ts_input and this
value is not being read as it is updated a few lines later with the
return value from the call to devm_input_allocate_device. Remove the
redundant initialization assignment.  Cleans up clang warning:

drivers/input/touchscreen/mxs-lradc-ts.c:587:20: warning: Value Xi
stored to 'input' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/touchscreen/mxs-lradc-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/touchscreen/mxs-lradc-ts.c
index 3707e927f770..c850b517854e 100644
--- a/drivers/input/touchscreen/mxs-lradc-ts.c
+++ b/drivers/input/touchscreen/mxs-lradc-ts.c
@@ -584,7 +584,7 @@ static void mxs_lradc_ts_hw_init(struct mxs_lradc_ts *ts)
 
 static int mxs_lradc_ts_register(struct mxs_lradc_ts *ts)
 {
-	struct input_dev *input = ts->ts_input;
+	struct input_dev *input;
 	struct device *dev = ts->dev;
 
 	input = devm_input_allocate_device(dev);
-- 
2.14.1

