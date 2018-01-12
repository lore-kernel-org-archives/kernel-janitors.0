From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 12 Jan 2018 18:08:30 +0000
Subject: Re: [Intel-gfx] [PATCH][next] drm/i915/pmu: fix sizeof on attr, should be *attr
Message-Id: <0ea4c371-686a-5151-60f9-503d3720e187@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180112173603.28486-1-colin.king@canonical.com>
 <1465951f-474c-e157-892b-33d12ad436cb@linux.intel.com>
In-Reply-To: <1465951f-474c-e157-892b-33d12ad436cb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/01/18 17:48, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 12/01/2018 17:36, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> I believe the sizeof(attr) should be in fact sizeof(*attr), fortunately
>> the current code works because sizeof(struct attribute **) is the same
>> as sizeof(struct attribute *) for x86.
> 
> Thanks, kbuild also reported it and I just pushed a fix.
> 
> Out of curiosity, there are platforms where size of pointer is different
> from the size of a pointer to a pointer?

None that I know of.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Detected by CoverityScan, CID#1463854 ("Sizeof not portable")
>>
>> Fixes: 109ec558370f ("drm/i915/pmu: Only enumerate available counters
>> in sysfs")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/gpu/drm/i915/i915_pmu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_pmu.c
>> b/drivers/gpu/drm/i915/i915_pmu.c
>> index 95ab5e28f5be..9be4f5201e41 100644
>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -794,7 +794,7 @@ create_event_attributes(struct drm_i915_private
>> *i915)
>>           goto err_alloc;
>>         /* Max one pointer of each attribute type plus a termination
>> entry. */
>> -    attr = kzalloc((count * 2 + 1) * sizeof(attr), GFP_KERNEL);
>> +    attr = kzalloc((count * 2 + 1) * sizeof(*attr), GFP_KERNEL);
>>       if (!attr)
>>           goto err_alloc;
>>  

