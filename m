From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 17:35:30 +0000
Subject: [patch 2/2] [media] rc: unlock on error in store_protocols()
Message-Id: <20121127173530.GF1059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Douglas Bagnall <douglas@paradise.net.nz>, David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>, Jarod Wilson <jarod@redhat.com>, Ezequiel Garcia <elezegarcia@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path is missing the unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 601d1ac1..759a40a 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -890,7 +892,8 @@ static ssize_t store_protocols(struct device *device,
 
 		if (i = ARRAY_SIZE(proto_names)) {
 			IR_dprintk(1, "Unknown protocol: '%s'\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		count++;
