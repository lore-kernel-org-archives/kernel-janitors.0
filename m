From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Mon, 25 Sep 2017 09:32:24 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <1506331944.5593.10.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919155534.25334-1-colin.king@canonical.com>
         <20170919214614.cfiolgznopouv34e@zhen-hp.sh.intel.com>
         <1505874923.2067.14.camel@perches.com>
         <20170920224406.jscthkglwfy3xhtf@zhen-hp.sh.intel.com>
         <1506004318.5382.4.camel@linux.intel.com>
         <F3B0350DF4CB6849A642218320DE483D7D64178C@SHSMSX101.ccr.corp.intel.com>
         <1506078663.6232.65.camel@linux.intel.com>
         <F3B0350DF4CB6849A642218320DE483D7D643090@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <F3B0350DF4CB6849A642218320DE483D7D643090@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Joe Perches <joe@perches.com>
Cc: "Gao, Fred" <fred.gao@intel.com>, David Airlie <airlied@linux.ie>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Colin King <colin.king@canonical.com>, "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>

On Fri, 2017-09-22 at 17:50 +0000, Wang, Zhi A wrote:
> Thanks for the reply. Learned a lot. :)
> 
> GEM_BUG_ON is new to me since it wasn't there at the beginning of
> GVT-g upstream. It showed up later. So I left a lot of WARN_ON in the
> code and some of them should be GEM_BUG_ON now.
> 
> Now I can figure out those differences. We can discuss with our QA to
> see if they would like to enable I915_GEM_DEBUG and then we can move
> to GEM_BUG_ON also, or maybe we can have a dedicated GVT_BUG_ON. :)
> Thank you so much. Have a great weekend.

GVT_BUG_ON is probably the way to go :)

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
