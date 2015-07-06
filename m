From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 06 Jul 2015 21:16:07 +0000
Subject: Re: [patch] drm/radeon: fix underflow in r600_cp_dispatch_texture()
Message-Id: <CADnq5_N8DZxAct-gnpizaMB_P87giSdL7ovvW993eP9QVD9Pag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150703085428.GB11901@mwanda>
	<55965802.3080705@amd.com>
In-Reply-To: <55965802.3080705@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, Jul 3, 2015 at 5:38 AM, Christian König
<christian.koenig@amd.com> wrote:
> On 03.07.2015 10:54, Dan Carpenter wrote:
>>
>> The "if (pass_size > buf->total)" can underflow so I have changed the
>> type of size and pass_size to unsigned to avoid this problem.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Applied.  thanks.

>
>> ---
>> This code is on the way out, but whatever.  I may as well send this
>> patch since I already wrote the patch.
>
>
> Yeah, indeed but it will still take a while until we can really remove it.
>
> Well, maybe it's time to give it a try.

I think it's probably about time.  IIRC, intel already dropped UMS support.

Alex

>
> Regards,
> Christian.
>
>
>>
>> diff --git a/drivers/gpu/drm/radeon/r600_cp.c
>> b/drivers/gpu/drm/radeon/r600_cp.c
>> index 09e3f39..98f9ada 100644
>> --- a/drivers/gpu/drm/radeon/r600_cp.c
>> +++ b/drivers/gpu/drm/radeon/r600_cp.c
>> @@ -2483,7 +2483,7 @@ int r600_cp_dispatch_texture(struct drm_device *dev,
>>         struct drm_buf *buf;
>>         u32 *buffer;
>>         const u8 __user *data;
>> -       int size, pass_size;
>> +       unsigned int size, pass_size;
>>         u64 src_offset, dst_offset;
>>         if (!radeon_check_offset(dev_priv, tex->offset)) {
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
