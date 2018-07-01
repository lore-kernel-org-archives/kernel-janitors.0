From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 01 Jul 2018 17:32:05 +0000
Subject: [PATCH 3/3] [media] gspca_kinect: cast sizeof to int for comparison
Message-Id: <1530466325-1678-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530466325-1678-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1530466325-1678-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, joe@perches.com, Chengguang Xu <cgxu519@gmx.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Comparing an int to a size, which is unsigned, causes the int to become
unsigned, giving the wrong result.  kinect_read returns the result of
usb_control_msg, which can return a negtive error code.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
int x;
expression e,e1;
identifier f;
@@

*x = f(...);
... when != x = e1
    when != if (x < 0 || ...) { ... return ...; }
*x < sizeof(e)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/gspca/kinect.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/kinect.c b/drivers/media/usb/gspca/kinect.c
index 0cfdf8a..f993f62 100644
--- a/drivers/media/usb/gspca/kinect.c
+++ b/drivers/media/usb/gspca/kinect.c
@@ -163,7 +163,7 @@ static int send_cmd(struct gspca_dev *gspca_dev, uint16_t cmd, void *cmdbuf,
 		actual_len = kinect_read(udev, ibuf, 0x200);
 	} while (actual_len = 0);
 	gspca_dbg(gspca_dev, D_USBO, "Control reply: %d\n", actual_len);
-	if (actual_len < sizeof(*rhdr)) {
+	if (actual_len < (int)sizeof(*rhdr)) {
 		pr_err("send_cmd: Input control transfer failed (%d)\n",
 		       actual_len);
 		return actual_len < 0 ? actual_len : -EREMOTEIO;

