From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Jan 2012 11:27:42 +0000
Subject: [patch] gma500: change logical negate to bitwise
Message-Id: <20120115112742.GB20463@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>

Logical negate is always false here.  This was found by Sparse:
drivers/gpu/drm/gma500/psb_irq.c:407:17: warning: dubious: x & !y

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 7be802b..4ce680f 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -404,7 +404,7 @@ void psb_irq_turn_off_dpst(struct drm_device *dev)
 		psb_disable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
 
 		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
-		PSB_WVDC32(pwm_reg & !(PWM_PHASEIN_INT_ENABLE),
+		PSB_WVDC32(pwm_reg & ~PWM_PHASEIN_INT_ENABLE,
 							PWM_CONTROL_LOGIC);
 		pwm_reg = PSB_RVDC32(PWM_CONTROL_LOGIC);
 
