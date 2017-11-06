From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 06 Nov 2017 21:35:32 +0000
Subject: Re: [PATCH] drm/amd/display: remove some unneeded code
Message-Id: <CADnq5_PvNnZjKA+sB7j9cS3eJj20g==W+J72DfDHmS=A-WsD6Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106114422.sd5zoah6k6eaww4e@mwanda>
 <f1752f40-42fc-7c3e-38ae-50e1d3b1617b@gmail.com>
In-Reply-To: <f1752f40-42fc-7c3e-38ae-50e1d3b1617b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christian Koenig <christian.koenig@amd.com>
Cc: Charlene Liu <charlene.liu@amd.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Yongqiang Sun <yongqiang.sun@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <tony.cheng@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>

On Mon, Nov 6, 2017 at 6:59 AM, Christian König
<ckoenig.leichtzumerken@gmail.com> wrote:
> Am 06.11.2017 um 12:44 schrieb Dan Carpenter:
>>
>> We assign "v_init = asic_blank_start;" a few lines earlier so there is
>> no need to do it again inside the if statements.  Also "v_init" is
>> unsigned so it can't be less than zero.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Christian König <christian.koenig@amd.com>
>

Applied.  thanks!

Alex

>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
>> b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
>> index 1994865d4351..c7333cdf1802 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
>> @@ -236,13 +236,10 @@ static void tgn10_program_timing(
>>         if (tg->dlg_otg_param.signal == SIGNAL_TYPE_DISPLAY_PORT ||
>>                 tg->dlg_otg_param.signal == SIGNAL_TYPE_DISPLAY_PORT_MST
>> ||
>>                 tg->dlg_otg_param.signal == SIGNAL_TYPE_EDP) {
>> -               v_init = asic_blank_start;
>>                 start_point = 1;
>>                 if (patched_crtc_timing.flags.INTERLACE == 1)
>>                         field_num = 1;
>>         }
>> -       if (v_init < 0)
>> -               v_init = 0;
>>         v_fp2 = 0;
>>         if (tg->dlg_otg_param.vstartup_start > asic_blank_end)
>>                 v_fp2 = tg->dlg_otg_param.vstartup_start > asic_blank_end;
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
