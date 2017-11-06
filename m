From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 06 Nov 2017 21:29:31 +0000
Subject: Re: [PATCH] drm/amd/display: small cleanup in destruct()
Message-Id: <CADnq5_NSTbpOrDHzWD9ug5jEQspeCO2qpri6f1VaaMKR3yqyDQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106070733.owgzad3bpuabfkkk@mwanda>
 <031c92ca-86b0-718d-bf93-18d50db00ce9@amd.com>
In-Reply-To: <031c92ca-86b0-718d-bf93-18d50db00ce9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tony Cheng <tony.cheng@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Mon, Nov 6, 2017 at 3:44 AM, Christian König
<christian.koenig@amd.com> wrote:
> Am 06.11.2017 um 08:07 schrieb Dan Carpenter:
>>
>> Static analysis tools get annoyed that we don't indent this if
>> statement.  Actually, the if statement isn't required because kfree()
>> can handle NULL pointers just fine.  The DCE110STRENC_FROM_STRENC()
>> macro is a wrapper around container_of() but it's basically a no-op or a
>> cast.  Anyway, it's not really appropriate here so it should be removed
>> as well.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Christian König <christian.koenig@amd.com>

Applied.  thanks!

Alex


>
>> ---
>> v2: in v1 I just added a tab
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> index d911590d08bc..4c4bd72d4e40 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
>> @@ -725,10 +725,8 @@ static void destruct(struct dcn10_resource_pool
>> *pool)
>>                 }
>>         }
>>   -     for (i = 0; i < pool->base.stream_enc_count; i++) {
>> -               if (pool->base.stream_enc[i] != NULL)
>> -               kfree(DCE110STRENC_FROM_STRENC(pool->base.stream_enc[i]));
>> -       }
>> +       for (i = 0; i < pool->base.stream_enc_count; i++)
>> +               kfree(pool->base.stream_enc[i]);
>>         for (i = 0; i < pool->base.audio_count; i++) {
>>                 if (pool->base.audios[i])
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
