From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 25 Sep 2018 07:57:30 +0000
Subject: Re: [PATCH -next] drm/tegra: Use PTR_ERR_OR_ZERO in tegra_gem_create()
Message-Id: <ad47881b-59fb-7608-379c-c98cc9cc40a4@kapsi.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537839351-104885-1-git-send-email-yuehaibing@huawei.com>
 <ad3ed7e3-17dd-a418-f951-3cae69b0ac32@kapsi.fi>
 <alpine.DEB.2.21.1809250936290.2702@hadrien>
In-Reply-To: <alpine.DEB.2.21.1809250936290.2702@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org

On 25/09/2018 16.37, Julia Lawall wrote:
> 
> 
> On Tue, 25 Sep 2018, Mikko Perttunen wrote:
> 
>> I'm not the maintainer, but in line with previous similar patches..
>>
>> NAK: this makes the code harder to read.
> 
> If people don't like it, I wonder if it is a good thing for the function
> to even exist?  Or at least the semantic patch that suggests this could be
> removed.

Good question. I think it may still have its place in some situations - 
e.g. if there's only one call, something like

   return PTR_ERR_OR_ZERO(do_something());

where this is the only potentially erroring thing in the function.

In this case (and the previous ones I referred to), it's been a function 
with a longer series of code like

   variable = function(...);
   if (IS_ERR(variable))
     return PTR_ERR(variable);

and if we just change the last one it looks out of place. Although 
honestly, I would just write the first example in long-form as well.

In the end it's a question of taste. With Tegra code we have gone for 
not using PTR_ERR_OR_ZERO.

Cheers,
Mikko

> 
> julia
> 
>>
>> Thanks,
>> Mikko
>>
>> On 25/09/2018 10.35, YueHaibing wrote:
>>> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>    drivers/gpu/drm/tegra/drm.c | 5 +----
>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>>> index e22352c..056f749 100644
>>> --- a/drivers/gpu/drm/tegra/drm.c
>>> +++ b/drivers/gpu/drm/tegra/drm.c
>>> @@ -497,10 +497,7 @@ static int tegra_gem_create(struct drm_device *drm,
>>> void *data,
>>>      	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
>>>    					 &args->handle);
>>> -	if (IS_ERR(bo))
>>> -		return PTR_ERR(bo);
>>> -
>>> -	return 0;
>>> +	return PTR_ERR_OR_ZERO(bo);
>>>    }
>>>      static int tegra_gem_mmap(struct drm_device *drm, void *data,
>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
