From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 21 Mar 2018 19:24:40 +0000
Subject: Re: [PATCH] drm/i915/gvt: don't dereference 'workload' before null checking it
Message-Id: <1c98c69b-694e-2e1e-ed96-748552c7d6d9@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321190653.3829-1-colin.king@canonical.com>
 <1521659361.7999.27.camel@perches.com>
 <a0309d42-a2ab-9270-b486-2325522256b6@canonical.com>
 <152166020495.4865.8856861326837841719@mail.alporthouse.com>
In-Reply-To: <152166020495.4865.8856861326837841719@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wilson <chris@chris-wilson.co.uk>, Joe Perches <joe@perches.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 21/03/18 19:23, Chris Wilson wrote:
> Quoting Colin Ian King (2018-03-21 19:18:28)
>> On 21/03/18 19:09, Joe Perches wrote:
>>> On Wed, 2018-03-21 at 19:06 +0000, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The pointer workload is dereferenced before it is null checked, hence
>>>> there is a potential for a null pointer dereference on workload. Fix
>>>> this by only dereferencing workload after it is null checked.
>>>>
>>>> Detected by CoverityScan, CID#1466017 ("Dereference before null check")
>>>
>>> Maybe true, but is it possible for workload to be null?
>>> Maybe the null test should be removed instead.
>>
>> From what I understand from the static analysis, there may be a
>> potential for workload to be null, I couldn't rule it out so I went with
>> the more paranoid stance of keeping the null check in.
> 
> Not sr_oa_regs() problem if workload is NULL, that's the callers. I
> reviewed the identical patch yesterday, and we ended up with removing
> the NULL checks, just keeping the workload->id != RCS.
> -Chris
> 
Ah, OK, thanks for the clarification Chris.
