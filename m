From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 16:56:07 +0000
Subject: [PATCH 03] drivers/sbus/char/bbc_envctrl.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311856.07368.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, davem@davemloft.net

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/sbus/char/bbc_envctrl.c | 16622 -> 16580 (-42 bytes)

 drivers/sbus/char/bbc_envctrl.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/sbus/char/bbc_envctrl.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/sbus/char/bbc_envctrl.c	2007-07-31 13:58:44.000000000 +0200
@@ -479,11 +479,12 @@ static int kenvctrld(void *__unused)

 static void attach_one_temp(struct linux_ebus_child *echild, int temp_idx)
 {
-	struct bbc_cpu_temperature *tp = kmalloc(sizeof(*tp), GFP_KERNEL);
-
+	struct bbc_cpu_temperature *tp;
+
+	tp = kzalloc(sizeof(*tp), GFP_KERNEL);
 	if (!tp)
 		return;
-	memset(tp, 0, sizeof(*tp));
+
 	tp->client = bbc_i2c_attach(echild);
 	if (!tp->client) {
 		kfree(tp);
@@ -525,11 +526,12 @@ static void attach_one_temp(struct linux

 static void attach_one_fan(struct linux_ebus_child *echild, int fan_idx)
 {
-	struct bbc_fan_control *fp = kmalloc(sizeof(*fp), GFP_KERNEL);
-
+	struct bbc_fan_control *fp;
+
+	fp = kzalloc(sizeof(*fp), GFP_KERNEL);
 	if (!fp)
 		return;
-	memset(fp, 0, sizeof(*fp));
+
 	fp->client = bbc_i2c_attach(echild);
 	if (!fp->client) {
 		kfree(fp);
