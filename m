Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB0301713
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760126149; cv=none; b=KAgQWJ9oT7z6xcECT0Jp8wYONUK63V3Tboylwzpxhg37i3veTjbraFEOPC1dnhCts4/vyXfoYlEbpGITGV4+7Kxh6sgdtoazNV6yHcd+buhZzj+yUcEmtu6jPXw+MXQp2FoTBX1lGNA9CLVoI7Vq5c4+FFO+7BSFoiq8Ve7AD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760126149; c=relaxed/simple;
	bh=9PS7F/m4n1uAkBYWPryVi2hX01WNFFT8P5czGODVaI0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A8hkTRF623Szyax12iRGJrXpfC24QmvzBIYJ5/6dkj/0XM4Z7BZguxZ9TpQN6UXdZFPD7d7Rft0EZYpm080L5bsiwOxQzk6YjRV6ziJzne+Z4qawdS1ogLjNCZaxTrL4SuozuepP8PjWEOkGmcf+nvDI4tp3E6DjtZmUpYzOhf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoOTehJ8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoOTehJ8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so11782015e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 12:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760126146; x=1760730946; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WlPTxxGqUeSR2lZkjJtan7WE7z8YmM6/O314vANG+hE=;
        b=WoOTehJ8ZIkVn5KybLL1WjDwxXHekgqlHfszjSWVfabSv6MMLS1rkll9MqiUPO62bF
         YG+3c036NgWKmyj2Dh/1XJ+bMuTXoPEKAil+YyNqz9+xH6CLrKa+iSgYVtTKkuCdVRSG
         99iEMe61IxbDPdpm/6FoQpcMygsb6AF/PicxL501BSRH0oNAgmcfhHF9cq3whuG9s4WW
         KOUozpokXZlfF4QsWKgehZ/7JW/TnhKvL3uFcCYDsiOXC2wZD4z1HODQbSwHiuA4SqG7
         wzs+KDzRFKQA8dIwE6gy3JGtuHsDibXGtghO9Iaex8q+V5LKIoslO95B0vtKvMrtMYHa
         68uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760126146; x=1760730946;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlPTxxGqUeSR2lZkjJtan7WE7z8YmM6/O314vANG+hE=;
        b=wT5SPDhzgS01TGVMW5own0c4Si6KFLazMdIQiaBdy2VflsyJ6eEIrcKZmqK8cgnAKf
         A8JQiYgCXk9fx/YHgo984b+1CgEOJopeBSC8AXVm7udo1hlnj+lG5KYfOkS4Kifd3yH2
         ckvqP711z0qYAlnvecH3azon+vXaOZBJyebVOuZ05LPo2G+g/nRmmyTGpfUnEpCBGMDu
         fLWI+Pjvica1A+WWhFhY0ahtg/klfW4YL/rIMCa80iXqG8P1jPuEb3T1zJ/nQjQgr3Xx
         5y3VC2tWUvB4NXQhWPOSne9YwPHgGuA4YiFURTG8e7587GGSyhfCaPnGzl8wVvCTVy7u
         510w==
X-Forwarded-Encrypted: i=1; AJvYcCVGrEIAnMN1B4HuCS2BxTor/0NrJvqnRyaeE2oA7Ivn+Q0X/9gwFAwgLBIljo102T/Wa3Ds8NwVlLt2fOWqhMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUsgiD4vTY3Pwnp4/Fb5iD4dYeNjw8Iszty6+bDijVpNvYhn/e
	res/sVEC4gbmnzVsVpt5j82VxZ0Tx1CUCyRZuu156OU7eURXTPNF8kyoA3rvReEs
X-Gm-Gg: ASbGncuM6IzA+VVI/JeDhp55CenaLepQYt+ZrNH0jazco69AIDLJcoASZMJcTX/VlQT
	S0pZlTL01+H3w+NPd4EPFevde30mcrdTIXs59YYXrjFvnQh2U5Ar9adfebBXLKeQUQE+417Svrq
	ixRNws2sShzJbt3JYe3IIhhRljiILH2BWq73uivUkS4aWtBzRTVq7s2V7pDLwsVmrdDC1JcyH4t
	p5QJ9HAx8V/Hy9VBDV1BXLzhWUT3aLx+lGZdHBi8CX7uYQ1t8DYUInjci9b49NQTzNU8yVpHU2t
	V8eSZKXiuGV3974SfUdUR6wuH06Qseb+BUUDzliaQayG30AULFCCWRZhStv4G+Gunw76O15dKOC
	pp+g857Nm5s9uKGmlzeCWEd9kKkNHXdfR9MNq7ioVHFZe6YvlDgEnoX1pEKuEPrLWrHDHKCxFgs
	j6U6Ks9ARj1Y9J9ri7VWx+8Yma
X-Google-Smtp-Source: AGHT+IHaWYI9QvKReNHkAaSbov4hjc2gUESetJC4TFK/yM1c7gn97K56ZqGizY/MOi2ZOYx+SBgt6w==
X-Received: by 2002:a05:600c:529a:b0:46e:3e25:1626 with SMTP id 5b1f17b1804b1-46fa9aefe15mr92408175e9.19.1760126145632;
        Fri, 10 Oct 2025 12:55:45 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489af92sm70551775e9.17.2025.10.10.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 12:55:45 -0700 (PDT)
Message-ID: <3e91c2a282499f862ed7d27842d5bc2ee461ebf8.camel@gmail.com>
Subject: Re: [PATCH] iio:common:ssp_sensors: Fix an error handling path
 ssp_probe()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jonathan Cameron
	 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Kyungmin Park
	 <kyungmin.park@samsung.com>, Karol Wrona <k.wrona@samsung.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-iio@vger.kernel.org
Date: Fri, 10 Oct 2025 19:56:41 +0100
In-Reply-To: <6fdd39e3763a6e0e700982ac6ed63a5748a4ce67.1760122717.git.christophe.jaillet@wanadoo.fr>
References: 
	<6fdd39e3763a6e0e700982ac6ed63a5748a4ce67.1760122717.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-10 at 20:58 +0200, Christophe JAILLET wrote:
> If an error occurs after a successful mfd_add_devices() call, it should b=
e
> undone by a corresponding mfd_remove_devices() call, as already done in t=
he
> remove function.
>=20
> Fixes: 50dd64d57eee ("iio: common: ssp_sensors: Add sensorhub driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/iio/common/ssp_sensors/ssp_dev.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/common/ssp_sensors/ssp_dev.c
> b/drivers/iio/common/ssp_sensors/ssp_dev.c
> index 1e167dc673ca..da09c9f3ceb6 100644
> --- a/drivers/iio/common/ssp_sensors/ssp_dev.c
> +++ b/drivers/iio/common/ssp_sensors/ssp_dev.c
> @@ -503,7 +503,7 @@ static int ssp_probe(struct spi_device *spi)
> =C2=A0	ret =3D spi_setup(spi);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(&spi->dev, "Failed to setup spi\n");
> -		return ret;
> +		goto err_setup_spi;
> =C2=A0	}
> =C2=A0
> =C2=A0	data->fw_dl_state =3D SSP_FW_DL_STATE_NONE;
> @@ -568,6 +568,8 @@ static int ssp_probe(struct spi_device *spi)
> =C2=A0err_setup_irq:
> =C2=A0	mutex_destroy(&data->pending_lock);
> =C2=A0	mutex_destroy(&data->comm_lock);
> +err_setup_spi:
> +	mfd_remove_devices(&spi->dev);
> =C2=A0
> =C2=A0	dev_err(&spi->dev, "Probe failed!\n");
> =C2=A0
