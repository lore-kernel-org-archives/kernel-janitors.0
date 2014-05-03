From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 May 2014 20:27:00 +0000
Subject: [patch resend] agp: info leak in agpioc_info_wrap()
Message-Id: <20140503202700.GF32753@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit systems the agp_info struct has a 4 byte hole between
->agp_mode and ->aper_base.  We need to clear it to avoid disclosing
stack information to userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this before on 13 Apr 2013 and a reminder on 31 May 2013 so now
I'm going to try sneak it in through the akpm tree.

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index 8121b4c..b297033 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -730,6 +730,7 @@ static int agpioc_info_wrap(struct agp_file_private *priv, void __user *arg)
 
 	agp_copy_info(agp_bridge, &kerninfo);
 
+	memset(&userinfo, 0, sizeof(userinfo));
 	userinfo.version.major = kerninfo.version.major;
 	userinfo.version.minor = kerninfo.version.minor;
 	userinfo.bridge_id = kerninfo.device->vendor |
