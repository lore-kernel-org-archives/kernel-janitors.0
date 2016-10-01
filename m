From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:26 +0000
Subject: [PATCH 09/15] gma500: improve function-level documentation
Message-Id: <1475351192-27079-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Delete a reference to a variable that has never been used by the function
in the first case, and rename a variable to that of the corresponding
parameter name in the second case.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/gma500/intel_i2c.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/intel_i2c.c b/drivers/gpu/drm/gma500/intel_i2c.c
index 98a28c2..12c40f1 100644
--- a/drivers/gpu/drm/gma500/intel_i2c.c
+++ b/drivers/gpu/drm/gma500/intel_i2c.c
@@ -95,7 +95,6 @@ static void set_data(void *data, int state_high)
 /**
  * psb_intel_i2c_create - instantiate an Intel i2c bus using the specified GPIO reg
  * @dev: DRM device
- * @output: driver specific output device
  * @reg: GPIO reg to use
  * @name: name for this bus
  *
@@ -155,7 +154,7 @@ struct psb_intel_i2c_chan *psb_intel_i2c_create(struct drm_device *dev,
 
 /**
  * psb_intel_i2c_destroy - unregister and free i2c bus resources
- * @output: channel to free
+ * @chan: channel to free
  *
  * Unregister the adapter from the i2c layer, then free the structure.
  */

