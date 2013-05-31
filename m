From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 12:46:58 +0000
Subject: [patch v2] ipmi: info leak in compat_ipmi_ioctl()
Message-Id: <20130531124658.GU23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On x86_64 there is a 4 byte hole between ->recv_type and ->addr.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fixed the changelog a little.  Also added LKML because the
openipmi is a moderated list (and the moderator thought my email was
spam).

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
 
