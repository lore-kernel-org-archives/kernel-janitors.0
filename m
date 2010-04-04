From: =?UTF-8?B?Iua9mOWNq+W5syhQZXRlciBQYW4pIg==?=
Date: Sun, 04 Apr 2010 09:21:41 +0000
Subject: [patch] vfs: indent cleanup for fs/open.c
Message-Id: <4BB85A25.8020305@redflag-linux.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

indent cleanup for fs/open.c

Signed-off-by: Peter Pan <wppan@redflag-linux.com>
---
  fs/open.c |    3 +--
  1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index e17f544..fa27166 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -472,8 +472,7 @@ SYSCALL_DEFINE3(faccessat, int, dfd, const char 
__user *, filename, int, mode)
  		if (override_cred->uid)
  			cap_clear(override_cred->cap_effective);
  		else
-			override_cred->cap_effective -				override_cred->cap_permitted;
+			override_cred->cap_effective = override_cred->cap_permitted;
  	}

  	old_cred = override_creds(override_cred);
-- 
1.6.2.2

Regards
-- 
潘卫平(Peter Pan)
Red Flag Software Co.,Ltd.
