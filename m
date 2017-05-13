From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 08:56:10 +0000
Subject: [PATCH 2/2] ipack: Improve a size determination in ipack_bus_register()
Message-Id: <4c250243-7441-3c07-764d-1a23f950def7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
In-Reply-To: <b3fea957-b1bf-f681-8f70-d9d85106651b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: industrypack-devel@lists.sourceforge.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jens Taprogge <jens.taprogge@taprogge.org>, Samuel Iglesias Gonsalvez <siglesias@igalia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 10:37:06 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ipack/ipack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ipack/ipack.c b/drivers/ipack/ipack.c
index 575c4f29e0f7..a1e07a77d4e6 100644
--- a/drivers/ipack/ipack.c
+++ b/drivers/ipack/ipack.c
@@ -212,7 +212,7 @@ struct ipack_bus_device *ipack_bus_register(struct device *parent, int slots,
 	int bus_nr;
 	struct ipack_bus_device *bus;
 
-	bus = kzalloc(sizeof(struct ipack_bus_device), GFP_KERNEL);
+	bus = kzalloc(sizeof(*bus), GFP_KERNEL);
 	if (!bus)
 		return NULL;
 
-- 
2.12.3

