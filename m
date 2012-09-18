From: Ben Widawsky <ben@bwidawsk.net>
Date: Tue, 18 Sep 2012 23:49:59 +0000
Subject: Re: [drm-intel:drm-intel-nightly 40/142] drivers/gpu/drm/i915/i915_sysfs.c:228:49: error: 'rc6_attr_
Message-Id: <20120918164959.0845aaea@bwidawsk.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120918234054.GA7140@localhost>
In-Reply-To: <20120918234054.GA7140@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Wed, 19 Sep 2012 07:40:54 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi Ben,
> 
> FYI, kernel build failed on
> 
> tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-nightly
> head:   f0db8c3e57486ae7fdbc52bc157f997394d7d11d
> commit: 8c3f929b6147e142efc58d5d03dc6fa703b14a5d [40/142] drm/i915: Enable some sysfs stuff without CONFIG_PM
> config: i386-randconfig-b034 (attached as .config)
> 
> All related error/warning messages:
> 
> drivers/gpu/drm/i915/i915_sysfs.c: In function 'i915_teardown_sysfs':
> drivers/gpu/drm/i915/i915_sysfs.c:228:49: error: 'rc6_attr_group' undeclared (first use in this function)
> drivers/gpu/drm/i915/i915_sysfs.c:228:49: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +228 drivers/gpu/drm/i915/i915_sysfs.c
>    223	}
>    224	
>    225	void i915_teardown_sysfs(struct drm_device *dev)
>    226	{
>    227		device_remove_bin_file(&dev->primary->kdev,  &dpf_attrs);
>  > 228		sysfs_unmerge_group(&dev->primary->kdev.kobj, &rc6_attr_group);
>    229	}
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation

Darn. I'll send a patch to the list tonight. (It's weird because I
thought I tested this).

-- 
Ben Widawsky, Intel Open Source Technology Center
