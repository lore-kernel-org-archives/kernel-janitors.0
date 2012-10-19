From: Yuanhan Liu <yuanhan.liu@intel.com>
Date: Fri, 19 Oct 2012 05:05:39 +0000
Subject: [drm-intel:drm-intel-next 36/41] drivers/gpu/drm/i915/intel_ddi.c:940:2: warning: 'port' may be used
Message-Id: <20121019050539.GA9177@yliu-dev.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Paulo,

FYI, there are new compile warnings show up in

tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-next
head:   39bc66c9371fa6cdb1029e6c1768824f068be913
commit: 6441ab5f8ffdf7e99eefe0fb747858e0c12b567e [36/41] drm/i915: completely rewrite the Haswell PLL handling code
config: i386-allmodconfig # make ARCH=i386 allmodconfig

All warnings:

drivers/gpu/drm/i915/intel_ddi.c: In function 'intel_ddi_setup_hw_pll_state':
drivers/gpu/drm/i915/intel_ddi.c:940:2: warning: 'port' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/intel_ddi.c:929:12: note: 'port' was declared here

vim +940 drivers/gpu/drm/i915/intel_ddi.c

85234cdc Daniel Vetter 2012-07-02  924  
6441ab5f Paulo Zanoni  2012-10-05  925  static uint32_t intel_ddi_get_crtc_pll(struct drm_i915_private *dev_priv,
6441ab5f Paulo Zanoni  2012-10-05  926  				       enum pipe pipe)
6441ab5f Paulo Zanoni  2012-10-05  927  {
6441ab5f Paulo Zanoni  2012-10-05  928  	uint32_t temp, ret;
6441ab5f Paulo Zanoni  2012-10-05  929  	enum port port;
6441ab5f Paulo Zanoni  2012-10-05  930  	int i;
6441ab5f Paulo Zanoni  2012-10-05  931  
6441ab5f Paulo Zanoni  2012-10-05  932  	temp = I915_READ(DDI_FUNC_CTL(pipe));
6441ab5f Paulo Zanoni  2012-10-05  933  	temp &= PIPE_DDI_PORT_MASK;
6441ab5f Paulo Zanoni  2012-10-05  934  	for (i = PORT_A; i <= PORT_E; i++)
6441ab5f Paulo Zanoni  2012-10-05  935  		if (temp = PIPE_DDI_SELECT_PORT(i))
6441ab5f Paulo Zanoni  2012-10-05  936  			port = i;
6441ab5f Paulo Zanoni  2012-10-05  937  
6441ab5f Paulo Zanoni  2012-10-05  938  	ret = I915_READ(PORT_CLK_SEL(port));
6441ab5f Paulo Zanoni  2012-10-05  939  
6441ab5f Paulo Zanoni  2012-10-05 @940  	DRM_DEBUG_KMS("Pipe %c connected to port %c using clock 0x%08x\n",
6441ab5f Paulo Zanoni  2012-10-05  941  		      pipe_name(pipe), port_name(port), ret);
6441ab5f Paulo Zanoni  2012-10-05  942  
6441ab5f Paulo Zanoni  2012-10-05  943  	return ret;
6441ab5f Paulo Zanoni  2012-10-05  944  }
6441ab5f Paulo Zanoni  2012-10-05  945  
6441ab5f Paulo Zanoni  2012-10-05  946  void intel_ddi_setup_hw_pll_state(struct drm_device *dev)
6441ab5f Paulo Zanoni  2012-10-05  947  {
6441ab5f Paulo Zanoni  2012-10-05  948  	struct drm_i915_private *dev_priv = dev->dev_private;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
