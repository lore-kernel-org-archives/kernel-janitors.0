From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Sat, 04 Nov 2017 10:07:29 +0000
Subject: Re: [PATCH] drm/amd/display: indent an if statement
Message-Id: <e32e3d91-bfdf-5c4b-afb2-2472efeb1079@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104061232.5bq5hwr2p2ca2cl7@mwanda> <59FD8567.4030500@bfs.de>
In-Reply-To: <59FD8567.4030500-fPG8STNUNVg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms-fPG8STNUNVg@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, Hersen Wu <hersenxs.wu-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Yue Hin Lau <Yuehin.Lau-5C7GfCeVMHo@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>

Am 04.11.2017 um 10:16 schrieb walter harms:
>
> Am 04.11.2017 07:12, schrieb Dan Carpenter:
>> The if statement wasn't indented so it makes static analysis tools and
>> probably very recent GCC versions complain.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> I went over 80 characters because other lines do already and it seemed
>> like the cleanest thing here.
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> index d911590d08bc..c83ac4d9ca3a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> @@ -727,7 +727,7 @@ static void destruct(struct dcn10_resource_pool *pool)
>>   
>>   	for (i = 0; i < pool->base.stream_enc_count; i++) {
>>   		if (pool->base.stream_enc[i] != NULL)
>> -		kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
>> +			kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
>>   	}
>>   
> Is that "if (pool->base.stream_enc[i] != NULL)" needed at all ?
> kfree() should happily handle NULL.

Yeah, indeed. The correct solution would be to just drop the "if" as 
well as the "{}".

I would also drop the cast done by DCE110STRENC_FROM_STRENC, cause 
kfree() doesn't care about the type of the pointer.

Regards,
Christian.

>
> re,
>   wh
>
>
>
>>   	for (i = 0; i < pool->base.audio_count; i++) {
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

