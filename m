From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Mon, 06 Nov 2017 11:59:29 +0000
Subject: Re: [PATCH] drm/amd/display: remove some unneeded code
Message-Id: <f1752f40-42fc-7c3e-38ae-50e1d3b1617b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106114422.sd5zoah6k6eaww4e@mwanda>
In-Reply-To: <20171106114422.sd5zoah6k6eaww4e@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: Charlene Liu <charlene.liu-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Yongqiang Sun <yongqiang.sun-5C7GfCeVMHo@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Vitaly Prosyak <vitaly.prosyak-5C7GfCeVMHo@public.gmane.org>

Am 06.11.2017 um 12:44 schrieb Dan Carpenter:
> We assign "v_init =3D asic_blank_start;" a few lines earlier so there is
> no need to do it again inside the if statements.  Also "v_init" is
> unsigned so it can't be less than zero.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.=
c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
> index 1994865d4351..c7333cdf1802 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_timing_generator.c
> @@ -236,13 +236,10 @@ static void tgn10_program_timing(
>   	if (tg->dlg_otg_param.signal =3D SIGNAL_TYPE_DISPLAY_PORT ||
>   		tg->dlg_otg_param.signal =3D SIGNAL_TYPE_DISPLAY_PORT_MST ||
>   		tg->dlg_otg_param.signal =3D SIGNAL_TYPE_EDP) {
> -		v_init =3D asic_blank_start;
>   		start_point =3D 1;
>   		if (patched_crtc_timing.flags.INTERLACE =3D 1)
>   			field_num =3D 1;
>   	}
> -	if (v_init < 0)
> -		v_init =3D 0;
>   	v_fp2 =3D 0;
>   	if (tg->dlg_otg_param.vstartup_start > asic_blank_end)
>   		v_fp2 =3D tg->dlg_otg_param.vstartup_start > asic_blank_end;
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
