From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 01 Jun 2015 09:56:32 +0000
Subject: [patch 2/2] w1: unlock correct lock on error in w1_seq_show()
Message-Id: <20150601095632.GB897@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Matt Campbell <mattrcampbell@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Fries <David@Fries.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we don't unlock "master->mutex" on this error
path.  It looks like it is a typo and we unlock ->bus_mutext where
->mutex was intended.

Fixes: d9411e57dc7f ('w1: Add support for DS28EA00 sequence to w1-therm')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 3351be6..79ecaf8 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -412,7 +412,7 @@ static ssize_t w1_seq_show(struct device *device,
 	c -= snprintf(buf + PAGE_SIZE - c, c, "%d\n", seq);
 	return PAGE_SIZE - c;
 error:
-	mutex_unlock(&sl->master->bus_mutex);
+	mutex_unlock(&sl->master->mutex);
 	return -EIO;
 }
 
