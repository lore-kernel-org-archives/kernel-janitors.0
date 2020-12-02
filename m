From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 06:43:49 +0000
Subject: [PATCH] Staging: comedi: Return -EFAULT if copy_to_user() fails
Message-Id: <X8c3pfwFy2jpy4BP@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, Al Viro <viro@zeniv.linux.org.uk>
Cc: devel@driverdev.osuosl.org, Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, B K Karthik <bkkarthik@pesu.pes.edu>, Daniel Jordan <daniel.m.jordan@oracle.com>, Michel Lespinasse <walken@google.com>, Divyansh Kamboj <kambojdivyansh2000@gmail.com>

Return -EFAULT on error instead of the number of bytes remaining to be
copied.

Fixes: bac42fb21259 ("comedi: get rid of compat_alloc_user_space() mess in COMEDI_CMD{,TEST} compat")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hi Al, this goes through your tree.

 drivers/staging/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index d99231c737fb..80d74cce2a01 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -2987,7 +2987,9 @@ static int put_compat_cmd(struct comedi32_cmd_struct __user *cmd32,
 	v32.chanlist_len = cmd->chanlist_len;
 	v32.data = ptr_to_compat(cmd->data);
 	v32.data_len = cmd->data_len;
-	return copy_to_user(cmd32, &v32, sizeof(v32));
+	if (copy_to_user(cmd32, &v32, sizeof(v32)))
+		return -EFAULT;
+	return 0;
 }
 
 /* Handle 32-bit COMEDI_CMD ioctl. */
-- 
2.29.2
