From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Aug 2017 18:23:19 +0000
Subject: Re: [PATCH] drm/amdgpu: check memory allocation failure
Message-Id: <CADnq5_NsFdS7dzogNVd=C_z3rCFfisST69gN8kYEWA+-bouhvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823055236.25451-1-christophe.jaillet@wanadoo.fr>
 <9a4b653f-6445-f8d3-70c9-91ca9b059839@amd.com>
In-Reply-To: <9a4b653f-6445-f8d3-70c9-91ca9b059839-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
Cc: Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, John Brooks <john-xq/Ko7C6e2Bl57MIdRCFDg@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, Andres Rodriguez <andresx7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "monk.liu" <Monk.Liu-5C7GfCeVMHo@public.gmane.org>, Alex Xie <AlexBin.Xie-5C7GfCeVMHo@public.gmane.org>

On Wed, Aug 23, 2017 at 4:39 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 23.08.2017 um 07:52 schrieb Christophe JAILLET:
>>
>> Check memory allocation failure and return -ENOMEM in such a case.
>>
>> 'num_post_dep_syncobjs' still has to be set to 0 before the test in order
>> to have it initialized if 'amdgpu_cs_parser_fini()' is called to free
>> resources.
>>
>> The calling graph would be, in such a case!
>>     failure in amdgpu_cs_process_syncobj_out_dep()
>>        ---> error code returned by amdgpu_cs_dependencies()
>>           --> amdgpu_cs_parser_fini() is called
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Applied.  thanks!

Alex

>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 15d4a28d73bb..baa90df90aea 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1079,6 +1079,9 @@ static int amdgpu_cs_process_syncobj_out_dep(struct
>> amdgpu_cs_parser *p,
>>                                              GFP_KERNEL);
>>         p->num_post_dep_syncobjs = 0;
>>   +     if (!p->post_dep_syncobjs)
>> +               return -ENOMEM;
>> +
>>         for (i = 0; i < num_deps; ++i) {
>>                 p->post_dep_syncobjs[i] = drm_syncobj_find(p->filp,
>> deps[i].handle);
>>                 if (!p->post_dep_syncobjs[i])
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
