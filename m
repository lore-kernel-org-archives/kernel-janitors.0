From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:48:35 +0000
Subject: [PATCH] media: dvb_ca_en50221: off by one in dvb_ca_en50221_io_do_ioctl()
Message-Id: <20180704094835.vzfqt44sqaga6aia@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jasmin Jessich <jasmin@anw.at>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= so we don't read one element beyond the end of the
ca->slot_info[] array.  The array is allocated in dvb_ca_en50221_init().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1310526b0d49..4d371cea0d5d 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1391,7 +1391,7 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 		struct dvb_ca_slot *sl;
 
 		slot = info->num;
-		if ((slot > ca->slot_count) || (slot < 0)) {
+		if ((slot >= ca->slot_count) || (slot < 0)) {
 			err = -EINVAL;
 			goto out_unlock;
 		}
