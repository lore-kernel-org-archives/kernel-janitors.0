From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:19:46 +0000
Subject: [patch] agp: potential info leak in compat_agpioc_info_wrap()
Message-Id: <20110923061945.GC4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

The agp_info32 struct has a 4 byte hole in it so we need to clear
that before copying it to userspace.

struct agp_info32 {
        struct agp_version         version;              /*     0     0 */

        /* XXX 4 bytes hole, try to pack */

        u32                        bridge_id;            /*     4     4 */

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
index a48e05b..0509497 100644
--- a/drivers/char/agp/compat_ioctl.c
+++ b/drivers/char/agp/compat_ioctl.c
@@ -42,6 +42,8 @@ static int compat_agpioc_info_wrap(struct agp_file_private *priv, void __user *a
 
 	agp_copy_info(agp_bridge, &kerninfo);
 
+	memset(&userinfo, 0, sizeof(userinfo));
+
 	userinfo.version.major = kerninfo.version.major;
 	userinfo.version.minor = kerninfo.version.minor;
 	userinfo.bridge_id = kerninfo.device->vendor |
