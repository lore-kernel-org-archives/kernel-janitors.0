From: =?UTF-8?q?Samuel=20Iglesias=20Gons=C3=A1lvez?=  <siglesias@igalia.com>
Date: Mon, 15 May 2017 09:08:09 +0000
Subject: [PATCH 1/2] ipack: Delete an error message for a failed memory allocation in ipack_device_read_id()
Message-Id: <20170515090810.15404-1-siglesias@igalia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2ef624df-6872-a0eb-90bd-4db6b2a248ae@users.sourceforge.net>
In-Reply-To: <2ef624df-6872-a0eb-90bd-4db6b2a248ae@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org
Cc: Markus Elfring <elfring@users.sourceforge.net>, jens.taprogge@taprogge.org, industrypack-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Ref=
actor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com>
---

Greg, Would you mind picking this patch series through your char-misc tree?

Sam

 drivers/ipack/ipack.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index 12102448fddd..575c4f29e0f7 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -402,7 +402,6 @@ static int ipack_device_read_id(struct ipack_device *de=
v)
 	 * ID ROM contents */
 	dev->id =3D kmalloc(dev->id_avail, GFP_KERNEL);
 	if (!dev->id) {
-		dev_err(&dev->dev, "dev->id alloc failed.\n");
 		ret =3D -ENOMEM;
 		goto out;
 	}
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
