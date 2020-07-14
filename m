From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 14 Jul 2020 18:12:23 +0000
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/selftest: Fix an error code in live_noa_gpr()
Message-Id: <d7ad55da-4db0-9861-1882-a52a9646260c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714143652.GA337376@mwanda>
 <29d5e25e-45e1-fca0-7d09-fd5e303b9eea@intel.com>
 <159474692212.3188.5286642208247298191@build.alporthouse.com>
 <20200714180852.GC2571@kadam>
In-Reply-To: <20200714180852.GC2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On 14/07/2020 19:08, Dan Carpenter wrote:
> On Tue, Jul 14, 2020 at 06:15:22PM +0100, Chris Wilson wrote:
>> Quoting Lionel Landwerlin (2020-07-14 15:39:21)
>>> On 14/07/2020 17:36, Dan Carpenter wrote:
>>>> The error code needs to be set on this path.  It currently returns
>>>> success.
>>>>
>>>> Fixes: ed2690a9ca89 ("drm/i915/selftest: Check that GPR are restored across noa_wait")
>>>> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> ---
>>>> v2: Fix a different bug instead.  :P  Colin fixed mine already.
>>
>> I was thinking that Colin already sent the patch for this one...
> 
> Colin sent a fix for my v1 bug.  commit d2921096e707 ("drm/i915/selftest:
> fix an error return path where err is not being set") but I don't think
> he fixed this one.

Yep, coverity didn't pick the other issue up for some reason.

> 
> regards,
> dan carpenter
> 
