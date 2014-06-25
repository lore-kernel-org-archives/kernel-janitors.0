From: Yi Li <lovelylich@gmail.com>
Date: Wed, 25 Jun 2014 06:07:10 +0000
Subject: [PATCH] net: replace dev_base with dev_base_lock in comment typo
Message-Id: <1403676430-22640-1-git-send-email-lovelylich@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is no dev_base in dev.c now. Any time we access dev_base_head,
we should hold dev_base_lock or rtnl_lock().So, change the comment
from 'dev_base' into 'dev_base_lock'.

Signed-off-by: Yi Li <lovelylich@gmail.com>
---
 net/core/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index a04b12f..1a95e08 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -953,7 +953,7 @@ EXPORT_SYMBOL(dev_valid_name);
  *
  *	Passed a format string - eg "lt%d" it will try and find a suitable
  *	id. It scans list of devices to build up a free map, then chooses
- *	the first empty slot. The caller must hold the dev_base or rtnl lock
+ *	the first empty slot. The caller must hold the dev_base_lock or rtnl lock
  *	while allocating the name and adding the device in order to avoid
  *	duplicates.
  *	Limited to bits_per_byte * page size devices (ie 32K on most platforms).
@@ -1018,7 +1018,7 @@ static int __dev_alloc_name(struct net *net, const char *name, char *buf)
  *
  *	Passed a format string - eg "lt%d" it will try and find a suitable
  *	id. It scans list of devices to build up a free map, then chooses
- *	the first empty slot. The caller must hold the dev_base or rtnl lock
+ *	the first empty slot. The caller must hold the dev_base_lock or rtnl lock
  *	while allocating the name and adding the device in order to avoid
  *	duplicates.
  *	Limited to bits_per_byte * page size devices (ie 32K on most platforms).
-- 
1.9.3

