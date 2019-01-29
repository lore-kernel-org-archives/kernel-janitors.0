From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Tue, 29 Jan 2019 21:04:33 +0000
Subject: Re: [PATCH] drm/nouveau: fix missing break in switch statement
Message-Id: <c1026416-6cab-725d-b13d-bebc1c3a7583@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008204736.8941-1-colin.king@canonical.com>
 <63660e1c-1075-80a0-6b11-5f1a8cb253fc@embeddedor.com>
In-Reply-To: <63660e1c-1075-80a0-6b11-5f1a8cb253fc-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



On 1/29/19 2:49 PM, Gustavo A. R. Silva wrote:
> 
> 
> On 10/8/18 3:47 PM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The NOUVEAU_GETPARAM_PCI_DEVICE case is missing a break statement and falls
>> through to the following NOUVEAU_GETPARAM_BUS_TYPE case and may end up
>> re-assigning the getparam->value to an undesired value. Fix this by adding
>> in the missing break.
>>
>> Detected by CoverityScan, CID#1460507 ("Missing break in switch")
>>
>> Fixes: 359088d5b8ec ("drm/nouveau: remove trivial cases of nvxx_device() usage")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> Friendly ping:
> 
> Who can take this?
> 

BTW, this should be tagged for stable:

Cc: stable@vger.kernel.org

Thanks
--
Gustavo


>> ---
>>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> index e67a471331b5..6ec745873bc5 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
>> @@ -214,6 +214,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>>  			WARN_ON(1);
>>  			break;
>>  		}
>> +		break;
>>  	case NOUVEAU_GETPARAM_FB_SIZE:
>>  		getparam->value = drm->gem.vram_available;
>>  		break;
>>
