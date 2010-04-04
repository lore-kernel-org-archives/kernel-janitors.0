From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Sun, 04 Apr 2010 07:49:27 +0000
Subject: [patch] vfs: indent cleanup for fs/namei.c
Message-Id: <4BB84487.5030303@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

indent cleanup for fs/namei.c

Signed-off-by: Peter Pan <wppan@redflag-linux.com>
---
  fs/namei.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index a7dce91..905fb84 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -172,7 +172,7 @@ EXPORT_SYMBOL(putname);
  static int acl_permission_check(struct inode *inode, int mask,
  		int (*check_acl)(struct inode *inode, int mask))
  {
-	umode_t			mode = inode->i_mode;
+	umode_t mode = inode->i_mode;

  	mask &= MAY_READ | MAY_WRITE | MAY_EXEC;

-- 
1.6.2.2

Regards
-- 
潘卫平(Peter Pan)
Red Flag Software Co.,Ltd.
