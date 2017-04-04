From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Tue, 04 Apr 2017 06:34:43 +0000
Subject: Re: [PATCH] drm/amdgpu: Fix a NULL deref in amdgpu_vm_add_prt_cb()
Message-Id: <97a45ac6-9d6d-7adf-fc2a-af092c719027@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170403184139.GA12398@mwanda>
 <10afeb82-a698-5684-0303-5c9a3895d99f@amd.com>
 <CADnq5_ML1S6h+EBntBkNeGVWYO9f9cL=ZpSCQHd2kTzV2VdVDg@mail.gmail.com>
In-Reply-To: <CADnq5_ML1S6h+EBntBkNeGVWYO9f9cL=ZpSCQHd2kTzV2VdVDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Alex Deucher <alexdeucher@gmail.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Junwei Zhang <Jerry.Zhang@amd.com>, Edward O'Callaghan <funfunctor@folklore1984.net>, Alex Xie <AlexBin.Xie@amd.com>

Am 03.04.2017 um 22:36 schrieb Alex Deucher:
> On Mon, Apr 3, 2017 at 2:53 PM, Harry Wentland <harry.wentland@amd.com> w=
rote:
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Harry
>>
> Applied.  thanks!

Nice catch, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> if=
=20
Alex still wants to add that.

Christian.

>
> Alex
>
>> On 2017-04-03 02:41 PM, Dan Carpenter wrote:
>>> We accidentally dereference "cb" if the kmalloc() fails.
>>>
>>> Fixes: 451bc8eb8fe6 ("drm/amdgpu: fix PRT teardown on VM fini v3")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 0235d7933efd..45a1bcfc41f7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -1518,7 +1518,7 @@ static void amdgpu_vm_add_prt_cb(struct
>>> amdgpu_device *adev,
>>>                  if (fence)
>>>                          dma_fence_wait(fence, false);
>>>
>>> -               amdgpu_vm_prt_put(cb->adev);
>>> +               amdgpu_vm_prt_put(adev);
>>>          } else {
>>>                  cb->adev =3D adev;
>>>                  if (!fence || dma_fence_add_callback(fence, &cb->cb,
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
