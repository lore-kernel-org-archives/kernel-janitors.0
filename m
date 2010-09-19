From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:55 +0000
Subject: [PATCH 06/14] pcmcia: cs: fix device_register() error handling
Message-Id: <1284900895-24453-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/pcmcia/cs.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/pcmcia/cs.c b/drivers/pcmcia/cs.c
index d8189d4..9e8ab51 100644
--- a/drivers/pcmcia/cs.c
+++ b/drivers/pcmcia/cs.c
@@ -592,6 +592,7 @@ static int pccardd(void *__skt)
 	if (ret) {
 		dev_printk(KERN_WARNING, &skt->dev,
 			   "PCMCIA: unable to register socket\n");
+		put_device(&skt->dev);
 		skt->thread = NULL;
 		complete(&skt->thread_done);
 		return 0;
-- 
1.7.0.4

