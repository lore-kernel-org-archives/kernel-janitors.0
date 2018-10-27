From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:16:39 +0000
Subject: [PATCH 1/2] media: vicodec: constify v4l2_ctrl_ops structure
Message-Id: <1540642600-25840-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540642600-25840-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540642600-25840-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hans.verkuil@cisco.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The v4l2_ctrl_ops structure is only stored in the ops field of a
v4l2_ctrl_config structure, and this field is const, or passed as the
second argument of v4l2_ctrl_new_std, and the corresponding parameter
is declared as const.  Accordingly, the structure can also be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/vicodec/vicodec-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/platform/vicodec/vicodec-core.c b/drivers/media/platform/vicodec/vicodec-core.c
--- a/drivers/media/platform/vicodec/vicodec-core.c
+++ b/drivers/media/platform/vicodec/vicodec-core.c
@@ -1108,7 +1108,7 @@ static int vicodec_s_ctrl(struct v4l2_ct
 	return -EINVAL;
 }
 
-static struct v4l2_ctrl_ops vicodec_ctrl_ops = {
+static const struct v4l2_ctrl_ops vicodec_ctrl_ops = {
 	.s_ctrl = vicodec_s_ctrl,
 };
 
