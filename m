From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 30 Jan 2012 11:05:55 +0000
Subject: [PATCH] drivers/gpu/drm/drm_ioc32.c: initialize all fields
Message-Id: <1327921555-7862-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1327921555-7862-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1327921555-7862-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The c32 structure is allocated on the stack and its idx field is not
initialized before copying it to user level.  This patch takes the value
from the result of the ioctl, as done for the other fields.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
An alternative would be to change the earlier code

        if (get_user(idx, &argp->idx))
                return -EFAULT;

to write into the c32 structure, rather than into the local idx variable.
This would be more similar to what is done in compat_drm_version.

 drivers/gpu/drm/drm_ioc32.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index ddd70db..637fcc3 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -315,7 +315,8 @@ static int compat_drm_getclient(struct file *file, unsigned int cmd,
 	if (err)
 		return err;
 
-	if (__get_user(c32.auth, &client->auth)
+	if (__get_user(c32.idx, &client->idx)
+	    || __get_user(c32.auth, &client->auth)
 	    || __get_user(c32.pid, &client->pid)
 	    || __get_user(c32.uid, &client->uid)
 	    || __get_user(c32.magic, &client->magic)

