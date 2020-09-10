From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Sep 2020 10:08:05 +0000
Subject: [PATCH] thunderbolt: debugfs: Fix uninitialized return in counters_write()
Message-Id: <20200910100805.GB79916@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, Gil Fine <gil.fine@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

If the first line is in an invalid format then the "ret" value is
uninitialized.  We should return -EINVAL instead.

Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index fdfe6e4afbfe..3680b2784ea1 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -231,6 +231,7 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 		char *line = buf;
 		u32 val, offset;
 
+		ret = -EINVAL;
 		while (parse_line(&line, &offset, &val, 1, 4)) {
 			ret = tb_port_write(port, &val, TB_CFG_COUNTERS,
 					    offset, 1);
-- 
2.28.0
