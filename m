Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C92F6168
	for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766262351; cv=none; b=qTIv6AhHrSbgl9qfYA2Wo044GltuRT9Gs2BNysK8LF3KyDPhw7pQP9djIPtAM8XvD19KLxHmx+cgKcjBzJMrKWlc8VzlKJaxgikFebyWGOt+EeGT7aFB+QldYL9EGWAKa7wCsUFh6z3FXOA2S7ztd5fHCEGjyco/f3gjOdZ//6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766262351; c=relaxed/simple;
	bh=MYVHHDYPJQlGy377kN/D5GQTkJQCWYfxlfGGoipB9Qo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RTog+MNWoud8y7G6H6O0XL8YThutv6gz95JD9QJ4C9ziSk5tpG2C8GkVwh6N9luJa2XgHr7AIgqmHoI8sSiOymdnaov0Z3lVxfJ9QAlrzoGOqbcNAh5lyxpuTWVp6syeiighdxVluZ5A9ClzrqurS4EBWQcIZqjq6PAdlhml6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=FtvsBmqD; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="FtvsBmqD"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c7533dbd87so2287918a34.2
        for <kernel-janitors@vger.kernel.org>; Sat, 20 Dec 2025 12:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1766262348; x=1766867148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECS0k4XdVu/LKfu6qgP9Zpz4mmQaxblDFvP7Po9U/iE=;
        b=FtvsBmqDRdkK/HP39EkHqymXzLOsOnR27hHTXftcSxpm/cTjvu61DKR5H4RG0KYTw1
         Oo4MJIBIROvXeJ+BtGDkcvjbRV99vVAel7CLT5inJq19Qv6Kpc76uiWArvG+X5GrU3PT
         nYM52JVsil1HGpmjXruk6W+ig2TSqYZW7ZkJELpLRKx1S+46yK8ILlCfnxeWaqyYj8jg
         0+ZrfIt9mqGTmJ4eOpB6szGkptp5cLTjoZMIpOypILkeIYXI4bW2BAa/8fjIpoeX3KSB
         SSvF8FYXgyUFddSxFl/1mNmPk/6wRmofTx/6a3f72PB+j4aJrsHktvnGudVSZXJX7FnC
         yg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766262348; x=1766867148;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ECS0k4XdVu/LKfu6qgP9Zpz4mmQaxblDFvP7Po9U/iE=;
        b=uWLO3df4K54MVPwVmwXfTXn3k1pw94YB70uX6TxwDtCqt6SMTHk3wmZa+1EMvXIYbJ
         I9nGTP6VD0PvHi3w+MN5shvf8o8+T6BhLUZ+4rizoCU2yVzU4VJwMnRFhThnuut0RbNm
         eNkPCgA39EtEB4JIyMQMSeZIy2avj6QbPFM+73Ps7KZlEFDO/OwTtuZjaOU5sk7UhOvr
         BWKr1VcIMmMy+lZjSA7CFcjh6WAMBKqHDrUSWR+5y7ZTbiS8BBVTh0IhlnoLnD4SBVwN
         qYoHd4+WtpBn7ut+Hf10PXwjXNhCu+0zbnlTStYIADiFTtHvGEcg9KMeeSAV45llVmYC
         NEuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjapImVtba71yjHLVQc2jQJ+1xYDYEEqyb2b3hCBJmBhjZGTumV1sTTOdkwS/HD49XHu6AavLdAXfzvy2ZlH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLxUP+oCnwev0wqJQ+2fwfYVHC9HWQrS7Jj67FYYIrhspTLEJ
	JlX7WQ5oZPDHUHjT78poQsflY1i/NWKhFmuZvpgpOFApuZe8Flb+WJMJ6z170Ec5LrTvqEws7qZ
	vxK2bDwI=
X-Gm-Gg: AY/fxX7iyIiy3DH3PJjvNcOhXHBF6UAdIlMdwnzhsK0OnhBteYf7SW5EA1LrncKgog9
	FzZj1dER9JIoAnEBBpTxkbJOgmKNwiE1uADsRuJnbYQWg82IOhu6Jclwh0hOy6L2hIARgg9j0eJ
	uhAMy+gs/FtpqKyoZzOR5M7ixwfh5qciy2u4fmAYEiU0t0rLr3IVZA/0RCiSqgegGObSrf6hp7n
	Lm+okNLuXJD6Mn9weJILkEUUWDlQMLp6Br1RdQj144JsQX49RwITJP9254QpIIwaYyOcoZfB+1d
	UC3/Sc/OqFT2qYzl3P5YteAOpbtsFQqWZ5/FWHMTRfXvyNc8ULUdGKm6QPtwKHwMQLAp1YGqXgl
	BiAKBv/VRfqoPnDMEQDTR+8l5tOT+k/bC1xYRD63vOge7NQAqYeOZDcqwDjYwlzybp39tgBeVc5
	cLhWA=
X-Google-Smtp-Source: AGHT+IGHnqUq6qhMw+8+QOCNGqZfJqkiKdZkMU3QPQCb7RcdfwN5RfqQ27Wgup/3i6q2X+NpNWmxjA==
X-Received: by 2002:a05:6830:4c0e:b0:7c7:827f:872f with SMTP id 46e09a7af769-7cc66a5a9d7mr4103333a34.37.1766262348252;
        Sat, 20 Dec 2025 12:25:48 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673ccc2sm4240033a34.12.2025.12.20.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 12:25:47 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Thomas Fourier <fourier.thomas@gmail.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aUZiUjcgaOue4j9S@stanley.mountain>
References: <aUZiUjcgaOue4j9S@stanley.mountain>
Subject: Re: [PATCH next] block: rnbd-clt: Fix signedness bug in init_dev()
Message-Id: <176626234708.413702.6669635606958101937.b4-ty@kernel.dk>
Date: Sat, 20 Dec 2025 13:25:47 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 20 Dec 2025 11:46:10 +0300, Dan Carpenter wrote:
> The "dev->clt_device_id" variable is set using ida_alloc_max() which
> returns an int and in particular it returns negative error codes.
> Change the type from u32 to int to fix the error checking.
> 
> 

Applied, thanks!

[1/1] block: rnbd-clt: Fix signedness bug in init_dev()
      commit: 1ddb815fdfd45613c32e9bd1f7137428f298e541

Best regards,
-- 
Jens Axboe



