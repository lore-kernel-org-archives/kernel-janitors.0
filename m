From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 17 Aug 2017 22:16:47 +0000
Subject: Re: [PATCH][V2] drm/nouveau: perform null check on msto[i] rathern than msto
Message-Id: <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817220323.26717-1-colin.king@canonical.com>
 <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA@mail.gmail.com>
In-Reply-To: <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

On 17/08/17 23:07, Ilia Mirkin wrote:
> On Thu, Aug 17, 2017 at 6:03 PM, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The null check on the array msto is incorrect since msto is never
>> null. The null check should be instead on msto[i] since this is
>> being dereferenced in the call to drm_mode_connector_attach_encoder.
>>
>> Thanks to Emil Velikov for pointing out the mistake in my original
>> fix and for suggesting the correct fix.
>>
>> Detected by CoverityScan, CID#1375915 ("Array compared against 0")
>>
>> Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1.2 multi-stream")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
>> index f7b4326a4641..ed444ecd9e85 100644
>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>> @@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
>>         mstc->connector.funcs->reset(&mstc->connector);
>>         nouveau_conn_attach_properties(&mstc->connector);
>>
>> -       for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)
>> +       for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto[i]; i++)
> 
> Ben will have to rule on which way is correct, but another
> interpretation is that it should be
> 
> for (...; i < ARRAY_SIZE; i++)
>   if (mstm->msto[i])
>     do_stuff()

Yes, I suspect that is a better generic solution top cope with potential
"holes".
> 
> I haven't the faintest clue whether the msto array can have "holes" or not.

Indeed. Let's see what Ben says.


> 
>>                 drm_mode_connector_attach_encoder(&mstc->connector, &mstm->msto[i]->encoder);
>>
>>         drm_object_attach_property(&mstc->connector.base, dev->mode_config.path_property, 0);
>> --
>> 2.11.0
>>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

