From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 10 Oct 2017 14:36:16 +0000
Subject: Re: [PATCH] drm/i915: remove redundant check on has_aliasing_ppgtt
Message-Id: <107fa0b9-11ac-11cc-f6e8-35640430bd6f@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171010134733.17516-1-colin.king@canonical.com>
 <1507646100.7677.24.camel@linux.intel.com>
In-Reply-To: <1507646100.7677.24.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/10/17 15:35, Joonas Lahtinen wrote:
> On Tue, 2017-10-10 at 14:47 +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a previous check to on has_aliasing_ppgtt that returns
>> 0 if it is false, so it is impossible for has_aliasing_ppgtt to
>> be false on the final return of function intel_sanitize_enable_ppgtt,
>> so final return in the function always will return 1.  Hence the
>> redundant ternary operator can be replaced with a return 1.
>>
>> Detected by CoverityScan, CID#1357136 ("Logically dead code")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks, I took it a few steps further and removed the variable
> altogether. I Cc'd you on the patch.

Yep, it's an improvement on my fix. Thanks for sorting that out.

Colin

> 
> Regards, Joonas
> 

