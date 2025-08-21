Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD49D42AA3
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787834; cv=none; b=Twalbql/OTmYvlY/4+AYwqUIbVVYVTCqOFSS/8VDObJW6OckfvllBDvVwleCHgRGvMVTf5IGKQ1FkvfLhmXxBmvab9GnaSUbfo/TXXyeq7iPsp6LeDYDh/X99auQrFgZjNuJpSkxGVVc1JXlrEljviuzjm+wYSggxSEGM1p1ctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787834; c=relaxed/simple;
	bh=GH8+AwypDZSc5Wk9KNNPh/6qRQD5BUNBbwVozKXNp8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzuK+yMjnB85A9N0IOyRG60ujpvglipjTBblWRg7+kQnI35z0E7swoW29tF5nWIg5zvp8DMUR3Tt0BaF1vDsvc3ncnV4ebVIu30hCPM3sWS/IceHt3so27CrvEIze0hSNsqj2yvk2x/KbHlQ+L1Vf3NFzLFmMsVxWUDJl9Wm+Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BHx2q4jP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BHx2q4jP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2e8e2d2dso826883b3a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755787830; x=1756392630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjqHieTqBHy+cNT3ZdROla3bmT3OzWvs9RzgpXfbZLc=;
        b=BHx2q4jPG0IIVyj++DqE7JPAzIzdo+mCFqIS7jVkg60BhKDn/6zDKD+Ack5F5xCwki
         i2daGMp3C45Lxo8PQF+7h4cwugENase5JtTHPsLmBXpeOkzM5D+a4IlUhoIS2u7XgbN/
         BDa8b4+cirNA+wAijyD2obcuVDz/VqRIJAzEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755787830; x=1756392630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjqHieTqBHy+cNT3ZdROla3bmT3OzWvs9RzgpXfbZLc=;
        b=q2n3A51DfO4nllPGdyueVXz/qzOrucEzDTju3e/PRPpNL9cnFWaBs+sVVNdKN9ESMe
         sLk+cq4Hk4BXQSAxAD9i7pgirubXi5eiPoHDwEg5bs6ahP1FRjvaZBjd43tRKcV3YEl3
         oxYi/jqEv5BdPLBHcvJSHBeatfdYTMeEfjWo70y6xEaVbutE1q0nzJUaRpLiJVOvvaaP
         FyZV8gSYZHSEIlJFy6oRa8vEnkNyseHG4wpGlMa504A6WEi1rrlGS3UETehviI1jodC2
         j9YS4kWP2roDX5PG29Fz42Egeg63GvFHomM35fxmuVw6IYvEIU0JPyqkgLMSwZI1Dy2j
         W1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw+A5DgR1YLhBdUOfMgAcK15e4Jf3/oMxf0RCydEcCMUcDPIVAoy7tQWj0JXwdH3YeQEyg/6uD9WHMXtONFpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YygelwmC3NF0nOsmbUw9A1wBthQLy9Np/ysykiUfs1zVegkRsLb
	Qz2gbwL2xTIcoa85pAQvERDjrc7pWCcAEEURDSksxSfzWfQxQ2uqnu9OLCZGw7H1HErnfu4YI3v
	4oYw=
X-Gm-Gg: ASbGnctrgROPDxKG5F39KmZuBFYOyAh1Q1/gTkE7/MnyKHCNuCS+3UNAnJsyb13EmVF
	+UuAIikbkFJGxOUzaLIS1xf66WKirXcmbUc6A9JPMfPL4M/Ex1opioayPp3IUbxAVy7otZ7NFlu
	vAcaMiUCBM12N8C0Katft9RObuSUubBxz4g1rsr60zmHDUiLWIa3IhTpLSH6Ef1VrSYMXjHifjF
	KkPU8HmvJ6ASXSKnOX8/e5IvuAvBa+g15AJUuIBU6u2zow69WATRAdkmLpCDsag0oTiklDpW6JJ
	g7o7SkQTfNSgo2i3ulgwTHPJUe/8QqGbVhisXpfHMLQFyyATnB8D3eMS/iO0gSXr/P2DYHtSpAy
	v/YPo46truTEr144QeE9g5lB0Ho1aktyRTIhlahoEILLxviGrpNBV254kBdN7ivV9Hg==
X-Google-Smtp-Source: AGHT+IER5GO9SIK5c+Z5UFkqNqMJJK5PohQYhcSpmeGiGKhEXR55ziC1oKFjUd50TvissEnTlin9Cw==
X-Received: by 2002:a05:6a00:3e08:b0:75f:914e:1972 with SMTP id d2e1a72fcca58-76ea323d23cmr4134830b3a.17.1755787830332;
        Thu, 21 Aug 2025 07:50:30 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d13d2b8sm8441603b3a.46.2025.08.21.07.50.28
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 07:50:29 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f581aeso8085565ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 07:50:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXM03/ad9CiU9WIYRX4s18LZVm2e+aAZbbJz23cynvtlfMLzHo1TUbd1j9lH7f4NLqMjy3NiWUxRJFO/oX/1gw=@vger.kernel.org
X-Received: by 2002:a17:902:f550:b0:244:214f:13a0 with SMTP id
 d9443c01a7336-245ff871cf5mr35274985ad.52.1755787828128; Thu, 21 Aug 2025
 07:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
In-Reply-To: <aKcRfq8xBrFmhqmO@stanley.mountain>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Aug 2025 07:50:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMu9YJgkkqTEpKEzPdMUka8tYzPZVKEeh501-mSsh4uQ@mail.gmail.com>
X-Gm-Features: Ac12FXwRHXd6Q5sCwpiasX5YznwxVtKCHmDt34fauOc1r6Twa8Tf38YLNCLnydw
Message-ID: <CAD=FV=WMu9YJgkkqTEpKEzPdMUka8tYzPZVKEeh501-mSsh4uQ@mail.gmail.com>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 21, 2025 at 5:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> If the mipi_dsi_dual() macro fails, the error code is stored in
> dsi_ctx.accum_err.  Propagate that error back to the caller instead
> of returning success as the current code does.
>
> Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up dr=
iver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks for the fix.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since it's straightforward and a fix, I'm not waiting and I'm pushing
to drm-misc-next.

[1/1] drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()
      commit: 61ce50fd8196c8782b9620bb60d33649ec429f64
