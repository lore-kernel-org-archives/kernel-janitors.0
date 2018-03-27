From: rezhu <rezhu@amd.com>
Date: Tue, 27 Mar 2018 08:59:44 +0000
Subject: Re: [PATCH] drm/amd/pp: silence a static checker warning
Message-Id: <d09148ee-c7d7-7248-d1e5-08d349a58199@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323113903.GD28518@mwanda> <20180326033024.GC27239@hr-amur2>
In-Reply-To: <20180326033024.GC27239@hr-amur2>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Evan Quan <evan.quan-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=ef=bf=bdnig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Applied. Thanks.

Best Regards

Rex

On 2018年03月26日 11:30, Huang Rui wrote:
> On Fri, Mar 23, 2018 at 02:39:03PM +0300, Dan Carpenter wrote:
>> This has a static checker warning because "frev" and "crev" can be
>> uninitialized if "info" is NULL.  I just changed the order of the checks
>> so that we check "info" first.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>
>> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
>> index 75a465f771f0..7b26607c646a 100644
>> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
>> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
>> @@ -319,13 +319,13 @@ static int smu8_get_system_info_data(struct pp_hwmgr *hwmgr)
>>   			GetIndexIntoMasterTable(DATA, IntegratedSystemInfo),
>>   			&size, &frev, &crev);
>>   
>> -	if (crev != 9) {
>> -		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
>> +	if (info = NULL) {
>> +		pr_err("Could not retrieve the Integrated System Info Table!\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (info = NULL) {
>> -		pr_err("Could not retrieve the Integrated System Info Table!\n");
>> +	if (crev != 9) {
>> +		pr_err("Unsupported IGP table: %d %d\n", frev, crev);
>>   		return -EINVAL;
>>   	}
>>   
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

