From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Sep 2017 22:19:59 +0000
Subject: [PATCH] media: dvb_ca_en50221: sanity check slot number from userspace
Message-Id: <20170920221959.5979-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jasmin Jessich <jasmin@anw.at>, Ralph Metzler <rjkm@metzlerbros.de>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a user can pass in an unsanitized slot number which
will lead to and out of range index into ca->slot_info. Fix this
by checking that the slot number is no more than the allowed
maximum number of slots. Seems that this bug has been in the driver
forever.

Detected by CoverityScan, CID#139381 ("Untrusted pointer read")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 95b3723282f4..e3a92b529dba 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1474,6 +1474,9 @@ static ssize_t dvb_ca_en50221_io_write(struct file *file,
 		return -EFAULT;
 	buf += 2;
 	count -= 2;
+
+	if (slot >= ca->slot_count)
+		return -EINVAL;
 	sl = &ca->slot_info[slot];
 
 	/* check if the slot is actually running */
-- 
2.14.1

