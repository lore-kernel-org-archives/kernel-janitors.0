Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F3F17B03F
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Jul 2024 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720547548; cv=none; b=uzkxonC4iDqU3B/+U9rjrnNc6+0Ii9vAAWSCrjlM88qUDPJ4RP3xeKpmu8NY2DvTCrUloxUqLdWY5fBDM9ng2W8ntVqGa4pqGRlmqaFz+2NlvJK3bWMywmbYiZ9B5Py1r1z0fYVz8t3ydFI1BvJVoAXEmlnBuaWUqQswiMK2dy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720547548; c=relaxed/simple;
	bh=B2ybeoGe/mdMT8ELtzXBtaeU6uv0Kbth2KRn9eiD6Ks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZXzP59hVSyTI8932M1457qOVYUhwURhgC5H9dA7N8haQ96kFF/hmvqV4lpgTyRw2eQp1EfejGXhXSYXuxvX4TJrESkNnlyLwm08E1UcUyYCTjxEXjWjG1DYQLUMONFGckmHmUONC49NIpq0aPfNNvMZiv0rMmARqEfX5yjBxkow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jtMkjYf7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jtMkjYf7"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee9174c5c0so6892321fa.1
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Jul 2024 10:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720547542; x=1721152342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4EOuy7NJXdErPjBoDexTRUjt+r44vQQLOT5S4Zc36k=;
        b=jtMkjYf7eVPIyQnA6Jd5Znga0NN3xkFLiuFyKOdkP0Pja+gHNPCVPdshqT01cQjg1O
         x+bv6Ojff/j6LE2Bt2GwISAN+PdfTs5D4O0sYRzm2wQsLsNxjGgNUs6EdtT1qr7O+cgr
         I4NO0Jwom6ID4lC1ioOF+HGXz8x2vDgzBRPp6xbQ/2CbMzvl6i4R+v5KCQzU4Ua1QGKt
         UT9YHZA3qyLqgdsUlaY92tbWEUqdTJGIE8Xy9MzOnXT/eolY9N98TRuKHvX9p5KBkHRx
         MsNYucH4Mmlaej0cOm84a9VHT951cJStHuB/qEEiB6pYk+owiqhnxLKknC4NLxhP/1va
         NUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720547542; x=1721152342;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4EOuy7NJXdErPjBoDexTRUjt+r44vQQLOT5S4Zc36k=;
        b=q6U5Aq0ZEq6a46a9U3JTzu5ecB3JHJBcHcdv7Uwc26TQI27plWF9dIWNoc33GWZrqG
         fArjBN4l29rGZl9V5fzWq2UCEB3J3BKKSXa0Za+jwcMlXn5VxGGHy0gS+toeXcJ3qxYm
         vVOeOWaEFb8zrg4okaa2X20cl/aVGG/BSw8fkEVxCdXoj6p33KAHY3cNBMjynzNpPLt5
         6HWsk9PWejCTG7tAs4mM5B1c4tEMtbCr28RREx+C+egsj62IhQ9D2QG9JhABRpGAMsIu
         TRItRyLuI2RY5q6waogxjvl26QIV/bebaU7OfGhNd+2gFCp024goG4Gdm+niYNf+GbXR
         msaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRTjmrmCMg+5dnpBaG6Wj9nc3H7KZCzYkYspSEkgNCfE7rZFNHRZFiJXJ4ldm89HD5O+uP+dZg2/BJ39A1Azz00RJhE/WreUO1rG4U94lY
X-Gm-Message-State: AOJu0YxtSyWr3Py5Bn/6VaD4wIK1FWjfOiapLsAIelU1XvuyxRaoU1UE
	cAdxPbABXBAYELCDDAJV5u4scS2VmAfaWbvSzPdQG4SXZ1/WsDaUPP7w+4pFUVal6HvATB4XfTq
	t7tS+OA3E
X-Google-Smtp-Source: AGHT+IHRjslBxiqyy0G3zZrlaEYF5Q+TIgFQwRt2w+/GueaRGC3kTXkbxEmvDPFr3e86fDi9Pu5PbQ==
X-Received: by 2002:a05:651c:198b:b0:2ee:8ccc:f113 with SMTP id 38308e7fff4ca-2eeb30b86a9mr21999341fa.1.1720547542378;
        Tue, 09 Jul 2024 10:52:22 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eeb33fd1casm2454311fa.26.2024.07.09.10.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:52:21 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
 Jack Wang <jinpu.wang@ionos.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-block@vger.kernel.org
In-Reply-To: <e3d454173ffad30726c9351810d3aa7b75122711.1720462252.git.christophe.jaillet@wanadoo.fr>
References: <e3d454173ffad30726c9351810d3aa7b75122711.1720462252.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] block/rnbd: Constify struct kobj_type
Message-Id: <172054754133.374919.11899102978335897724.b4-ty@kernel.dk>
Date: Tue, 09 Jul 2024 11:52:21 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Mon, 08 Jul 2024 20:11:30 +0200, Christophe JAILLET wrote:
> 'struct kobj_type' is not modified in this driver. It is only used with
> kobject_init_and_add() which takes a "const struct kobj_type *" parameter.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    4082	    792	      8	   4882	   1312	drivers/block/rnbd/rnbd-srv-sysfs.o
> 
> [...]

Applied, thanks!

[1/1] block/rnbd: Constify struct kobj_type
      commit: e4eaca5e30c55c83c547974188afc2b2d02d4f0c

Best regards,
-- 
Jens Axboe



