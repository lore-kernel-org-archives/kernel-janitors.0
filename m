Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E31EB9F1
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729008505; cv=none; b=A8tpaVMEPdb1Ex+AD1HjHphbKg3Nvz7WFoHQiTm5XiOHLjMONTjLeOIUPSZuy25U5paL4C+iDcQbfVWlz07i8Zth+xecYGMikoMMX0ETzxHRpR/uHLfu6wzCYu4gqlJns7On/phMUD/MKjxwVFRWvJO2e6JZdFlvGJ6uS7XDaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729008505; c=relaxed/simple;
	bh=WiqpiwDzUYkC077ztu3DufJPODl6f22FLm0mT9Fb7/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR0TtJOOnZdESMmQ7FNqjlGMb/kd0ac/iWaFaPgYRoxYTENRlaidq03rCguKL/5fIbGgnKjTl70N/FfAazxqSa8p/nt2gp8fZrNuGXgG7crPgRZp/6t+1ri6Se5Xzdi0/UnFSOVCKpiNa9hTpMqG1/4Xxu1VhIq+I54Jqal7/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=3Pm+NbJN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="3Pm+NbJN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so7494173a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 09:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729008501; x=1729613301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3vlLGwfnymGKKL7YQ406or/3aMD1YTZLJ0wPM3KKl8=;
        b=3Pm+NbJNJN41KerGe/KUtpm6LgPhYSDygvr5EBl/bCOYprjrnYAne9BgVjyqRAJe1D
         bBpbfzh1WAfOj8UEM3BMUynspcFEwPwgnZAHW56Pdt5fzdt/x4ge3njgxBFt9gUOWPwx
         ZtEARVBGpkN+lrltODkjEGE6P8tbhIYzlarWJ7pB94bAK0K4VR9XwgpkhwDQYa7B5Q4i
         +4ZXVKTCMnsCvZQK+8I1zI+qwKQrkuwWY0QHkV0KG+C8xUK4aGzgyViM2WzEe/Ftk1BY
         09nOjoxy1uHQ2Qh29AuqsFedvIqybOGwoj+wQ/lEi95544JCAYWYowxSsPq1MmzoR76p
         auYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729008501; x=1729613301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3vlLGwfnymGKKL7YQ406or/3aMD1YTZLJ0wPM3KKl8=;
        b=Tfs7EjO1HAoD2U7fZ/QQZqxYDEfXod7BeLtfPHK4xkh8hrtynHD/AteS8MKdJ02m9t
         bxYFsLiwe2HE28KXDBvrXPTwkd95B37FypOuP2kreoDvdmJOIF92vFas7DwxMtBWmhcq
         ULsdgBqX/dguNLz3r1Wo81M5C/yfIMFljLWPv2Tu4p06BcasretyoNsKs7ALz0mA6lDl
         /YvvcmhCC5VmSfSO+X7dA6RtGr+9Mn+NXumvCaEg5z/J8qIrV8FYLjbXY4axgxhlRWWa
         Llzh4zmzwSz6pT+LFLVXawC5bgWgkuBhTvGJF7WxfyEUL7MDOhOQCC5p+frtZ7twB8hR
         PFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUxijkiasX4iQEXH7R0GRim89JD53qZIrsuAr8pwyLo44Zu4KkcMUibGlAza1uq8lY+3zNpZbAHzdpCzPpgWiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6kYkK1VWV4ujOuHmz2hQ/meYOMg9R5eAxo9d94/Gk0QV+okJ
	tv5P/fJjRni+9QCE+iAbJSFuIPcOctRMIfqZFVXCt7rocahSETrFrD/ce3QpMDjCjbwQuw6UY3B
	dxye2PVLxFohGs6DeeSwMZGswzFPhzH7BNPIwVWl6DsnE156FcGSm0QQ31Io=
X-Google-Smtp-Source: AGHT+IFH5JbPxMBrzP8FWhiekFLqguHvxnMhTcdjHCyZvnDqz7WkpfNvQoEN3IT/O5g8P9yT90njC7pVBFDQtbTc4N4=
X-Received: by 2002:a05:6402:3513:b0:5c9:57bd:e9d with SMTP id
 4fb4d7f45d1cf-5c957bd0fc9mr10577952a12.19.1729008501135; Tue, 15 Oct 2024
 09:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015045843.20134-1-everestkc@everestkc.com.np>
 <8a4a8915-d59a-407d-9f93-f047370cca62@stanley.mountain> <43eff9c9-9a23-46ac-9015-dbee35562848@linuxfoundation.org>
In-Reply-To: <43eff9c9-9a23-46ac-9015-dbee35562848@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Tue, 15 Oct 2024 10:08:09 -0600
Message-ID: <CAEO-vhFO9-htOazTzUKA_xMS8S+a5MAZpOi40GPF38m66a+89A@mail.gmail.com>
Subject: Re: [PATCH V2][next] Bluetooth: btintel_pcie: Remove structually deadcode
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, marcel@holtmann.org, luiz.dentz@gmail.com, 
	kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 10:01=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.=
org> wrote:
Hi Shuah,
> On 10/15/24 03:48, Dan Carpenter wrote:
> > The subject has a typo.  s/structually/structurally/
> >
> >> The intel bluetooth module was successfully built after the change
> >> without any errors.
> >>
> >
> > Delete this sentence.  It should just be assumed that changes don't bre=
ak the
> > build.  You can put that code isn't tested under the --- cut off line, =
if you
> > want to put a warning message.  But we don't need this in the permanent=
 git log.

Should I remove the line that says the module was successfully built
after the change,
as Dan suggested ?

> >
> >> This issue was reported by Coverity Scan.
> >> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIss=
ue=3D1600709
>
> Restating what I said in your other coverity patch, include
> the coverity warning. This link requires login and no use
> for people who don't have coverity account.

The coverity scan dashboard no longer has the issue. So,I don't have
access to the coverity
warning.

> In the future don't include link that require login in the
> commit logs.
Got it.
> >>
> >> Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between d=
river and firmware")
> >> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> >> ---
> >    ^^^
> > Cut off line.
> >
> > regards,
> > dan carpenter
> >
>
> thanks,
> -- Shuah
