Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04EA48592B
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507171; cv=pass; b=hob78R9ti5TvnZjtXiG9avMmMFq7rkVsvTHOlJ1Brm2JycuBB2JbC6YmgRIWs+j3t5x0O87+JsliZ2ilUW+h0wbx/0F6mxnjvFPYsZjc3TR1M5tyeiK76DA5iSD8o9AR109vDYOPc4aS8ga8WFQ0EZ97oDeCI53nEFlSCN4nhXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507171; c=relaxed/simple;
	bh=HZyGc4dn7AJ2DuUFYW9V6d2LUkkWR/LMP6HTK3mBe8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gfiq3lM+mL1bfbCoA3zmYKFUs2+XFdRKp9g+qhk51diUvSCOhNSjUPsd+h+TSTyUhKCEiYtmEx8fefsWv60pTBO5lRSIq6dso120RaZALdnpUPWX17RSiKtn4oxxgkaUsuAPQgeyvUYA6o5nM4Hbv6+ZYpti5kQk6EDv/+ta1k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVQRyRhI; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVQRyRhI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso360695ad.0
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 14:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789507169; cv=none;
        d=google.com; s=arc-20260327;
        b=mEzTU7DTMinQ+ybR1QmV2IfNDw7+QlWBb4zFJVUVnfEf1Vk4eunEhPIk3yaGQfJga4
         ak7TnR4KRmb4LvaF1Vm74ADh4ary9t1z374nzPNUnz3jnc1PqVIrP7WGavhUOizAlyJ7
         WkFKxEB8KIUQpcD8XCM0X/Frf0QdQhwN8AY8pUq8PwWVwRzrrmTCAqIAe4imCZzCSjAx
         /K0DRFnEYIPBQtcC2DtdNRUOhH3mWTaZNf2E51y05dlb4ELhMvztDqXp4oJpw4oLzX2S
         IYV6c2x65LnkI1wG0GbywyfInHWf4wEDWGetf1PMOW+Q33o8dYZhDXqmGFxFsxdJbb3f
         Vn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        fh=Zc87zhuqlkfq75+Sj4yVB4Htjrd8vBussNy2y3+DB/c=;
        b=sR9xIyxE8+mQUZPZ/KT8RwBWmt884vkz2klu0lHeHJ6yA0gNJEFLe+3vAz7yPvOfk5
         4y4EtqhtM0tHm5iLrQn6Ee/45JbNQM5T2EQPNidLwTxm+tYalf4MqqHzEqqGNL68uV7q
         /QfoOQ9BsvnYOF/cwMYVNEUmWpL+sLW7MqcQp5Xu8waWo/rorIt8yMNrK2WSGSUCaJer
         n+7wAcaUezQLp50R6WdxYkNVsBslId/5jbARGD9U8il4UPGLkqrCTj+fGq/5Do0zgvIn
         vSREzhQvC3vzFPNIA3qGg1VWDjL45nYwJoluKFPTWnwRew6MOi48uHeqK4inXrKXtiay
         Qfpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789507169; x=1790111969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        b=UVQRyRhIsG/W/Q8AHUSGg8+Xk310V3DZB4m8W/AnlTnS5lZcKEGqopHAgrVU+1SaUn
         G8yDaEL72nPqlqWrKUr4EEgSK5I++upHB1xlHXVPOvSJCPtkbbehcMrzh+wEmvAoTl2G
         DPOOZBrFFwCVld0uhTARR2Pn8CIFsxu7ny0y9ilxjwrAx/4M0OVNeepJianz+fvE0qJP
         25w5mq/YWA6ZJKip5Ceir2x9HfSm+twopVs3W0KU0xZgixLDRkPPFV4wrfv/NTsGDrHM
         fnxa1zkEYcM9IROnXsV0f/HpTrB/A9KxlXLExf0csRwr69ESZ6hgi1SoTfOtg89vJ6GQ
         ZV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507169; x=1790111969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        b=Ng1ZQtnm9sR4U+rbe3xO6ianRy64OXfYOTQoV3xCKnYXWlgl3XUe50WK8oJak1eyJo
         x54Y7ZS47a2TTwhoi6mTHfDKf/ClkNFJXZntbHo4ZSRuDBpaDnn/kGsnuYJfM/P/tRgL
         pGVREeGNc6bTdafj0Oo7b429EdX3zuOHcadftDda/b2cPq68UEq4jGLeon4JwoZourLt
         UFrPq8cyDRmEH4aFubsRfTZjbUyzWb73GxJihvnKBU1+08PVqQMKzHsbpIXczZ7vP+0i
         pukSfe05YP7h+nRmqKf/Dd5/IkefotFpDXn3RMuyZa6WiBcxgmPZmqchd9QwBaYWoHnf
         6V5A==
X-Forwarded-Encrypted: i=1; AKwUvBxEdXIi6Mprp+ckYMmuC5ojYA+HKfFytGvbssa+Fl/NvFw/loY2a3K4dQPIYTINvOmz6/gw0fRl0SUN01xQSEw=@vger.kernel.org
X-Gm-Message-State: AFuF++nPXqwfYFwI9dRxLUp+vQs1sLGPndcCsu70iWQI8fo8bvPo3B6V
	i5CETI/X6Utlu6HtMdJVIBxheMTUcgyix9Q+CysL/xf0hVzTD6eEFso66RoTqRVWfXtzcm7i25b
	Whby1hJuzKItEUPkz6BPaAvyAkLOeM/I=
X-Gm-Gg: AYBFou3UtZO4xxRy3sElePrr0+3YwjvPsbtIpJq/BMBVlt3MHNGKKIHqqU5h9whdZkH
	amhmDSscLrf2X6z/Xzzag2oYoxdSD/SBwTR2fzvweZBIY4fzMajjuqdMdK5Azfq/csNYKXx/RtI
	2268w7ZRfBd1KFD1cIRqoM0X/orz8ErxOW2uDQJoCqkNef9C7TwrMo2nV0U6pAzCsTgT3P14U/o
	RjRCGbmEshI8J59ZXw0MqbCIroZEEl8mvR4H1W6ggTPkRIUaKmMiVD2e/Jz0oRbh+vyNYQ5itzE
	cKK9r6WutYj+zv7MH3v4Q5zL7g5YkHk2+ZoZNMa93pOdyPy63vUSrQnnuvuuhPkZ+lrsR8NDwQB
	Du2V6cS9EYyPlsrljs21v/wbDJfJ0VIE9xfC8fSoSOw==
X-Received: by 2002:a17:90b:4d86:b0:39e:fbf:e7b5 with SMTP id
 98e67ed59e1d1-39e1ed3a90emr151963a91.6.1789507168853; Tue, 15 Sep 2026
 14:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aql0WF8CnlzgS4nz@stanley.mountain>
In-Reply-To: <aql0WF8CnlzgS4nz@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2026 17:19:17 -0400
X-Gm-Features: AcwNN1UIlmrWYu-j75aUFWIeZN3UW5lDNCOHYA_6wiqw4odajfx7LULhYdnp4hE
Message-ID: <CADnq5_OhB4DVhvyGtQ2yCi12xg5yMUtmT0sRGuU-AxZk2ox0LA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: delete a stray tab
To: Dan Carpenter <error27@gmail.com>
Cc: Yang Wang <kevinyang.wang@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>, 
	Asad Kamal <asad.kamal@amd.com>, Kevin Wang <kevin.wang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Sep 15, 2026 at 12:46=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> This tab was accidentally added in commit 6c9e0328d1de ("drm/amd/pm:
> refactor PPT limits by controller and power source").  Delete it.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index a29e76b03476..6beafabf1306 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -3077,7 +3077,7 @@ static int smu_v13_0_0_set_ppt_limit(struct smu_con=
text *smu,
>                                 return ret;
>                         }
>                 }
> -                       return smu_v13_0_set_ppt_limit(smu, limit_type, l=
imit);
> +               return smu_v13_0_set_ppt_limit(smu, limit_type, limit);
>         } else if (smu->od_enabled) {
>                 ret =3D smu_v13_0_set_ppt_limit(smu, limit_type, msg_limi=
t);
>                 if (ret)
> --
> 2.53.0
>
