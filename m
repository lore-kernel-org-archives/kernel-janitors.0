From: Julia Lawall <julia@diku.dk>
Date: Sat, 01 Aug 2009 08:54:21 +0000
Subject: [PATCH 6/10] drivers/net/wireless/iwlwifi: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908011054010.23408@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yi.zhu@intel.com, reinette.chatre@intel.com, linux-wireless@vger.kernel.org, ipw3945-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/net/wireless/iwlwifi/iwl-debugfs.c     |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/iwlwifi/iwl-debugfs.c b/drivers/net/wireless/iwlwifi/iwl-debugfs.c
index 7707a26..c2106d0 100644
--- a/drivers/net/wireless/iwlwifi/iwl-debugfs.c
+++ b/drivers/net/wireless/iwlwifi/iwl-debugfs.c
@@ -320,6 +320,7 @@ static ssize_t iwl_dbgfs_nvm_read(struct file *file,
 	ptr = priv->eeprom;
 	if (!ptr) {
 		IWL_ERR(priv, "Invalid EEPROM/OTP memory\n");
+		kfree(buf);
 		return -ENOMEM;
 	}
 	pos += scnprintf(buf + pos, buf_size - pos, "NVM Type: %s\n",
