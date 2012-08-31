From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 31 Aug 2012 19:41:47 +0000
Subject: Re: [drm-intel:drm-intel-nightly 52/52] drivers/gpu/drm/i915/i915_irq.c:1330:2: error: implicit decl
Message-Id: <CAKMK7uG-vy_8oOyjF3tMxMsOjGpFV19sMNpU59hV+kfCV4RbKw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120831065519.GB6761@localhost>
	<CAKMK7uH1YiyUNF=_tDYYd9g5bogaYZZacqvLNj23nrMtiGRPMw@mail.gmail.com>
	<20120831193411.GA13655@localhost>
In-Reply-To: <20120831193411.GA13655@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Aug 31, 2012 at 9:34 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> On Fri, Aug 31, 2012 at 10:47:59AM +0200, Daniel Vetter wrote:
>> On Fri, Aug 31, 2012 at 8:55 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> > Hi Daniel,
>> >
>> > FYI, kernel build failed on
>> >
>> > tree:   git://people.freedesktop.org/~danvet/drm-intel.git drm-intel-nightly
>> > head:   faee69aa381f507731eb68d263dcd0d446c1fd58
>> > commit: faee69aa381f507731eb68d263dcd0d446c1fd58 [52/52] Merge remote-tracking branch 'origin/drm-intel-fixes' into drm-intel-nightly
>> > config: i386-randconfig-b943 (attached as .config)
>> >
>> > Build errors:
>> >
>> > drivers/gpu/drm/i915/i915_irq.c:1330:2: error: implicit declaration of function 'i915_get_extra_instdone' [-Werror=implicit-function-declaration]
>>
>> Hm, seems to compile fine here and afaict the function declaration
>> also exists in that file. Can you please double-check?
>
> Daniel, it turns out that the function was sitting in an '#ifdef CONFIG_DEBUG_FS' block..

Indeed, thanks a lot for reporting this.
-Daniel
-- 
Daniel Vetter
daniel.vetter@ffwll.ch - +41 (0) 79 365 57 48 - http://blog.ffwll.ch
