Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62AE71B34
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Mar 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710430177; cv=none; b=po1BmbvroB5jxqYb2//3IjZ7NCfob38m2yvE7QQAzVPh3PbDpm4USt0PcphBP4XBeV/DEFUDKIX+rgfJawLt8T6OmJgIXhudB0/NYTAKEkwPN7ifjb43rcfmfPHt+R20DRykYSnzbR007o2vcy/UpnTkss8Q6bqn9ScVi5lHRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710430177; c=relaxed/simple;
	bh=BK5vGjzgLHTG5Uy0fF+PO/iDPbQ/wrXrAZUSjAUJ9iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0bRPoIDxMtMDcYg1CxFOhanmrqSt1GOv8P4v/hrbt710KLQmN+tQJ5j1w0+w0jZkCDl9DJuLkXGPS7LQVRyXr+iB8bJs+AtSYjmOI95do0ZBvKJxSteHpp03okOviSECOnAPrV8kQCG9Ij9AYDQva5aluJnZYAjlHveFf9DtzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n5glVOxG; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n5glVOxG"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42f2a4f77a6so4446601cf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Mar 2024 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710430171; x=1711034971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
        b=n5glVOxGsnctw/5jZnWEKcMdDcXqTWHRBa+sWfvNfJ+BO8d4+frFSRW/QA/2Qx3Ke9
         hUJM+itue+MdCyOai+U8nHCVqLpmtrBA6Y58DQw8e2OLKuHDVhX0prB4IQzsK6qa/aa1
         NJeQkjVjrrjdlINJwe2W6E3IJ39d4ZOE+Rh4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430171; x=1711034971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuhQc5l9apEej2H4LOTY9yaoxPUBJy/wLmmpg/Pkruk=;
        b=OuLgF551DqP/wkB2U7RV7Ed1Uf+sUfZsvTP8jdoAu59AyPbjC/sBwJqDOKe128KoMT
         DgwENp+hch7/gSNZ9YRv/jEqoMZNjpnzxJcJ2vL8b0FpnSmc89TGP6WlNQtf4MBIk7Xb
         f0A9WrxwfXqyLy2AOeqSLU4rr0rRDnUHpHvHm0kNGVt0wbvS2cATFZSvAUcHg55c+Ry1
         3qNJ6azpyyohFVk210PI7i0nPaWzHE7z43a1F2m7kHgYbgDYh6vhr0mjWiuc9tglFey7
         RHC9qGnfhfOLreykr6oKNnfpb8xzui2bOJgk7xGPQSLHVRLOZDyA/+VxW7QeSdERWffs
         qKCA==
X-Forwarded-Encrypted: i=1; AJvYcCU35a54wjFb6cvCegVEMvAt7zyip9G2V9bu+7eYOpqKeqme8AUIgFyYubLHyWY+ZYiND04NmGy8AAfU8xBQcjQWpS9i1grTyJ0yyD16Wvyp
X-Gm-Message-State: AOJu0YxeOVexw+E4f4l4cF5NKdnpl9nVnQWQ9CpmlWdwzyJIH8pBoN3e
	o6EjYWhiW9HhNUqKDYi5Y7jrzxlBN9j3XjdXAwXECDG4c9m6qVKo9S7Va0W6s2Ew7GInfMauQzu
	RrQ==
X-Google-Smtp-Source: AGHT+IEvfEWd5+gSIe6Z/Y2UDs/hA1w3c7lYUryk7NQuvf/fLO5ia8BFTHVnmNHfLwyS2zfLpPZoBg==
X-Received: by 2002:a05:622a:11d4:b0:42e:6f56:c358 with SMTP id n20-20020a05622a11d400b0042e6f56c358mr2472491qtk.42.1710430171662;
        Thu, 14 Mar 2024 08:29:31 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d3-20020ac85443000000b0042e67a04eddsm878354qtq.65.2024.03.14.08.29.30
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:29:30 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-43095dcbee6so324261cf.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Mar 2024 08:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXez5FVY+wCln2GMHQZjbJPzNmeSyNDlpHbFpFzk9KzaXJAMK9lrwDe9eYCYiOIWwFJWtvaFDPYDYhZgcplF/UGricHIHhUs3lNLdZWMxBa
X-Received: by 2002:ac8:474e:0:b0:430:90af:43c3 with SMTP id
 k14-20020ac8474e000000b0043090af43c3mr272846qtp.21.1710430169466; Thu, 14 Mar
 2024 08:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240307093727.1978126-1-colin.i.king@gmail.com>
In-Reply-To: <20240307093727.1978126-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 08:29:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Message-ID: <CAD=FV=XQ5XBT4Jt6VUgVqxsn7NQZjDCTRFOFk5Fr+Fxkpv55SQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/msm: remove unused variable 'out'
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 7, 2024 at 1:37=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The variable out is being initialized and incremented but it is never
> actually referenced in any other way. The variable is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:843:6: warning: variable
> 'out' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ---
>  1 file changed, 3 deletions(-)

Tested-by: Douglas Anderson <dianders@chromium.org>
