Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82C1FBE
	for <kernel-janitors@vger.kernel.org>; Sun, 14 Jan 2024 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="EK83sAd8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6daf21d1d5dso1197879b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Jan 2024 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705243091; x=1705847891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slYG4/qUPS5LvmTSE00TdapIZbw89Wa5F9GMGjLGJYw=;
        b=EK83sAd8acrfoPmfv/7OUOqGfQdCb5aZn0Xnzc58YVKlFB6k5hOmrU3ErhuHaJRTCS
         pmNUx9qE1QkVFxb755N5eaajRVlcVmpOP8RuMfhObD944ALvxT75xkccaYkt9x/iYiPA
         TLt83GO94/GwRt3BR6GTi1EtbTwB4jf1CTpxPtDpceFAuneEiTFd2Q+o8EN30XHJ58Jy
         P7BqCpuevoGgeEbEQtVVy2sXuz9F5N4icnbpKvn7nmIMDPR9RX9kRd1Su2lBZotrtViQ
         BB5OZkwm43FB4+DW3xpRWKwnULECQL2ifBqYtQhLA7jF6yAkaH25f/isWUZx7BH5Wz9N
         YWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705243091; x=1705847891;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slYG4/qUPS5LvmTSE00TdapIZbw89Wa5F9GMGjLGJYw=;
        b=BV45eMY9EDdVGKtDD0V03kPmQyAw7raI20m6S1+L0KOsNvuVi4GfPScSenupgsJsuz
         WhOmBEJAmyVgD3qAiG1w90hA7Cw5E2+23sfvcMwa0PfN2InUW/qy58FiKyLG0olvP8Ko
         3WJnveRAi9QnvVnaVVsLyOzeZlqaDH0Ggiy9JSeI6IWd71rwUfYGiw23zCz0qY3Px27k
         FJSP8+Md/x02uqmROoFKhN2NQ9qPo9242uDc74HEyeBw+9cejuwBsdzmtvsc2k7zFYLN
         HkZzeNhGTqcfmbZRitdOUMyIop9lJMF3+7GP2HsT0BgqNxpUfUOBGcCuGCTOzw9vywkG
         Dl3Q==
X-Gm-Message-State: AOJu0YyWgt/aVE3zYN0sjD1h94fCH9QfNmi+2kfDkNIkpr8SjOyx/b3P
	6W/HNmT/UbmLJ++u679hyXujHNJXU7CA4w==
X-Google-Smtp-Source: AGHT+IHplSmHWesRFB5P6Lfx/hWC52f22Mw48hTkqWT7ZepTEfuYELh4EtN1JGuZI2wGuw8VSuONZw==
X-Received: by 2002:a17:902:c38d:b0:1d3:7788:1c40 with SMTP id g13-20020a170902c38d00b001d377881c40mr8522221plg.0.1705243091553;
        Sun, 14 Jan 2024 06:38:11 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id d3-20020a17090b004300b0028ceeca04a1sm8026694pjt.19.2024.01.14.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 06:38:10 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-block@vger.kernel.org
In-Reply-To: <bf257b1078475a415cdc3344c6a750842946e367.1705222845.git.christophe.jaillet@wanadoo.fr>
References: <bf257b1078475a415cdc3344c6a750842946e367.1705222845.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] null_blk: Remove usage of the deprecated
 ida_simple_xx() API
Message-Id: <170524308977.2428903.15884730102790776317.b4-ty@kernel.dk>
Date: Sun, 14 Jan 2024 07:38:09 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Sun, 14 Jan 2024 10:00:59 +0100, Christophe JAILLET wrote:
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
> 
> This is less verbose.
> 
> 

Applied, thanks!

[1/1] null_blk: Remove usage of the deprecated ida_simple_xx() API
      commit: 95931a245b44ee04f3359ec432e73614d44d8b38

Best regards,
-- 
Jens Axboe



