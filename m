From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 13 Oct 2016 12:13:11 +0000
Subject: Re: [patch] drm/i915: fix a read size argument
Message-Id: <87zim8wip4.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085508.GJ16198@mwanda> <57FF5380.1080704@bfs.de>
In-Reply-To: <57FF5380.1080704@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, drm-intel-fixes@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, 13 Oct 2016, walter harms <wharms@bfs.de> wrote:
> Am 13.10.2016 10:55, schrieb Dan Carpenter:
>> We want to read 3 bytes here, but because the parenthesis are in the
>> wrong place we instead read:
>> 
>> 	sizeof(intel_dp->edp_dpcd) = sizeof(intel_dp->edp_dpcd)
>> 
>> which is one byte.
>> 
>> Fixes: fe5a66f91c88 ("drm/i915: Read PSR caps/intermediate freqs/etc. only once on eDP")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan, good catch, thank you. Luckily we only really use the first byte
currently...

Cc: <drm-intel-fixes@lists.freedesktop.org>

>> diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
>> index 14a3cf0..ee8aa95 100644
>> --- a/drivers/gpu/drm/i915/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/intel_dp.c
>> @@ -3551,8 +3551,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
>>  	/* Read the eDP Display control capabilities registers */
>>  	if ((intel_dp->dpcd[DP_EDP_CONFIGURATION_CAP] & DP_DPCD_DISPLAY_CONTROL_CAPABLE) &&
>>  	    drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
>> -			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd) =
>> -			     sizeof(intel_dp->edp_dpcd)))
>> +			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) =
>> +			     sizeof(intel_dp->edp_dpcd))
>
>
>
> perhaps we can morph that into something more readable ? I would suggest:
>
>
> if (intel_dp->dpcd[DP_EDP_CONFIGURATION_CAP] & DP_DPCD_DISPLAY_CONTROL_CAPABLE)
>   {
>     size_t size=sizeof(intel_dp->edp_dpcd); /* = EDP_DISPLAY_CTL_CAP_SIZE */
>     int ret;	
>
>     ret=drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,intel_dp->edp_dpcd,size);	
>
>     if (ret != size )
>         ......
>
>  }
>
> this way it improves readability and reduces line length.

Not convinced, let's just take the simple brace fix now.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
