Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A7628A41B
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Jun 2025 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598702; cv=none; b=J574fI4Ya5AAO1fZg9w2fQ92GANBwXTDX715oDduoyAsfUlJ6nGMxSDt5u3PNm69UyaQVO4yoVuU7hBPAGWsmf6Vmefb92oPmSlY1ulDImeg6BXsNfZd/awwl3jRN7FeLBjWNnNgwEZoJxKDJ8JKu/uLkAyOfUoYIybZl1amPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598702; c=relaxed/simple;
	bh=pgbKmPHrWgCcv8kF2j7OWtS1gZM5ZDz3nXA9o5uRuM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LaL/1DQIwWVfgY1R5RtjaVH+zSg/TeQF+UmRYx6KDuVnhckn+Kkrh8PItFEUYyF5AcTUBouEXoC4os4wrWaj/J3w/OOyXLqNvREGWyhDAF4b88hLs+q5JPiTmghwQPlB+6y5kYNxO4jsamWcmLbKFrw8K5mZKjZX9c0zOjd8b64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ltk4ch11; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ltk4ch11"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2351227b098so46484065ad.2
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Jun 2025 16:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749598695; x=1750203495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
        b=Ltk4ch1140rm0kQIb7zq5ngqLvBU6SK2ikkGv2tPx9MA68zUPcguIkb54IfkNCKFEP
         4NpPzjCqztv4hZw8HA5PvASGIIG4mKpbuudXJLRQ7Pr7TqvD/hj1Rh4WizfWUnmDBIpP
         jyu0fqVp+sLgwRK1FJPgFGUH2QdAdkZHEHK48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598695; x=1750203495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
        b=gb0Y+FcltmMTiKAZzW9Tw3xisZARHZSbtc5GUgHU966mnBCr+jIqgoVHb0aMKl6ZMV
         iRsnga4+GNLqTzVrOkDLElHGqabUSnzDOSbBWkDXJ2g4UsyhT5YPxyDYepw9wrjolPuj
         /xg424M7AVlYJvRCLQzS8XLOAQckvdzB0qINNmSc5xuWml2330YpkyAZnO9cf1eXvYK8
         VgHt/Sty/IiBjvv2H52+tVS7T5N6BCOR8O8nWol/9YzWZ48KrBin+jNdVZP2UexOnK3+
         2JbE/IY8wplH4q6weZJz8JeVgslT+5mHUw7UoLBeMg/AS36yfEeRiVPkfwWlZTcA9ev+
         acOg==
X-Forwarded-Encrypted: i=1; AJvYcCXLTRmHrFUBZdC8v86O1L7MwkljKKgHuZ+44OGqPTox3nEyhz8m35VAYmpTIWiqsUZ/7+GqTYkdGQr7EKKq7HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqq6Nk588n1sOdx2YCW+QZ27pyZIZVqVJZVHpV35smEKQG1bRM
	9mhKVKLCHgJYvgUxh4NJ2pYOQl80reBfZCzpj7zpWxl56oCM5bN5wXozFlbuas93eM5sLmN7CDq
	mPfg=
X-Gm-Gg: ASbGnctusNQE+6TgX/nKizGz9s6pEkegynzE24ZRVr7HpsfjSzIQNezzTUwB0cPWLnN
	N6Bbim/eaKDz+V46VAXadD5jkMz2qzsRwWLN3Mb+5a9wnT0j+FJgdMaEhs4TeKO4V1wTcPFwO+t
	smdyYpOl8l1XpaIrUdUG9u3H4S5WyHITmW0RweTOXL4V8XmOykh2cAo2+R3EQHbGeRVmxZR6MTI
	Osr5EHQ/WeXH6iXZlZVkUreGFUllrLR50Q9b/Dhjd8vv5C0iKS+dtCZ/KU779QsPLAhjLm8tRzN
	DdXhMTS1Th3BhYkz8Y3RkEC19MBMt3tcnF6axBglRwQCkOmz0/t7HMlEPmGY+IJAgq4qiRKtM2C
	p0IZEz4e1KIWRZwC9pw3CWRopzw==
X-Google-Smtp-Source: AGHT+IGAXTfcrAkXrxEqo00UU43xX2Fp5kAgbj3MSAI9RjOIEZVn0VM2uHmbH7WaJI14AX+rD9OK6Q==
X-Received: by 2002:a17:902:db03:b0:235:7c6:ebc2 with SMTP id d9443c01a7336-23641a8aa8bmr15024465ad.4.1749598694689;
        Tue, 10 Jun 2025 16:38:14 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm76066865ad.34.2025.06.10.16.38.10
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 16:38:13 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3122a63201bso4986762a91.0
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Jun 2025 16:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNEv4Qqoxdhgtw+EiRDa8jylCSUGdjjVf7JINuS9Y1G8PclJvscXqOP4ePQ8lX+UUgug4LwljKEMCyb30OLjw=@vger.kernel.org
X-Received: by 2002:a17:90b:1647:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-313b214a8f5mr622260a91.4.1749598689503; Tue, 10 Jun 2025
 16:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507104337.201695-1-colin.i.king@gmail.com>
In-Reply-To: <20250507104337.201695-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 16:37:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
X-Gm-Features: AX0GCFtZvEBl-EmIFHzeWRfTaVmPsBdOiaZhoqVl1uW5_aP2qYsrjz41aGR7LCY
Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
Subject: Re: [PATCH][next] kdb: remove redundant check for scancode 0xe0
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>, 
	kgdb-bugreport@lists.sourceforge.net, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 7, 2025 at 3:44=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The check for scancode 0xe0 is always false because earlier on
> the scan code is masked with 0x7f so there are never going to
> be values greater than 0x7f. Remove the redundant check.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  kernel/debug/kdb/kdb_keyboard.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_keyboard.c b/kernel/debug/kdb/kdb_keybo=
ard.c
> index 3a74604fdb8a..386d30e530b7 100644
> --- a/kernel/debug/kdb/kdb_keyboard.c
> +++ b/kernel/debug/kdb/kdb_keyboard.c
> @@ -145,9 +145,6 @@ int kdb_get_kbd_char(void)
>                 return CTRL('F');
>         }
>
> -       if (scancode =3D=3D 0xe0)
> -               return -1;
> -

What a glorious bit of undocumented code. I agree that this is dead
code and should be safe to remove.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
