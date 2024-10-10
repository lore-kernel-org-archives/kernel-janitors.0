Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE81A3BDE
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542068; cv=none; b=doQtl8P6lpRj+S9hSswYdGlMHACblqxNXD4TU+LJQlmdkkuTYQai5AiSl7/urntYT2m5aGCOV5sthIBhiQG0V58OQqDrNv7J3IredEp41JOna43HiHyrzJOi+VZ4pmYMgd/qt73Gx0xgV6EglvOyOtAsamFMLjJGjm7lCdHKcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542068; c=relaxed/simple;
	bh=n/KuTEfj55Z44mJgo3UkAHO6y9JAvXHdzzaiDTWIq0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GToxdIvTl+vBpPmTQ4iaeC8TfXq9pJmAZr88N4fAsrtvmuiyapGfBArUWNMN5+5FTfpA3P7lvsXFTGtDYxPs0oPQ0au6QM3I/RdLPOUPZ8lprKuNtGKYcJzQg1PlUK9LKk4YQNvCm8L4sxD+H8Mj7mT008UpgeOcLqQIeTwszM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=YWW+H6xU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="YWW+H6xU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c8784e3bc8so658379a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Oct 2024 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728542065; x=1729146865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNbQgNGz4ln13V+1AJHezmBRqD3GeJjDxhy0+sxFIyA=;
        b=YWW+H6xUZVgJuaP9y7bkdIGhDV7SxJpwLLbMcg3tT8br5MPhijqwPSJDAIkm8yFMTM
         zy64lgeAJ5K2uKAePT3Dplmo6Pc/rUDRnKn7tz7M1O/ke1xim1zbfMQSLIEt0jlqumoc
         xqlNDqEYlWtwmGdCvxIl7Tz3972Wk94o5eYh3i1hWukPNm12+QItFAT75Xny76TwU4dk
         Wv29Plk41SAHQ6uWBwxtPUa7x1Zp74c54HYXerVezZvyxXv+zVgrKBUlalXMwPwmRSnv
         ANCzXxNMK8H9mB4ETTVrfq9geH3ypZgxFOJRquPk/jSVF78QS26iqrvWMiogt8m+lZD1
         PUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728542065; x=1729146865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNbQgNGz4ln13V+1AJHezmBRqD3GeJjDxhy0+sxFIyA=;
        b=o6o00dsszOUNH9ZCAK2zywVXiua/pD/Fz+XP67MgvyGt+DsGz2qYFPkk9PPTYJ7nVq
         FdVN8bUPoBTDI2/q10gu4QRB3A7kw3IvltNCUO7EXpDoSi1Bdr9aHKxOj4YcNiN4X22z
         rOLaQd0VmNqii573dwNkILKGXIBuUmZAavx+lTaOO752ejkfz7Z/pDerHnp5RcAU2LIX
         uAI70VRvb00axfdegpz6hrygiH3MobchdW/2EQmvZrz6/hwWOu3cmblHMN6KHcwe99rX
         uj2Dl5sW83VPcRUwnp7GeleFAKZR9bbLU7kgPSIq81gc2y4hmXf7TTQJ6irjGBl+FX5F
         GbwA==
X-Forwarded-Encrypted: i=1; AJvYcCULpT2lZUvXiYAxDpMEmCINR5KEcXMFHqFQ0B3wBpXAReOBmEO1Widy9I9I7N/p+CxSbv4WAb96SgsH0LCZf6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDETeaQ91NJapxt66OnGGt+IhH0tz8wnO4U099owqeqzB0+Qan
	QTKwRjKgHAYEr02ccxWaqQDIETc4Zdup0GZItQt6sdUwHtpS1rJgUSu3BWEcpi+fQIhMfr6BmDO
	Sht3zzsBDLorbc+IuPM7RSz4BD6IGuTiG1u2+zQ==
X-Google-Smtp-Source: AGHT+IEFirfdNC1tkJJSNx+yCF2buHjstu4V7B995CFeHueDWDw1iSohi1NTD6YhOveJe2g1G3rj+p3QJlhlIWL6tk0=
X-Received: by 2002:a17:907:6d11:b0:a99:4136:895f with SMTP id
 a640c23a62f3a-a999e8cd43bmr218826866b.41.1728542064655; Wed, 09 Oct 2024
 23:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009213922.37962-1-everestkc@everestkc.com.np> <c2a9c4ad-ce50-42ab-8dac-65914e188cac@stanley.mountain>
In-Reply-To: <c2a9c4ad-ce50-42ab-8dac-65914e188cac@stanley.mountain>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Thu, 10 Oct 2024 00:34:13 -0600
Message-ID: <CAEO-vhG01xvKvJ_e5Rbkn6WRQho8gauLBQw9Wd_VQj2Lyw8fyg@mail.gmail.com>
Subject: Re: [PATCH V2] drm/xe/guc: Fix dereference before Null check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
	rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:28=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> On Wed, Oct 09, 2024 at 03:39:20PM -0600, Everest K.C. wrote:
> > The pointer list->list is derefrenced before the Null check.
> > Fix this by moving the Null check outside the for loop, so that
> > the check is performed before the derefrencing.
> >
>
> Please, mention the effect on runtime if it's not totally obvious.  In th=
is case,
> someone reading the commit message would think that it leads to a NULL
> dereference but actually the pointer can't be NULL as I explained so ther=
e is
> no effect on run time.  Say something like:
> "The list->list pointer cannot be NULL so this has no effect on runtime. =
 It's
> just a correctness issue."
>
> Change Null to NULL so people don't think it's Java.  ;)  Also dereferenc=
ing
> has a typo.  s/derefrencing/dereferencing/.
>
>
> > This issue was reported by Coverity Scan.
> > https://scan7.scan.coverity.com/#/project-view/51525/11354
> > ?selectedIssue=3D1600335
>
> Don't line break URLs like this.  Just go over the 72-74 character limit.
>
> >
> > Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> >
>
> Remove the blank line after Fixes.
>
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
>
> Otherwise, it looks good.
Will incorporate your feedback and will send a V3.
Thank you for taking time to review it.
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> regards,
> dan carpenter
>
Thanks,
Everest K.C.
