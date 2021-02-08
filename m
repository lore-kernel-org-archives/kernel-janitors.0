From: Walter Harms <wharms@bfs.de>
Date: Mon, 08 Feb 2021 15:55:16 +0000
Subject: AW: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a int
Message-Id: <b9d63b56e0f849f1a5a2def73c899047@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210207230751.8576-1-colin.king@canonical.com>
 <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
 <3aed86cfb8014badbcbc4ee9f007976d@bfs.de>,
 <877bdf13-08d3-b471-40fb-02941cce3e4e@amd.com>
In-Reply-To: <877bdf13-08d3-b471-40fb-02941cce3e4e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Colin King <colin.king@canonical.com>, Alex Deucher <alexander.deucher@amd.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

thx for info
________________________________________
Von: Christian K=F6nig <christian.koenig@amd.com>
Gesendet: Montag, 8. Februar 2021 13:14:49
An: Walter Harms; Colin King; Alex Deucher; David Airlie; Daniel Vetter; Hu=
ang Rui; Junwei Zhang; amd-gfx@lists.freedesktop.org; dri-devel@lists.freed=
esktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of=
 a int

For start and end?  The hardware has 48 bit address space and that won't
fit into 32bits.

Only the fragment handling can't do more than 2GB at the same time.

Christian.

Am 08.02.21 um 12:05 schrieb Walter Harms:
> i am curious:
> what is the win to have a unsigned 64 bit integer in the first
> place ?
>
> re,
>   wh
> ________________________________________
> Von: Christian K=F6nig <christian.koenig@amd.com>
> Gesendet: Montag, 8. Februar 2021 10:17:42
> An: Colin King; Alex Deucher; David Airlie; Daniel Vetter; Huang Rui; Jun=
wei Zhang; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Betreff: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift =
of a int
>
> Am 08.02.21 um 00:07 schrieb Colin King:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The left shift of int 32 bit integer constant 1 is evaluated using 32
>> bit arithmetic and then assigned to an unsigned 64 bit integer. In the
>> case where *frag is 32 or more this can lead to an oveflow.  Avoid this
>> by shifting 1ULL.
> Well that can't happen. Take a look at the code in that function:
>
>>                  max_frag =3D 31;
> ...
>>          if (*frag >=3D max_frag) {
>>                  *frag =3D max_frag;
>>                  *frag_end =3D end & ~((1ULL << max_frag) - 1);
>>          } else {
>>                  *frag_end =3D start + (1 << *frag);
>>          }
> But I'm fine with applying the patch if it silences your warning.
>
> Regards,
> Christian.
>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Fixes: dfcd99f6273e ("drm/amdgpu: meld together VM fragment and huge pag=
e handling")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vm.c
>> index 9d19078246c8..53a925600510 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -1412,7 +1412,7 @@ static void amdgpu_vm_fragment(struct amdgpu_vm_up=
date_params *params,
>>                *frag =3D max_frag;
>>                *frag_end =3D end & ~((1ULL << max_frag) - 1);
>>        } else {
>> -             *frag_end =3D start + (1 << *frag);
>> +             *frag_end =3D start + (1ULL << *frag);
>>        }
>>    }
>>
