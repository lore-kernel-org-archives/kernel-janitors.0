From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Mar 2010 15:11:56 +0000
Subject: [patch] ivtv: sizeof() => ARRAY_SIZE()
Message-Id: <20100317151156.GG5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@radix.net>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This fixes a smatch warning:
drivers/media/video/ivtv/ivtv-vbi.c +138 ivtv_write_vbi(43) 
	error: buffer overflow 'vi->cc_payload' 256 <= 1023

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/ivtv/ivtv-vbi.c b/drivers/media/video/ivtv/ivtv-vbi.c
index f420d31..d73af45 100644
--- a/drivers/media/video/ivtv/ivtv-vbi.c
+++ b/drivers/media/video/ivtv/ivtv-vbi.c
@@ -134,7 +134,7 @@ void ivtv_write_vbi(struct ivtv *itv, const struct v4l2_sliced_vbi_data *sliced,
 			}
 		}
 	}
-	if (found_cc && vi->cc_payload_idx < sizeof(vi->cc_payload)) {
+	if (found_cc && vi->cc_payload_idx < ARRAY_SIZE(vi->cc_payload)) {
 		vi->cc_payload[vi->cc_payload_idx++] = cc;
 		set_bit(IVTV_F_I_UPDATE_CC, &itv->i_flags);
 	}
