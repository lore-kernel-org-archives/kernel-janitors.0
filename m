From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 17 Aug 2017 13:02:07 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: remove redundant null check on array mstm->msto
Message-Id: <5fc967a5-5627-6308-f42b-786be477c30b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817103752.16440-1-colin.king@canonical.com>
 <CACvgo53Bg=HkA-ohgrybg=FqS-p-oxehhsnrA_ZpQpGPo7Oy7Q@mail.gmail.com>
In-Reply-To: <CACvgo53Bg=HkA-ohgrybg=FqS-p-oxehhsnrA_ZpQpGPo7Oy7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

On 17/08/17 13:21, Emil Velikov wrote:
> On 17 August 2017 at 11:37, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check to see if mstm->msto is null is redundant because it is
>> an array and hence can never be null.  Remove the redundant check.
>>
>> Detected by CoverityScan, CID#1375915 ("Array compared against 0")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
>> index f7b4326a4641..51e9081b95a0 100644
>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>> @@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp_mst_port *port,
>>         mstc->connector.funcs->reset(&mstc->connector);
>>         nouveau_conn_attach_properties(&mstc->connector);
>>
>> -       for (i = 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)
>> +       for (i = 0; i < ARRAY_SIZE(mstm->msto); i++)
> I think that should be mstm->msto[i]. After all we are dereferencing
> the pointer, so we don't want to crash.

Yes, that makes far more sense. I'll send a V2. Thanks Emil.

> 
>>                 drm_mode_connector_attach_encoder(&mstc->connector, &mstm->msto[i]->encoder);
> 
> -Emil
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

