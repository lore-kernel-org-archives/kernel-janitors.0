From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Jul 2020 16:38:04 +0000
Subject: [PATCH][next] media: allegro: fix potential null dereference on header
Message-Id: <20200720163804.340047-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer header is an alias to msg and msg is being null checked.
However, if msg is null then header is also null and this can lead to
a null pointer dereference on the assignment type = header->type. Fix
this by only dereferencing header after the null check on msg.

Addresses-Coverity: ("Dereference before null check")
Fixes: 3de16839669f ("media: allegro: add explicit mail encoding and decoding")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/allegro-dvt/allegro-mail.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
index 4ac65de12463..4496e2a4da5c 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.c
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
@@ -462,12 +462,14 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 ssize_t allegro_encode_mail(u32 *dst, void *msg)
 {
 	const struct mcu_msg_header *header = msg;
-	enum mcu_msg_type type = header->type;
+	enum mcu_msg_type type;
 	ssize_t size;
 
 	if (!msg || !dst)
 		return -EINVAL;
 
+	type = header->type;
+
 	switch (type) {
 	case MCU_MSG_TYPE_INIT:
 		size = allegro_enc_init(&dst[1], msg);
-- 
2.27.0
