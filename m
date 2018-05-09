From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 09 May 2018 19:50:26 +0000
Subject: Re: [PATCH] drm/amd/display: clean up assignment of amdgpu_crtc
Message-Id: <CADnq5_OEzKSnXWbVaAUDnfK-uinyQGh16K-2iAduYNj6+vXRHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180502144316.32056-1-colin.king@canonical.com>
 <fe695f10-eb1b-f6f4-ae02-c2f12225992c@amd.com>
In-Reply-To: <fe695f10-eb1b-f6f4-ae02-c2f12225992c-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Wed, May 2, 2018 at 11:04 AM, Harry Wentland <harry.wentland@amd.com> wrote:
> On 2018-05-02 10:43 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The declaration of pointer amdgpu_crtc has a redundant assignment to
>> amdgpu_crtc. Clean this up by removing it.
>>
>> Detected by CoverityScan, CID#1460299 ("Evaluation order violation")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Looks like i goofed. Thanks for fixing this.
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>


Applied.  Thanks!

Alex

>
> Harry
>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 1dd1142246c2..2beb8821e19e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3773,7 +3773,7 @@ static void remove_stream(struct amdgpu_device *adev,
>>  static int get_cursor_position(struct drm_plane *plane, struct drm_crtc *crtc,
>>                              struct dc_cursor_position *position)
>>  {
>> -     struct amdgpu_crtc *amdgpu_crtc = amdgpu_crtc = to_amdgpu_crtc(crtc);
>> +     struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
>>       int x, y;
>>       int xorigin = 0, yorigin = 0;
>>
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
