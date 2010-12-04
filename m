From: Vasiliy Kulikov <segoon@openwall.com>
Date: Sat, 04 Dec 2010 21:05:22 +0000
Subject: [PATCH v2] media: rc: ir-lirc-codec: fix integer overflow
Message-Id: <20101204210522.GA5244@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101202045126.GA1784@bicker>
In-Reply-To: <20101202045126.GA1784@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

'n' may be bigger than MAX_INT*sizeof(int), if so checking of truncated
(int)(n/sizeof(int)) for LIRCBUF_SIZE overflows and then using nontruncated 'count'
doesn't make sense.  This is not a security issue as too big 'n' is catched in
kmalloc() in memdup_user() call.  However, it's better to prevent WARN() in kmalloc().

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/media/rc/ir-lirc-codec.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/media/rc/ir-lirc-codec.c b/drivers/media/rc/ir-lirc-codec.c
index 1e87ee8..a7e91e6 100644
--- a/drivers/media/rc/ir-lirc-codec.c
+++ b/drivers/media/rc/ir-lirc-codec.c
@@ -100,7 +100,8 @@ static ssize_t ir_lirc_transmit_ir(struct file *file, const char *buf,
 	struct lirc_codec *lirc;
 	struct rc_dev *dev;
 	int *txbuf; /* buffer with values to transmit */
-	int ret = 0, count;
+	int ret = 0;
+	size_t count;
 
 	lirc = lirc_get_pdata(file);
 	if (!lirc)
-- 
1.7.0.4
