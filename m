From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Oct 2016 16:48:20 +0000
Subject: Re: [patch] drm/amdgpu: potential NULL dereference in debugfs code
Message-Id: <CADnq5_PX+E0WO5ACAd31P3PJiSfc8EvLW21_bdvrP0ivURj9Dw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012061730.GP12841@mwanda>
 <0d178bc4-49e3-4073-2ccc-d0d196d6f5db@amd.com>
In-Reply-To: <0d178bc4-49e3-4073-2ccc-d0d196d6f5db@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Junwei Zhang <Jerry.Zhang@amd.com>, Monk Liu <Monk.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Oct 12, 2016 at 5:20 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 12.10.2016 um 08:17 schrieb Dan Carpenter:
>>
>> debugfs_create_file() returns NULL on error, it only returns error
>> pointers if debugfs isn't enabled in the config and we checked for that
>> earlier so it can't happen.
>>
>> Fixes: 4f4824b55650 ('drm/amd/amdgpu: Convert ring debugfs entries to
>> binary')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>.
>

Applied.  thanks!

Alex

>
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> index 85aeb0a..8d16eaf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> @@ -371,8 +371,8 @@ static int amdgpu_debugfs_ring_init(struct
>> amdgpu_device *adev,
>>         ent = debugfs_create_file(name,
>>                                   S_IFREG | S_IRUGO, root,
>>                                   ring, &amdgpu_debugfs_ring_fops);
>> -       if (IS_ERR(ent))
>> -               return PTR_ERR(ent);
>> +       if (!ent)
>> +               return -ENOMEM;
>>         i_size_write(ent->d_inode, ring->ring_size + 12);
>>         ring->ent = ent;
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
