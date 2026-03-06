Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3536D4EB
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Mar 2026 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776806; cv=pass; b=iNjSfMxHWkC1WujsAGizL+Tg/3fUQIyREx370JsneOgfrq58HzKoB0E44muAzhYtHCqtkRHxHd17qPBzw7P2kSbHXym/A3b2bqA81YT8CgeK4DNLc2OyRI1QkJWtmc0Lf2wnuqggh2lXbayqPcI+bm0Ynod/xKwx6Q3QxFThcpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776806; c=relaxed/simple;
	bh=kjwNEp1CqCGxSTyWX9N9XmwmrQUlwMmG1H6eQUsq+80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCtuGeM4juHdsnEulUrRLYcu4LP2KfPgrg/28pOaLX00k2xxLXXfygf+fwJ2K6Mp4XJcDcRD1axblCgH1JTUNAEjN7J4sAHnIN36YHBmAx2Yyi+ClwmAlwCF6MuIE7sqL4qruR9P9fbjH3na0ytM4s38cZ2sg72V1iOyb72oZ18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSyfmr9U; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSyfmr9U"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6f21c2d81so837619185a.2
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Mar 2026 22:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772776804; cv=none;
        d=google.com; s=arc-20240605;
        b=POU6oVUDLKNur77AsiCBY35xeg1V9w/S7XG0U11hAMg0QZrkV47zXP9RE4F97RfWOD
         twkwZNwBWkNMBDRwIOScKN11bedz4wOSKCV+6881SBXc+LXOmAHcHCtpHS9iqS72IkRR
         ATDTltLWXOmD+kfVW/RSlsEgrSf6iUS+/Lc+zLYA/5jD1fbReC8S/OtIw4fo0fWT0xpa
         sTv+zPpjs0almNZQNy2hA3Za9CBxINpdZyRt3NFy8KB44eN1icXmjeIUNl2u/UFYSzn8
         xhW6X3jLEmUjoHV1VRxzAP0hICWIybNKKlPDh5gFegf33TgHMo5o/72y+4nv1gi/f8uM
         u6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4jm5ioibzYYsuxN3e/HZpHO7iQlD6PFHQJP6euigrU=;
        fh=KVVOxiE7/bwmHsJ2E7srxwL8v7FJPFCFGg8xsfJvgmQ=;
        b=I51Pk/IxRxgB26YbXxK7yUONr9U+wimC2THov1GXmIyiRiHhXCM4Vi7ysxY9scLFXx
         On8s4WijNBIVpvhnz39QZQL4Kw9RN3oVGlJqlzBwk+ZcjKnssH6ZBOObDSS3ERcO4WCy
         XFqiT7fBB1shn6T33ud4ioZ7+VZehUT2TtV11vX+a8f8C6hhwdiTYm6YKIUimaYTSp8f
         0mmlOFQW8epxcEFq5fDCzuf/TscPp65ZjZNTz6rar71gQjKaUg5h9jo7rYUnPkbP02ht
         WBIyxQeYNRxsqF1G9jIyJYyWCeJjRMyveEwiq1f6Yu2+MyQKRxs5/gbOjA7JYCGCKPuT
         wgZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772776804; x=1773381604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4jm5ioibzYYsuxN3e/HZpHO7iQlD6PFHQJP6euigrU=;
        b=LSyfmr9UA7KmvEqi9791wMTzwgx2QWwcF33uND+o2mxl938rrsh2v8VedbvT7GR2d+
         wPcIcXgdNklNdSh6hAAIhNiZ9kF5YSfWK6OqIzqSdG8zIp8Yy4DYCfZjMbTBnF0/pN2o
         XH2puLGgsq64fEkijZCGxFWZFAy3a+D3yJTyzY71yWsbrLL8GloazbS7ihDlspaFBhn6
         lhPeS6e5sYtxs4l3XbwbHQyvITw21mLjgDgetZO8q/Zo6Fds98Y9R0apBL6YsGLm6JUS
         G4SBEUqpCbzu2NwPC95eDuvweSDx+T2mSqXQt0cL7WOaYTiY/o29QyiwXIi5FtLQhJ0F
         qtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776804; x=1773381604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f4jm5ioibzYYsuxN3e/HZpHO7iQlD6PFHQJP6euigrU=;
        b=NFlbTkDT90wlm85gGxIWNRHVqCe1hn0IGetIe9D4xuRRD7QeDaL2ZdbtYU7vXnNGWM
         hl2whEWrdpYQNpmPxIRFcjkJFkUpqZE7AUob3BEBV4uNGyYEFaplu9h75Hzo++CUeOAl
         Oc7RWAR1MedwBvkEz5r5223mCv9NthcLpSL83nwAbbvlvfCrNWTtpnLdgcT7RQo8njKL
         bdPmt+noifNFz2+LPWQIRKifyGDH9Mv1riBdgmL8yBgOXJWopqklIjKEN+UgURoBsLsk
         zPVVyC4VqFc5SrmNJA+HpaZMDCL9YmMH6culN9AOsSAQSvKxHKh/AnoP/dbRXcnX6ENG
         Ys1w==
X-Forwarded-Encrypted: i=1; AJvYcCUFoFblznhAa4Mms0c1mATXqL2RdKY77PpABb0ScmYi5wcmIzl4hner0z5k8wIbdbkKg0r1OQQ2T6MkJhZsvlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjC0YbklNzb//hBGfrZ3g4r6zRxiRZOdJew8g7443bJp/tm0Qp
	dwXTNb1ifu45Q/uKlTf1AeNyex9BAJwEwEps0TJhgZvmHD455W8CyNZG2p3Dy2Ie0VKLEs6k8d5
	VlYn6bXKIK2eLdcllqZxzHsudN4XwLg4=
X-Gm-Gg: ATEYQzwzLKwG2Poctk4Sk9ikG5HHW8sPdyzk9FMlJ8I5C2uab6fNARpt6jPPBydAMSt
	rJXid8N9xpM/R+kIY0BF9kEBQqzfyFL2rhYQZzRpGPXM2AMUjRNwfoCHiqdgMNLkxHhXbyBgAop
	NH2oDNN8gclaL6swXqycAXwi5qaaYyxzNl8okHW0fEfn3Vmd33OUcaF/NLJZ/90HqCt3Pgc+2A3
	uxSP4/T3K/n191oPFG6CHSQbqHyoW7ZX1gayHAo3t/SrKhOJt30dYbTglOPnvG59vaDVKCg45jL
	VTBUYdE=
X-Received: by 2002:a05:620a:4495:b0:8b2:7558:409c with SMTP id
 af79cd13be357-8cd6d433536mr127115485a.36.1772776804131; Thu, 05 Mar 2026
 22:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227231606.421263-1-colin.i.king@gmail.com>
In-Reply-To: <20260227231606.421263-1-colin.i.king@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 5 Mar 2026 21:59:51 -0800
X-Gm-Features: AaiRm53llqtE11GAWF7TQT_j_IqIvRNKAACgRqaUCHB6Ec0GjYvrpcWqbWg4a1Q
Message-ID: <CAFqHKTkYqnpN8JA6P9kv4QFw1sbrgZ6Ctn4VXf7KXChCWnDM5Q@mail.gmail.com>
Subject: Re: [PATCH][next] HID: hid-lenovo-go-s: Fix spelling mistake
 "configuratiion" -> "configuration"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 3:17=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a dev_err_probe message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/hid-lenovo-go-s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.=
c
> index cacc5bd5ed2b..dbb88492fbba 100644
> --- a/drivers/hid/hid-lenovo-go-s.c
> +++ b/drivers/hid/hid-lenovo-go-s.c
> @@ -1401,7 +1401,7 @@ static int hid_gos_cfg_probe(struct hid_device *hde=
v,
>         ret =3D devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_att=
r_group);
>         if (ret) {
>                 dev_err_probe(&hdev->dev, ret,
> -                             "Failed to create RGB configuratiion attrib=
utes\n");
> +                             "Failed to create RGB configuration attribu=
tes\n");
>                 return ret;
>         }
>
> --
> 2.51.0
>

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
