From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 11 Jun 2018 16:37:43 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: remove redundant GEM_BUG_ON check
Message-Id: <4115c6fb-7031-27ca-f891-55c0806895dd@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180611160037.23402-1-colin.king@canonical.com>
 <20180611162552.GY23723@intel.com>
In-Reply-To: <20180611162552.GY23723@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On 11/06/18 17:25, Ville Syrjälä wrote:
> On Mon, Jun 11, 2018 at 05:00:37PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check for level being less than zero is redundant as level
>> is an unsigned u32 and hence will never be less than zero.
>> Remove this redundant check.
>>
>> Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/i915/intel_guc.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_guc.c b/drivers/gpu/drm/i915/intel_guc.c
>> index 116f4ccf1bbd..a2f782a4f97d 100644
>> --- a/drivers/gpu/drm/i915/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/intel_guc.c
>> @@ -208,8 +208,6 @@ static u32 get_log_control_flags(void)
>>  	u32 level = i915_modparams.guc_log_level;
>>  	u32 flags = 0;
>>  
>> -	GEM_BUG_ON(level < 0);
> 
> i915_modparams.guc_log_level is a signed int. So s/u32/int would seem
> like a better fix.

Good point, I somehow thought it  guc_loc_level was unsigned, but I was
wrong. Sending a V2.

> 
>> -
>>  	if (!GUC_LOG_LEVEL_IS_ENABLED(level))
>>  		flags |= GUC_LOG_DEFAULT_DISABLED;
>>  
>> -- 
>> 2.17.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 

