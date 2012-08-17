From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 17 Aug 2012 03:27:42 +0000
Subject: drm_fb_helper.c:1247:1-8: alloc with no test
Message-Id: <20120817032742.GB26867@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Daniel,

FYI, here is a potential problem on memory allocation failure, caught by coccinelle:

+ drivers/gpu/drm/drm_fb_helper.c:1247:1-8: alloc with no test, possible model on line 1252

vim +1247 drivers/gpu/drm/drm_fb_helper.c
  1244				sizeof(struct drm_fb_helper_crtc *), GFP_KERNEL);
  1245		modes = kcalloc(dev->mode_config.num_connector,
  1246				sizeof(struct drm_display_mode *), GFP_KERNEL);
> 1247		enabled = kcalloc(dev->mode_config.num_connector,
  1248				  sizeof(bool), GFP_KERNEL);
  1249	
  1250		drm_enable_connectors(fb_helper, enabled);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
