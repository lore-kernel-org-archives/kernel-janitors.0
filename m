From: =?UTF-8?q?Samuel=20Iglesias=20Gons=C3=A1lvez?=  <siglesias@igalia.com>
Date: Mon, 15 May 2017 09:08:10 +0000
Subject: [PATCH 2/2] ipack: Improve a size determination in ipack_bus_register()
Message-Id: <20170515090810.15404-2-siglesias@igalia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170515090810.15404-1-siglesias@igalia.com>
In-Reply-To: <20170515090810.15404-1-siglesias@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org
Cc: Markus Elfring <elfring@users.sourceforge.net>, jens.taprogge@taprogge.org, industrypack-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com>
---
 drivers/ipack/ipack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index 575c4f29e0f7..a1e07a77d4e6 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -212,7 +212,7 @@ struct ipack_bus_device *ipack_bus_register(struct devi=
ce *parent, int slots,
 	int bus_nr;
 	struct ipack_bus_device *bus;
=20
-	bus =3D kzalloc(sizeof(struct ipack_bus_device), GFP_KERNEL);
+	bus =3D kzalloc(sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return NULL;
=20
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
