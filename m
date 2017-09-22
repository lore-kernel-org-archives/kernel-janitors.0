From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Fri, 22 Sep 2017 11:11:03 +0000
Subject: Re: [PATCH][drm-next] drm/i915/gvt: ensure -ve return value is handled correctly
Message-Id: <1506078663.6232.65.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919155534.25334-1-colin.king@canonical.com>
 <20170919214614.cfiolgznopouv34e@zhen-hp.sh.intel.com>
 <1505874923.2067.14.camel@perches.com>
 <20170920224406.jscthkglwfy3xhtf@zhen-hp.sh.intel.com>
 <1506004318.5382.4.camel@linux.intel.com>
 <F3B0350DF4CB6849A642218320DE483D7D64178C@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <F3B0350DF4CB6849A642218320DE483D7D64178C@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Joe Perches <joe@perches.com>
Cc: "Gao, Fred" <fred.gao@intel.com>, David Airlie <airlied@linux.ie>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Colin King <colin.king@canonical.com>, "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>

On Thu, 2017-09-21 at 16:17 +0000, Wang, Zhi A wrote:
> Hi Joonas:
> 
> Thanks for the introduction. I have been thinking about the
> possibility of introducing GEM_BUG_ON into GVT-g recently and
> investigating on it. I'm just a bit confused about the usage between
> GEM_BUG_ON and WARN_ON.

GEM_BUG_ON is basically there to catch things that we do not expect
ever to happen within the driver. So we often list the function
preconditions as GEM_BUG_ON. It's there for the same reason as the
lockdep_assert_held and KASAN. It's sometimes heavy checks that we
really want to run when functionally validating kernel.

GEM_BUG_ON became to existence because adding checks for obvious
conditions at the critical command submission path GEM is not
sustainable for performance in production.

The expectation is that each GEM_BUG_ON has a testcase in I-G-T that
has the potential to hit it if driver was modified not to respect those
preconditions. So once our testest passes, we can disable the
GEM_BUG_ONs and be confident of the internal driver quality and get the
release performance.

WARN_ON is mostly used for the cases when the hardware is behaving
differently than we expect. We can't remove them as we don't have all
the hardware in the world to test, but we try to exercise them too
through I-G-Ts. The test will often be the subtest that was written to
reproduce the problem with our expectations of hardware in case of
hangs and other bugs. After we've corrected the driver behaviour, or
got a hardware W/A assigned, we keep the test and add a WARN_ON to make
sure there will be no regression back to the same situation.

This is at least what should happen, given time constraints, there may
be variations.

User behaving unexpectedly should never result in WARN_ON (or even
worse, BUG_ON), should always just be debug messages displayed (not to
trigger the CI) and errors propagated back to user:

https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-uapi.html#recommended
-ioctl-return-values

Bare BUG_ON should only be used when there's the danger of corrupting
system memory or filesystems, so from graphics driver, that's not very
often. Controlled propagation of errors and maybe WARN_ON is always
preferred if possible.


> GEM_BUG_ON is only enabled when kernel debug is enabled, which mostly
> is disabled in a production kernel. In the case of i915, I'm sure it
> will be enabled in CI test so that it can catch broken code path.
> Looking into GVT-g, the similar scenario is we enable it in QA test.
> 
> Let's say GEM_BUG_ON can do its work very well in QA test but QA test
> is not fully covered all the condition, then something might be still
> broken when it comes to the production kernel for user and GEM_BUG_ON
> will be disabled and will not catch that, I guess.
> 
> That's my confusion which scratched my mind during the investigation:
> If GEM_BUG_ON is not always working, then it looks WARN_ON should
> always be used.... Expected to learn more about the story behind. :)

So if the saying is some object is "never going to be bigger than 2G",
there should be either:

1. GEM_BUG_ON like assertion for it and a test that tries to hit it, by
trying to allocate a huge object for example, and should get rejection
as -EINVAL

2. Test to see if the object is bigger, and propagate back the error if
it is. Either resulting in user reported error if the origin of the
object is outside of kernel <-> hardware. Or a WARN_ON if it's strange
hardware or kernel driver behavior.

You should choose depending on how often your function gets called, and
how critical the execution time is.

Hopefully this clarified things.

Regards, Joonas
-- 
Joonas Lahtinen
Open Source Technology Center
Intel Corporation
