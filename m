From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 12 Jun 2018 09:23:07 +0000
Subject: Re: [PATCH][V2] drm/i915/guc: fix GEM_BUG_ON check
Message-Id: <87d0ww2was.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180611164653.13691-1-colin.king@canonical.com>
 <20180612091016.yi4lbmdgcltmcen3@mwanda>
In-Reply-To: <20180612091016.yi4lbmdgcltmcen3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Tue, 12 Jun 2018, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, Jun 11, 2018 at 05:46:53PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>> 
>> The check for level being less than zero always false because flags
>> is currently unsigned and can never be negative. Fix this by making
>> flags a s32.
>> 
>> Detected by CoverityScan, CID#1468363 ("Macro compares unsigned to 0")
>> 
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> 
>> ---
>> V2: Make flags s32 rather than remove the GEM_BUG_ON check, thanks to
>> Ville Syrjälä for spotting the mistake in my first attempt.
>> ---
>>  drivers/gpu/drm/i915/intel_guc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/intel_guc.c b/drivers/gpu/drm/i915/intel_guc.c
>> index 116f4ccf1bbd..fb31f5004bcf 100644
>> --- a/drivers/gpu/drm/i915/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/intel_guc.c
>> @@ -206,7 +206,7 @@ void intel_guc_fini(struct intel_guc *guc)
>>  static u32 get_log_control_flags(void)
>>  {
>>  	u32 level = i915_modparams.guc_log_level;
>> -	u32 flags = 0;
>> +	s32 flags = 0;
>>  
>>  	GEM_BUG_ON(level < 0);
>
> Only insane people use "s32" when it's not part of the hardware spec and
> you changed the wrong variable...

Yeah, int level.

Also,

Fixes: cb5d64e9f13e ("drm/i915/guc: Allow user to control default GuC logging")

BR,
Jani.


>
> regards,
> dan carpenter
>

-- 
Jani Nikula, Intel Open Source Graphics Center
