From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 11:30:16 +0000
Subject: [patch] netiucv: silence an underflow warning
Message-Id: <20160714113016.GJ18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I haven't looked at the implications but we accidentally allow bs1 to
be negative.  It makes my static checker complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/s390/net/netiucv.c b/drivers/s390/net/netiucv.c
index b0e8ffd..85a5744 100644
--- a/drivers/s390/net/netiucv.c
+++ b/drivers/s390/net/netiucv.c
@@ -1578,7 +1578,7 @@ static ssize_t buffer_write (struct device *dev, struct device_attribute *attr,
 			*e);
 		return -EINVAL;
 	}
-	if (bs1 > NETIUCV_BUFSIZE_MAX) {
+	if (bs1 < 0 || bs1 > NETIUCV_BUFSIZE_MAX) {
 		IUCV_DBF_TEXT_(setup, 2,
 			"buffer_write: buffer size %d too large\n",
 			bs1);
