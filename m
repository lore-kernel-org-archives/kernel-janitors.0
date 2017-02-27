From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Feb 2017 11:25:32 +0000
Subject: Re: [patch v2] drm/msm/dsi: free first element on error
Message-Id: <CAF6AEGsRfGMPZd5OnsznC2mvUAUVTg93i_-0LDPRRyy0CX7_BQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87a89mnznw.fsf@intel.com> <20170216120028.GA29698@mwanda>
 <CAF6AEGuaYjRQCpLxade_Htm6tS8Zvy6JQG8dRt973C-aaPCP5g@mail.gmail.com>
 <871suynwwz.fsf@intel.com>
 <20170226205210.nalhhhxmosn4ndci@phenom.ffwll.local>
 <87h93ggcnn.fsf@intel.com>
 <CAKMK7uGLn3m8eEzYEmPFDPr090B0Cq9Xycg_bJdX7SkRJYtNyg@mail.gmail.com>
In-Reply-To: <CAKMK7uGLn3m8eEzYEmPFDPr090B0Cq9Xycg_bJdX7SkRJYtNyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

On Mon, Feb 27, 2017 at 5:25 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, Feb 27, 2017 at 11:18 AM, Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
>> On Sun, 26 Feb 2017, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Thu, Feb 16, 2017 at 02:27:08PM +0200, Jani Nikula wrote:
>>>> On Thu, 16 Feb 2017, Rob Clark <robdclark@gmail.com> wrote:
>>>> > On Thu, Feb 16, 2017 at 7:00 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>>> >> We're off by one here.  We free something that wasn't allocated and we
>>>> >> don't free msm_host->bus_clks[].
>>>> >>
>>>> >> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
>>>> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> >
>>>> > Thanks
>>>> >
>>>> > Reviewed-by: Rob Clark <robdclark@gmail.com>
>>>>
>>>> And for good measure,
>>>>
>>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>> So 2 r-b from maintainers, no one said he'll apply. This isn't really
>>> great coordination :-) Note that drm-misc-next is always open, so you
>>> could always smash it in there, irrespective of merge window state. hint,
>>> hint ...
>>
>> Admittedly I shied away from touching drm/msm.
>
> Well that's kinda my point, we have a pile of maintainers who could
> push this, which means if no one says they do, the patch will likely
> get lost. Especially if the main maintainer (Rob here) smashes an r-b
> onto a patch it's super confusing, at least to me.

the r-b was in case you wanted to pick it up in drm-misc (with the
usual backup plan of sending it in an msm-fixes pull req after the
first rc or two).

I don't mind pushing small fixes to drm-misc instead, since I
generally don't have a lot of 'em

BR,
-R

> I guess this is a downside to having lots of committers, and I started
> to stumble over this in a bunch of places. I think as a rule we should
> always state when we plan to or have merged a patch, and if it's just
> an r-b assume it's lost ... At least that's how I deal with core
> refactorings touching drivers, otherwise we'd probably never get them
> all landed.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
