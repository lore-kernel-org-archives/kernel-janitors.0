Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2F9144D21
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287384; cv=none; b=HBcdovfGiuIG3MiaTlVHrEJMRgsNuSvAAfomVNuU+f20IhmIOtFiBFbRgy3AgAp0uXEtGu4Zoe6aX+sJMV0TICnV68eKNzGhTF9+k1xyBcZxrOIOUL3XqOAAsNbK7Bz+RGa1XQk42jglbgyyuBzpl5UeWyFr1Z3G9/55jqGL3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287384; c=relaxed/simple;
	bh=1wx770iYfJxVeyB/o0cEcpJdRc6wURsrq5BJtNrgFUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTlX94AGHEPdrM09QVZPVCzj1SjMV/yWBuUgyi7ksujcenbrmKgGxHSwjoCARV20YVNB5LMfPGPI4ijySHG9fgz9HHQrWzF9zFwfdoMyaQ5gPR5qWne2DFW+Og7vQjSRkRTA7PwFJrJ7KiQYMd2+rRTW8R37KVkqIqKKMWDreWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4HtnEC9e; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4HtnEC9e"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57c5ec83886so13119a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718287381; x=1718892181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAfB75h0kuFNnnSc8B1rhVQt/y/45xq3MCcns9r1vWo=;
        b=4HtnEC9e7a8Ic3mWVjZiqHc1hzWc41HOr+/ksoo9maBlYd3WbpkEDNQkzi1yl09MKr
         i4bktiO7O1/sUS8KH0r+To3rMqI+Y36/xT07jdBFAQr+zmNSIYDcZuz9YWixwqTGdI38
         buFqYk+QJ0zPKWGm8Qy/C078y1s/dBiyPM72pttPkRo+9tbOhfDVmgrBnTNA3LJoEpbP
         b5BhRd1JDQVMtL6I6EaVkqmqf7vDAC9FX0jNNs/4FWNbxyKCEB/Fheg+ORJlZqM7BZAZ
         c51akZuobhU+jDpkas8dMMZSKykpzBkYOQ9Yr5DsjvQVfQ+evY/9K1sTUhRT62oNluLg
         sdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287381; x=1718892181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAfB75h0kuFNnnSc8B1rhVQt/y/45xq3MCcns9r1vWo=;
        b=lv/OqXxh+pOOtFgNo4a0DctKK54LO1ttlg9huFwW6nzW7Ycl1K3VP1MSSLUpAMU8fm
         hSP6W5uCvnJrf3DKwNu9wVMqz8ABv2Aph8tCHXtg6q0KD/6hC4UWwgVQrw4CIbs1JLii
         ZZNkaxDmR/th/O+PiF9laUCfOk1ltkWsaOucckLQZuMs0UwWn6c3IQPjDRQv+F3kQDu5
         BUg4zem0Xk+yx2WXgASlwH2qYKdqO0OBQfocXkC7O2U6f/axZFTpjjuDPS/EVQezcmkf
         Myxrp1mm3Uc3aMpuDR2qhAlc+neO4THR3bCbRVNhG6rIC8H1G1nQlu4rcd0UOS386mjp
         rScA==
X-Forwarded-Encrypted: i=1; AJvYcCU+6hUivfAgn6qYSmiXlvcdYK7o9aKttX17OZ+V3rYJHFzitOVXfepSZduKic+cm4PaFzVKf2svG+qKTxnoMStlD1hesq5q8ViCENAamn8a
X-Gm-Message-State: AOJu0Yy2gw8Ncfe1UFWjI8uYvFZk4a+UQH6yge5hWM8oU6dI6cqAv810
	zPN/qdvLuchG+acsKKNUx7cV7ZCieUgil0nCVodET3hzzfTpv0lLygLQEH+x2BlWRX6cx9PTSgN
	f8g5ebY20qLEPR6zujZ0PrBTcHISGCx+qzjiS
X-Google-Smtp-Source: AGHT+IH0NnlPmn5HlqCKL6WJ0KQphhB9Nf2R+bPra/NjP86oZDQMsRCEH2X8d9emIYgu9fIz8hVm2OJD4zGwQrasNjU=
X-Received: by 2002:a05:6402:51ce:b0:57c:b799:2537 with SMTP id
 4fb4d7f45d1cf-57cb79928eemr148226a12.3.1718287380997; Thu, 13 Jun 2024
 07:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
In-Reply-To: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 13 Jun 2024 07:02:46 -0700
Message-ID: <CABXOdTcvie8ZBX8aFLve_7Lbh2SD0XPWxVn0nneOz8LJQEE79Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in cros_ec_lpc_mec_read_bytes()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ben Walsh <ben@jubnut.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We changed these functions to returning negative error codes, but this
> first error path was accidentally overlooked.  It leads to a Smatch
> warning:
>
>     drivers/platform/chrome/cros_ec_lpc.c:181 ec_response_timed_out()
>     error: uninitialized symbol 'data'.
>
> Fix this by returning the error code instead of success.
>
> Fixes: 68dbac0a58ef ("platform/chrome: cros_ec_lpc: MEC access can return=
 error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index ebe9fb143840..f0470248b109 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -139,7 +139,7 @@ static int cros_ec_lpc_mec_read_bytes(unsigned int of=
fset, unsigned int length,
>         int in_range =3D cros_ec_lpc_mec_in_range(offset, length);
>
>         if (in_range < 0)
> -               return 0;
> +               return in_range;
>
>         return in_range ?
>                 cros_ec_lpc_io_bytes_mec(MEC_IO_READ,
> @@ -158,7 +158,7 @@ static int cros_ec_lpc_mec_write_bytes(unsigned int o=
ffset, unsigned int length,
>         int in_range =3D cros_ec_lpc_mec_in_range(offset, length);
>
>         if (in_range < 0)
> -               return 0;
> +               return in_range;
>
>         return in_range ?
>                 cros_ec_lpc_io_bytes_mec(MEC_IO_WRITE,
> --
> 2.43.0
>
