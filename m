From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:20:25 +0000
Subject: [patch] drm: potential info leak in compat_drm_getclient()
Message-Id: <20110923062025.GD4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

The c32.idx member wasn't initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 4a058c7..050bd49 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -314,6 +314,7 @@ static int compat_drm_getclient(struct file *file, unsigned int cmd,
 	if (err)
 		return err;
 
+	c32.idx = idx;
 	if (__get_user(c32.auth, &client->auth)
 	    || __get_user(c32.pid, &client->pid)
 	    || __get_user(c32.uid, &client->uid)
