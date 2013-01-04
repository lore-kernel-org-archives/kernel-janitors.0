From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Jan 2013 18:56:02 +0000
Subject: [patch] [media] dvb: unlock on error in dvb_ca_en50221_io_do_ioctl()
Message-Id: <20130104185602.GB2038@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <50e3bfe0.IJT/Tw4ZVUbERlpE%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Nikolaus Schulz <schulz@macnetix.de>, Michael Krufky <mkrufky@linuxtv.org>, linux-media@vger.kernel.org, kbuild@01.org, kernel-janitors@vger.kernel.org

We recently pushed the locking down into this function, but there was
an error path where the unlock was missed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 190e5e0..0aac309 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1227,8 +1227,10 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 	case CA_GET_SLOT_INFO: {
 		struct ca_slot_info *info = parg;
 
-		if ((info->num > ca->slot_count) || (info->num < 0))
-			return -EINVAL;
+		if ((info->num > ca->slot_count) || (info->num < 0)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
 
 		info->type = CA_CI_LINK;
 		info->flags = 0;
@@ -1247,6 +1249,7 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 		break;
 	}
 
+out_unlock:
 	mutex_unlock(&ca->ioctl_mutex);
 	return err;
 }
