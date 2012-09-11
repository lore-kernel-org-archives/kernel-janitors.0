From: Haojian Zhuang <haojian.zhuang@gmail.com>
Date: Tue, 11 Sep 2012 14:09:55 +0000
Subject: [PATCH] mfd: fix the warning of __devinitdata
Message-Id: <1347372595-11370-1-git-send-email-haojian.zhuang@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

WARNING: drivers/built-in.o(.data+0x1e3c8): Section mismatch in
reference from the variable bk_devs to the variable
.devinit.data:bk0_resources
The variable bk_devs references
the variable __devinitdata bk0_resources
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the
variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one,
*_console

So add __devinitdata on bk_devs, led_devs & reg_devs.

Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
---
 drivers/mfd/88pm860x-core.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 4927f4e..0c01d74 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -158,7 +158,7 @@ static struct resource rtc_resources[] __devinitdata = {
 	{PM8607_IRQ_RTC, PM8607_IRQ_RTC, "rtc", IORESOURCE_IRQ,},
 };
 
-static struct mfd_cell bk_devs[] = {
+static struct mfd_cell bk_devs[] __devinitdata = {
 	{
 		.name = "88pm860x-backlight",
 		.id = 0,
@@ -177,7 +177,7 @@ static struct mfd_cell bk_devs[] = {
 	},
 };
 
-static struct mfd_cell led_devs[] = {
+static struct mfd_cell led_devs[] __devinitdata = {
 	{
 		.name = "88pm860x-led",
 		.id = 0,
@@ -211,7 +211,7 @@ static struct mfd_cell led_devs[] = {
 	},
 };
 
-static struct mfd_cell reg_devs[] = {
+static struct mfd_cell reg_devs[] __devinitdata = {
 	{
 		.name = "88pm860x-regulator",
 		.id = 0,
-- 
1.7.9.5

