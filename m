From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Apr 2013 07:50:14 +0000
Subject: [patch] ipmi: info leak in compat_impi_ioctl()
Message-Id: <20130415075013.GB20993@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a 4 byte hole between ->recv_type and ->addr.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/ipmi/ipmi_devintf.c b/drivers/char/ipmi/ipmi_devintf.c
index 9eb360f..8e306ac 100644
--- a/drivers/char/ipmi/ipmi_devintf.c
+++ b/drivers/char/ipmi/ipmi_devintf.c
@@ -810,6 +810,7 @@ static long compat_ipmi_ioctl(struct file *filep, unsigned int cmd,
 		struct ipmi_recv   __user *precv64;
 		struct ipmi_recv   recv64;
 
+		memset(&recv64, 0, sizeof(recv64));
 		if (get_compat_ipmi_recv(&recv64, compat_ptr(arg)))
 			return -EFAULT;
 
