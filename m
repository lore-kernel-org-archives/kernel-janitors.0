Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417573;
	b=vFQi311ZeRDW2Fu7wcEoRgJBWe8QI+gl0s0iy2Q8+4trlW1wyYYqhkSz1jZV5BRWpSbd
	 j9dhMyt/y8UJ/9RAGZsiN7ZVwaHfb9va1ODGQAUpWkmLPpSKnfE5x+4uDEz69Y/YjdBfY
	 k8NeFsFJIvty84Ju7Gcj0me4GuXLAgeRBuF42VMfGB2aW9ljZeTJF4IKRr2g975uyhykB
	 Ba3Qx0gb+dKMvsozE8JuQeC2bXCUOtuNE65Pj86eINVya6xwn/Hkt/+i2LCtDtRJEDuDA
	 hGLh0X3qyHL7g+sbxPb1hpUDnWEqIWTqZTI0Sj8hm51W3floe758FKnDvIauzaVXW4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
	b=03BBJMDzm6GqHYggcQT6gDsobSgKkO20eGqbY10H4z60vhBYcQ2ZEVNmweQG3Fse1acr
	 iKxNrq2FxBTz/M74hb8MAsOFIO5leqnmKs1drZ7VW+Q2GQHwQWt71D1yH3khFss+fdFgQ
	 N75QwD7ZEEKwb/fOMwCuFz2ggmPOG//mdoRXxVsH5uRfpqxLLFQjq+WpQlloZG8ajNStM
	 ns2eTcmxS+lpGGZRUjWNmvFi1mstckJ2zyBSp6M67Z/Z9ID2cYD9JJrZefNb4jJyceR0I
	 nMjge/RiK/d+RSeynLmcJ+/q/8a9ckkFfGr47jAoZcxb9wE/JUAKgvu7x87emNAPguA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2ynn78s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CC606A31C
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 17:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2ynn78s
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c10faf6easo99503eec.0
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Nov 2026 09:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417572; cv=none;
        d=google.com; s=arc-20260327;
        b=VKKUkG2elfrLy6f+NMkxJ/u7FZI+5QxsPWqtaIdIk2vS5ERJ+nkEpJh7oYDMZk9Pz9
         2IN5yrPtlwbWPowMVary/ZcuFhNQ7zZ/JQyg9wZoRDQEC4v3AKF2FHFToYMixUTa+85x
         TLq7QOQK+NCDOJVAFsHbS+j2dG8kerOvS8BEDpQwGR2ijFMSOhNsC+GUmX575+nHFjyi
         kcUENiQM2wzu8kFVvrO3r7eUGthhrxpOCSJuZVUQRw0O/mbMr8UIpwSR1e+6ln/GaQpJ
         alyWAVjA0sGUqdk6I8b/qF5RsDlXcXy252whohqH1xqGIGoC0QAT5s7BMnshOQng7nHF
         JaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        fh=rUF0Zc5y4RdJzPPMBznAkDL9ywbx3gN0/h5wx9Yl158=;
        b=r7dbumA1wVrXQLMHF3K1SBNAS/Z5uAYPjdZ8h8U/TFkX9MxGWZxMXw3nbIvF5Ebp9a
         oAuJUCoZZD9YKtU5f5oIxCXSX4QwxkRvi5odsOJ+akymHV+5Tr8UzkI+qH4AkMUOyUiN
         SBNQRttVi0UQbkaH9GKqswpPSUH5pKx6/Edlu4Fhj1ww8qjfc30Esix/pZXvkwFKoZR3
         4H6nXfyTM2QnPHgpQQNwHu8BHaO+sG5KPWu/2wrXxWfKbH/kqcn67SY5mGEui4Tmds7P
         xhBAhAtjKXNed6SmXuBweJosBSxmJXQ7TMbHZI/I5jBg0gDJAA8Wo6fKVAHYUDfdE+T1
         tznQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417572; x=1795022372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        b=K2ynn78s9fHBJ2Cs9WHUalvqdA+fUsplC+NXWAectO3322dhd4q7IY7cVDxIiUld0M
         KEr4uFmArXN3fnSLg0zrjjh94H+ghVHQvpOm+kj2jA5Ut7tgg7DO+Bmr/MF7XVujpU5/
         NMxjQItp6QMkgT+Ae3MRH+wfwgVZnAETczX4ejBJb4a69usMy2hMtlYHUcPafYDvChqP
         ltG6Wgj5R1bTFANRxQ131epMso37oHnhSZppN5W+SyJFxkySghdKk9Fy7fMH99IdKhUo
         44Wod8Ld+WzHSrNVApFsoQcIa7xcZKqtiB/hEY0OfMobVrA9ifARkLOjAQpffdsHatwV
         Cjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417572; x=1795022372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        b=eoZL9C4RJir4a7leYBTB5gc9aQVUNOv67nxNNCIDvEpuuyz3eI3Dd639qHOQ3Q9Lg6
         DLK2d09pzSAL5lDuc6rcn7iaJ36yR1iqvQSy4uIAUNZzFep4aFL032g+jeTI5XgpyeIx
         z3SlUNhpdTLr4GMp7E+Qh9QZcvFiIfHI1utvrcZgb0XS4O61tJOaclb2psEGJHU9B2Ag
         +fxtDZd8UnKjScvJqRmUXlWozity8jqwaYt0ipy+tu31eAw7pVucM0k0qz0zV2zKYt1r
         NNQs+d1JuW/2NriabbjOrIleLcU3Y59jgvMq0mgrnihmi9FWDdW2dgaSF2DBGiuOasRw
         1A7Q==
X-Forwarded-Encrypted: i=1; AL+hErEw3vbLAONkLbhexoU+sy3vlX1S0o4Yq9rWVJh3ktYm0Tojae/GSMZTiCm91zRWsPWPeQFrAktvYGH83WBcI0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U+bBkBWoYdU6dE7mzdoBh5TwFw+kOx1THTmi+Gtb3ejdug+IM
	gwM2y4Fi0fntP5pU0Ce+Tj3x5SKQ3M99kP+YZ5+dcfD3/MZEOwyDjvNmmHz27VNq3xYYAqjvuoW
	n9PGvez6TULaETO07G7nBsuY5CjK9znA=
X-Gm-Gg: AYBFou0WZkK6rY6ZsamE8s2ptNKp9l30n7I+glUF7F8/6lQs/1NTBqRe9njrPIqgbwL
	87Kzpy5kzwdRjERW1F69XPtHYxE71wb1djrjvpVgGwbKlVdmNBK2QEAorltwkpK8wbYnX3AZQ35
	21rwLHxnywy1AKh3WuzuUD75ILfdwYx3XDZCeYx1D92JwWt1nr2DAOvngD72m1a+H1VCwiHvNfX
	spq9PEY+XMS35EHYcjIEzWr8BZU85bJvyVJnhS0vLQstTdUkI+kAp7hoePTL389TzQWtmU//lib
	jOLnck/2X52ab+9jhefQAEgW6wfeMLohsGMNhGQdxGoOtjjymurJxH2hBWgnSmjyfRNynkTejny
	WiyCVmwJ1139J5n/S4tA8Fkafu1vUJgc+Qk+bht9jwr9WtulbeY8WJYeFgCypfG4JNDGCZwrzi0
	AJb5mZImR8qx6exVBufTEb2l3ZG79d52+y/OE5k8lWTvabe6VNPwlaVSmijSM=
X-Received: by 2002:a05:7022:3a86:b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-1b3c01600d4mr4568870c88.0.1794417571814; Wed, 11 Nov 2026
 09:19:31 -0800 (PST)
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110215334.947250-1-colin.i.king@gmail.com>
In-Reply-To: <20261110215334.947250-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:19:19 -0500
X-Gm-Features: AclHuK9Ltzz1VkoOh3Aq7MLGRPgESiTW_dVehgDaxaFmKVDwtYC6QW68oRx-BvE
Message-ID: <CADnq5_PSk1mPj0t24ZjQfR5STAnVFvsB9wz-K6PqHjeWzoTS-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove extra trailing semicolon from a
 couple of statements
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dillon Varone <Dillon.Varone@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Tue, Nov 10, 2026 at 5:11=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are a couple of statements that are terminated with ;; - fix this
> by removing the extra redundant semicolon.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dm=
l2_core_dcn6_funcs_mode_support.c b/drivers/gpu/drm/amd/display/dc/dml2_0/d=
ml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
> index 71d14fb8c830..5dd22003f165 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core=
_dcn6_funcs_mode_support.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core=
_dcn6_funcs_mode_support.c
> @@ -328,7 +328,7 @@ void dcn6_ms_calculate_writeback_bandwidth(
>                 }
>         }
>
> -       DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cf=
g->num_planes, DML2_MAX_WRITEBACK);;
> +       DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cf=
g->num_planes, DML2_MAX_WRITEBACK);
>         DML_LOG_FUNC_EXIT();
>  }
>
> @@ -4255,7 +4255,7 @@ enum dml2_status dml2_core_dcn6_funcs_validate_solu=
tion(struct dml2_core_instanc
>         enum dml2_status status =3D DML2_STATUS_OK;
>         struct dml2_core_calculate_ms_context *calc_ms_ctx =3D &core->scr=
atch.mode_support_locals.calc_ms_ctx;
>         struct dml2_calculate_mcache_allocation_in_out *calc_mcache_alloc=
ation_params =3D
> -                       &core->scratch.mode_support_locals.calc_mcache_al=
location_params;;
> +                       &core->scratch.mode_support_locals.calc_mcache_al=
location_params;
>         struct dml2_core_internal_display_mode_lib *mode_lib =3D &core->c=
lean_me_up.mode_lib;
>         unsigned int i;
>
> --
> 2.55.0
>
