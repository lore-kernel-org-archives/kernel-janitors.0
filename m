Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D052F616B
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758911857; cv=none; b=m0uE3vryqVMs1SuVbdWTLSHiMYL/bR6liIF8FXoOQBlbXY/Gyc3iNpQBrVkQIhYNjna+IJopv+do8YdMGWJ4BiYCqmhQAkY23IE/raJsPmF6VtADaGMC8yNZVSXqlXByH55B8jLS3RAEbzY5Wk58bL1iazTIkvixqPx0F2BxsnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758911857; c=relaxed/simple;
	bh=JF64E9LziDMomCBPJZwiXLhLGMAjQD1sjgEoH+6r38E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mmh9V6ZEEJ3i6ifcpBlEsX3eAAobILHcrIGGM7VxS4XP3OeMW4kphbHGrnpXTIELWWdBHm4IcpN+VU7e4QqHVHzpk9GHhtf/t6qfIGtbflV8GqdSD7NSHXdgoOKrKRPLzlsBUbTzLOeU1WyCSvq+06Q5D/H9V9QURIrv/1/HnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnXmrsn6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnXmrsn6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f44000626bso1603112f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 11:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758911854; x=1759516654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=mnXmrsn6NIrGzTc9Fq5YQVZ98jBpmr+MKZvjQiHsFAxdLMnqVP+WQ49yJc2rVDidBD
         EgHkHqGz5+TGORNvHu6QxNrLfWiNCU9xlzVZZMfEazGc10BOCZPLfIFwfLUdBPrT/GOu
         T41Il4Q4Xv2N8uxTYRkv/aT3EnBp8A8I9jgW4mBUMVHu7PKoG7zUmmC6OuIFyd666F+I
         sCym6Eu1k+Hvg5CE4MPFnQVjGrZX3pmN8Icn267UIizwXzCVmgjTkMuEj/S9PGh7t+6j
         EsWwAQgF9ThupbiecQRync3JhoQvHNzHlTZiE18yV5jj1efe3j/TfcAzVVwCk9lNT8E0
         u+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758911854; x=1759516654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4tLH4zZsU/KCMVQpK5rDpwcnO5VG4igW8/S8Fp/Tqk=;
        b=ezRNOwTCRp5G3br2UAT35gFjzwm0MN4Slg3qtBdi8xFjRYjtsYvQiIo1PyBMWYA24O
         DeFblMCz4Dkak5J0Jvf94Z13iuLI8bFZ2xnkJOrySa/5TM12R3PRIHn0F/6iLBjuOZFp
         uqj++w6MIfN7eh2hSLbbDXXKx6GHPa45pLinjfPYtAzImK+UJ7tPoOSaOwL9jdlOvjD3
         /TyjUQ2EQywukppAY9lWH8j/DPks/7VUqxa62VcU1LwvimxhZUMo0K7n7ckaY/bC8xVk
         YplapWYtTLS02a/WU0s8FuCppQ0Y3iUKh4rc0cgLC76/2tLz2FHbfCxqTDt2tFbLHAAE
         bDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXB67M37lc0QxpKjr33PwzAg08/caRred3UUsDUyxy+855BYNvWa5/2v0hx8HAK4xzfhTCaMUYlyQyThWY4aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXi5g8KkYSaUPPBrjmcuIPqcVtpKFyfZlUG9t+Cby7Y19ZQzMm
	L1JXKbaQQ/Ep0HHOiST9ym/Bltb4zWe6lStgkDLQJT6MsHlswqQqsE4x
X-Gm-Gg: ASbGncsadv1nAVoZL2xgVCutSUupmWxTal43DWlfrxvNX9PZ2KG8wMWsl3kp4xRZI+R
	TAojLBHOhmT4gJGLlRrUj8JhSsenXhgbp2hkCKByFJhB339otkjDHhPG+9YReDd38CG42DZBJKz
	nx0/SmwSFQeete6CwHAgHoRGQFewRE/G6/aYc6gz7zF+rlRvnceksRt79hGELrmtoyllidigQfr
	DUzZF1ttczZ04a8FqR0xq93D18Hg/sdEO+Zd989fzDfKRY/k70thu8VkJUHx4xOGkDcrUbgcY6U
	SzXLtAy18J9sGrX55ACcGpZnIAoZ1/dqep2+oJCRJZuArjdy6L767bV990Ng+7SXxGQ7ppTaW0Z
	hkA8glwat0UZXlaRhSWSjfmvY00HflydmRYJyvDdxzEZeZdufL0A8WaS93csOrd8HOknWV+bP6M
	143gQZZBw=
X-Google-Smtp-Source: AGHT+IGL3QvqfsVcdYoP6UEPTEo7LkSql6GFvlUpYyPH7Az5c/OcA09RHs++MokV2IPq/7GahQRVUA==
X-Received: by 2002:a5d:5d07:0:b0:3d0:3eae:576d with SMTP id ffacd0b85a97d-40e437370afmr7995364f8f.22.1758911853783;
        Fri, 26 Sep 2025 11:37:33 -0700 (PDT)
Received: from radijator.localnet (93-140-141-58.adsl.net.t-com.hr. [93.140.141.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc8aa0078sm7876881f8f.59.2025.09.26.11.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 11:37:32 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject:
 Re: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Date: Fri, 26 Sep 2025 20:37:30 +0200
Message-ID: <12766491.O9o76ZdvQC@radijator>
In-Reply-To: <aNYQiRJDmOO0mEWs@stanley.mountain>
References: <aNYQiRJDmOO0mEWs@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 26 September 2025 06:03:21 Central European Summer Time Dan Carp=
enter wrote:
> The devm_auxiliary_device_create() function returns NULL on error, it
> never returns error pointers.  Change the IS_ERR() check to a NULL check.
>=20
> Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through=
 auxiliary bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Acked-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje


