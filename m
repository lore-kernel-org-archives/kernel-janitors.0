From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 19:14:31 +0000
Subject: [PATCH 51] drivers/media/video/msp3400-driver.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312114.31646.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, mchehab@infradead.org, v4l-dvb-maintainer@linuxtv.org, video4linux-list@redhat.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/media/video/msp3400-driver.c | 28945 -> 28898 (-47 bytes)
 drivers/media/video/msp3400-driver.o | 125620 -> 125320 (-300 bytes)

 drivers/media/video/msp3400-driver.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/media/video/msp3400-driver.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/media/video/msp3400-driver.c	2007-07-31 13:22:34.000000000 +0200
@@ -813,8 +813,9 @@ static int msp_attach(struct i2c_adapter
 	int msp_rom;

 	client = kzalloc(sizeof(*client), GFP_KERNEL);
-	if (client = NULL)
+	if (!client)
 		return -ENOMEM;
+
 	client->addr = address;
 	client->adapter = adapter;
 	client->driver = &i2c_driver;
@@ -826,14 +827,14 @@ static int msp_attach(struct i2c_adapter
 		return 0;
 	}

-	state = kmalloc(sizeof(*state), GFP_KERNEL);
-	if (state = NULL) {
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state) {
 		kfree(client);
 		return -ENOMEM;
 	}
+
 	i2c_set_clientdata(client, state);

-	memset(state, 0, sizeof(*state));
 	state->v4l2_std = V4L2_STD_NTSC;
 	state->audmode = V4L2_TUNER_MODE_STEREO;
 	state->volume = 58880;	/* 0db gain */
