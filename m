From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 04 Sep 2012 12:05:04 +0000
Subject: [PATCH 2/3] drivers/media/rc/ati_remote.c: fix error return code
Message-Id: <1346760305-13060-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/rc/ati_remote.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index 08aede5..49bb356 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -937,8 +937,10 @@ static int ati_remote_probe(struct usb_interface *interface,
 	/* Set up and register mouse input device */
 	if (mouse) {
 		input_dev = input_allocate_device();
-		if (!input_dev)
+		if (!input_dev) {
+			err = -ENOMEM;
 			goto fail4;
+		}
 
 		ati_remote->idev = input_dev;
 		ati_remote_input_init(ati_remote);

