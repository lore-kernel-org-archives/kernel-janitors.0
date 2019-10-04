From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 04 Oct 2019 21:53:44 +0000
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer disable_done
Message-Id: <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004162156.325-1-colin.king@canonical.com>
 <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
In-Reply-To: <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: James Wang <james.qian.wang@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/10/2019 20:27, Liviu Dudau wrote:
> On Fri, Oct 04, 2019 at 05:21:56PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The pointer disable_done is being initialized with a value that
>> is never read and is being re-assigned a little later on. The
>> assignment is redundant and hence can be removed.
> 
> Not really true, isn't it? The re-assignment is done under the condition that
> crtc->state->active is true. disable_done will be used regardless after the if
> block, so we can't skip this initialisation.
> 
> Not sure why Coverity flags this, but I would NAK this patch.

I'm patching against the driver from linux-next so I believe this is OK
for that. I believe your statement is true against linux which does not
have commit:

d6cb013579e743bc7bc5590ca35a1943f2b8f3c8
Author: Lowry Li (Arm Technology China) <Lowry.Li@arm.com>
Date:   Fri Sep 6 07:18:06 2019 +0000

Colin.

> 
> Best regards,
> Liviu
> 
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> index 75263d8cd0bd..9beeda04818b 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
>> @@ -296,7 +296,7 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
>>  	struct komeda_crtc_state *old_st = to_kcrtc_st(old);
>>  	struct komeda_pipeline *master = kcrtc->master;
>>  	struct komeda_pipeline *slave  = kcrtc->slave;
>> -	struct completion *disable_done = &crtc->state->commit->flip_done;
>> +	struct completion *disable_done;
>>  	bool needs_phase2 = false;
>>  
>>  	DRM_DEBUG_ATOMIC("CRTC%d_DISABLE: active_pipes: 0x%x, affected: 0x%x\n",
>> -- 
>> 2.20.1
>>
> 
