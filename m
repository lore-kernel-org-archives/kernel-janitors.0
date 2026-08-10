Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47384052CD
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375161; cv=pass; b=kzP0pA4HMep8nKGxSYw7pzSifft6L9Vo7mbLP9zsRXCRaOLCeYhLBlGh2rawg+fY0IMSPzwjH22m5jd0/lJp/3vYGMZtheYmkDzI7wMoMLCmrwpCvhGd9K61vCZF9PY93Q1GF/lXYC/qzrjxGQ/y2fIajK/T7unQdjYOwDTszUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375161; c=relaxed/simple;
	bh=8y51j4PXeB+stRSloP+bhIX8c1KSNmSBxwd7NUjH8l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7MoBv3z7g008GJgvdJrYUMIFHsXXwgE1KNr+v5GtZHwyie4FuWe9ArBiNfnKIiiGCpShHcB+YCav321lyzodzYcE7EOPSjaovVp4lqnDdRh5RIBEvviGvUVYXQdr1/M4KWH1PqIDyg3EfO5VN/7AR5rSjWo5icue2anMwW1W68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pqs/wd97; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pqs/wd97"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384422b05b5so197712a91.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Aug 2026 08:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786375159; cv=none;
        d=google.com; s=arc-20260327;
        b=LAaqYHhbQspMy2JjQS/cSy5THsbBzNgv52UY5iY4h0G0cj2RhMDYv4Dp54XmJAwd7U
         N919r5HLzyGkN2YKu9e1qBFl6/6iqwNkn4KUwUhFAN6OS4N8D6uRquWTQAoHlwjN0rIW
         unSkXe7MQaVlSrqz13buuYIbMNKBxs8gk8YJIYMCUOXDJLvfYuqoGikEcOQyrpwTjG2J
         5/wHsa47bjiOszob7ZFUzXlq0AueFZIfXu5ntFJY/QSTcAxKhiX3u7qzm/pnpJNlo1rM
         NRpL3J9MrSLQhaLDUIOyhippjofpA4Ev5SmqOQEmAvhooBfz/mEExOyn4175ji2gvHyQ
         k72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1rzR26ClzMaYFuUSq8Lzwl7sxG7gX5jiXeOHc3Ewd4=;
        fh=g9ogdjXkcHhgeIVcaFTMY7pKosm5dgnVvpAR/qnwW4c=;
        b=AyfxQrouUZNlmj+2e0igpXblVas3AwlcnSzUf65+5cC1oWpMJQ4okLLRVpXxVUO7uN
         pMXq02vcF6TK7ioQo+G5Xm+oC20K00X7F8erwLnsy36L45mGBlFwvVztY54VYH+HDtWn
         Fug26UfKgw34Kr/WrSA6MKhqDHiRtpPwn73/rLYB7BfLWEfxP/M0k3grLaq1mAY6AHkk
         +eq2mJedkepO1+TWSiJt2Y8xsmbapjsNh68HXdQdpSR43fCeOrnM6p51oMUGyo+Snn72
         qS94yJohQspC7W+0XaH6nLdvVTmqDq2rsZh279ioORvorxLENOV3xFmh6NEPE30NLqgM
         468w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375159; x=1786979959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1rzR26ClzMaYFuUSq8Lzwl7sxG7gX5jiXeOHc3Ewd4=;
        b=Pqs/wd97Lq+WyWeyX4v3SemoQE2jbYPXGOSedZfyGYTokP7PHWmMSV1h8hI45wcxeC
         INoE3Shyx+BV/KHP44XD3R8k4uzQRDgyPYAkDJKk3vecH8/rE0GaBNmWov6jbtkRUwJr
         iU/ZdOSinJEWylZFEatwCMorI5v/tDksl2PNiA3d3zYOtd6ttMdQu/H1LqfhHxJp79e3
         idUk+pYI8EB9+4uKp/K74gdWbPsuWBCzdIGAfyBELXEAqMY8rkt5Ys3U23aRS8j8emQr
         Lc0by8ASelGeYAHghwindzcPzXeB2Fc6aVBJ+m7J6BREFQN+TIcRG5ZAd/2qQPHqCJX+
         IODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375159; x=1786979959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1rzR26ClzMaYFuUSq8Lzwl7sxG7gX5jiXeOHc3Ewd4=;
        b=JoNY1NbyONZnArs1avwpBVhGagIrk4AMnW7MVEYLj19NZlct9umFgI9ydIfB6rh9R6
         SCHnG6fp2Qww3kX85//Nc3gSIsid8tclQwgAx16WHnyQKWFncjL5TE/HIlt0+zDTpHmt
         oa3+kFu81s7GFTTa5F1ZXx6iopXylh8naoZN1FDbQ49lJ+ZhZyS0vXu1Lzwo96O7Jhbe
         oeoNTHdleNWsm76NWcpcOHdcwXTIiUVKOEtFTxOVl3ApFCtonY+TiqoJrwuRZIYWiWUo
         AxC7zaE+8+MHgyJZNUSLekAMY3K/fXSBZ41wCv/3n2yjEm8iZcMzMgQ8HCYhZU6WCGi1
         wTCA==
X-Forwarded-Encrypted: i=1; AHgh+Rq91XoovbPJOPjVThD6eHmisGGc3kHBPFtPtFjLVcrYE4w9v9PTp0N/wwAgW1hNsV1bbOC2ZHLwJq5blceSoDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbUgxUXfNr2/1HRS4RFHgkZOyoZA4YJqosmB3UFwKojdTE5f3
	OD/bC9m6rFasqNn4P5t+mb8giFmSb5/u/DmSchTO+WrDDgujEGZczSHrRuUdw+uX0sDHMTu3Tot
	kG7zvKpQm7RIB7ObNni7pUJ11+ljTAFI=
X-Gm-Gg: AR+sD10361dREx1xfH3ai9PJBaslB6LrKsS5o81E9AqfJhqmjZhwh8PNrFbeRLTpiIy
	otG/kmrnZFA4qaljnkF+nJP2xOKtglvdIJiX+6I8JXZdZMGi5AqVUj3GkjEvj0VLoDAtlV0gghM
	6atjB27GeYgx6CwudRwl8ClTonHFInlOc7G1V39t+19YMYL5x2tKyc88sIXG7O6pZtC7xnqZFdG
	fi+dBjksdignTbD+4DyUoxw6M9EhjRsyGMepcOdGfedqTlUXgyBkw2SSJuiMgyKPHHyhxgNOgFC
	0aNK6hudnquH2Ptm0aeaktDWw2f9U6xxLU6+yK9T16vcW0i8YIQAaok8iz4caKf0Z1tRJlqDoq1
	EL47cWijmnipwLprfocTW696cyHwZ/UyPaCpbbvzvCGE=
X-Received: by 2002:a17:90b:1651:b0:38e:6a7c:abbc with SMTP id
 98e67ed59e1d1-3903c7278f5mr30731971a91.3.1786375159041; Mon, 10 Aug 2026
 08:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aneGaKJUl_Jyu05n@stanley.mountain> <77e1ef2b-24ab-4492-bc91-08c01f012a46@amd.com>
In-Reply-To: <77e1ef2b-24ab-4492-bc91-08c01f012a46@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Aug 2026 11:19:07 -0400
X-Gm-Features: AUfX_my-fKt5c9y2JIhF4-1Z_U26HVMXLUvLd5Y3sRxip_FQzAlVj9Rt96mRi6A
Message-ID: <CADnq5_Mc89DZGYwXrCQ+WLYVE8RBj9vdV5TBbZbwgcuV==HeEA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: silence uninitialized variable warnings
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Dan Carpenter <error27@gmail.com>, Asad Kamal <asad.kamal@amd.com>, 
	Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Yang Wang <kevinyang.wang@amd.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Mon, Aug 10, 2026 at 12:50=E2=80=AFAM Lazar, Lijo <lijo.lazar@amd.com> w=
rote:
>
>
>
> On 09-Aug-26 1:11 AM, Dan Carpenter wrote:
> > Smatch complains that:
> >
> >      drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_8_ppt.c:196=
4
> >      smu_v15_0_8_set_performance_level() error: uninitialized symbol 'r=
et'.
> >
> > In this line there is an "if (ret)" condition where "ret" is either
> > zero or uninitialized.  Initialize "ret" at the start of the function t=
o
> > avoid a potential uninitialized variable bug.  But also delete the
> > condition since it is never true.
> >
> > Fixes: 422b399b09c7 ("drm/amd/pm: Add od_edit_dpm_table support")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> > ---
> >   drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c b/dri=
vers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
> > index 59fdd2319b66..c78e611d2a25 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu15/smu_v15_0_8_ppt.c
> > @@ -1920,7 +1920,7 @@ static int smu_v15_0_8_set_performance_level(stru=
ct smu_context *smu,
> >       struct smu_dpm_table *gfx_table =3D &dpm_context->dpm_tables.gfx_=
table;
> >       struct smu_dpm_table *uclk_table =3D &dpm_context->dpm_tables.ucl=
k_table;
> >       struct smu_umd_pstate_table *pstate_table =3D &smu->pstate_table;
> > -     int ret;
> > +     int ret =3D 0;
> >
> >       switch (level) {
> >       case AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM:
> > @@ -1961,9 +1961,6 @@ static int smu_v15_0_8_set_performance_level(stru=
ct smu_context *smu,
> >                               SMU_DPM_TABLE_MAX(uclk_table);
> >               }
> >
> > -             if (ret)
> > -                     goto out;
> > -
> >               smu_cmn_reset_custom_level(smu);
> >
> >               break;
>
