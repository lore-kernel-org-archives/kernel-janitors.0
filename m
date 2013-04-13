From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Apr 2013 09:16:11 +0000
Subject: [patch] agp: info leak in agpioc_info_wrap()
Message-Id: <20130413091611.GA11215@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit systems the agp_info struct has a hole between ->agp_mode and
->aper_base.  We need to clear it to avoid leaking stack information to
userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index 2e04433..3fbce33 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -729,6 +729,7 @@ static int agpioc_info_wrap(struct agp_file_private *priv, void __user *arg)
 
 	agp_copy_info(agp_bridge, &kerninfo);
 
+	memset(&userinfo, 0, sizeof(userinfo));
 	userinfo.version.major = kerninfo.version.major;
 	userinfo.version.minor = kerninfo.version.minor;
 	userinfo.bridge_id = kerninfo.device->vendor |
