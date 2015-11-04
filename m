From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 04 Nov 2015 17:15:56 +0000
Subject: Re: [patch] drm/amdgpu: cleanup on error in amdgpu_cs_ioctl()
Message-Id: <CADnq5_PG8=m9h2C1CL6edja_yqn23gkVEdNNZv_zQG6tM+ULhw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132509.GB20966@mwanda>
	<563A11D8.20804@vodafone.de>
In-Reply-To: <563A11D8.20804@vodafone.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple@vodafone.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, Chunming Zhou <david1.zhou@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, "monk.liu" <monk.liu@amd.com>

On Wed, Nov 4, 2015 at 9:10 AM, Christian König <deathsimple@vodafone.de> wrote:
> On 04.11.2015 14:25, Dan Carpenter wrote:
>>
>> We recently changed the locking in this function and now there is a
>> missing unlock on error.  Also there are some other resources that we
>> should probably release as well...
>>
>> Fixes: f48b2659f521 ('drm/amdgpu: fix the broken vm->mutex V2')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Yeah indeed, thanks for catching this.
>
> Patch is Reviewed-by: Christian König <christian.koenig@amd.com>


Applied.  thanks!

Alex

>
>
>> ---
>> I'm not terribly familiar with this code.  Please review this one a bit
>> carefully.
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 27ef528..dfc4d02 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -876,8 +876,10 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void
>> *data, struct drm_file *filp)
>>                 struct amdgpu_job *job;
>>                 struct amdgpu_ring * ring =  parser->ibs->ring;
>>                 job = kzalloc(sizeof(struct amdgpu_job), GFP_KERNEL);
>> -               if (!job)
>> -                       return -ENOMEM;
>> +               if (!job) {
>> +                       r = -ENOMEM;
>> +                       goto out;
>> +               }
>>                 job->base.sched = &ring->sched;
>>                 job->base.s_entity >> &parser->ctx->rings[ring->idx].entity;
>>                 job->adev = parser->adev;
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
