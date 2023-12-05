Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IK66RCqo"
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3007212C
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Dec 2023 06:00:15 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ce3281a307so323017b3a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Dec 2023 06:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1701784814; x=1702389614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3+bW/v6MDITHt8Ne3kr1yjPs8dFYgDQOcc3i2P9p5s=;
        b=IK66RCqo48j2jMqLh8HwPYD+Vh4aVyf2tZpKo/Y4PkkWdEROQnAMNDpYVmSkgPgZWj
         EUkgf5wgaVShjZQhrCg6Iv1aAiVtT5Re+j7zBO4wQJvQAcyNzHZVaDp6y4O7bVBBCmII
         diX+imgLIdm/wpzU8KO6ol4Cm1WjkrA9HAdOfzWnSKA2GGElTHsWRm5P5B5weL6/WTnO
         ai0h1AzMNtlSG70fsYoHPqOGTOAdelE8f8ADqPNJKwdDrIXhrqnRC/Jx78p3dPahnVlT
         i67V0m9euxvCc/9Dk4/f4SnJH6UYtdltBUvs4pADL69FVFJiWMY7RK8XFHaOgKdOFhrW
         /R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784814; x=1702389614;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3+bW/v6MDITHt8Ne3kr1yjPs8dFYgDQOcc3i2P9p5s=;
        b=GLNwLZkg6qkPQxtg3RDw/oyuXWcb5qehyBIrynfABAFj4PxQdP7G9srsUp0nuLUl0Y
         N2t3H1wSPee2pGoahrFrxHUYK6khNx3goeR7PScGHadbRXw7BRbva6REMphiHuuHnh7h
         Fb0C9Dwq6rT/logwCu7C74vHH7JK4T1nz4hFQyRai3qLHH5VOaowk8RI7o8TUKVZiHqV
         sHgkHbDPmQDBkEesLOs4w2u9fo1JQqBINi2VMZkc3a85beVglWyjMl2QR/TupDqhHDcB
         MDOU1Gw4uuxl8D1XmntLMWg2s+wZXHWjcnQamxR4xWFy/3W4BNTkyBTiQPSFzyTEGmXM
         F5HQ==
X-Gm-Message-State: AOJu0Yx9nz4FIsgfXW+wShkNwXvgUXDzwRc89EAGwVcvb7lVkhnSHLgK
	hHXbfRmVAEvmr5v7+CRPBoLQKQ==
X-Google-Smtp-Source: AGHT+IFQjdRBV5sf/JQ4j05zWmrXabqvEORSDJHB6L0Y3ji8r06KlwdZd19ypeLkZuJUH0I1FjzQug==
X-Received: by 2002:a05:6a00:3a04:b0:6bc:67ca:671d with SMTP id fj4-20020a056a003a0400b006bc67ca671dmr42693253pfb.1.1701784814321;
        Tue, 05 Dec 2023 06:00:14 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id g8-20020a62e308000000b006ce6bf5491dsm1406377pfh.198.2023.12.05.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:00:13 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <5ed268d3-a997-4f64-bd71-47faa92101ab@moroto.mountain>
References: <5ed268d3-a997-4f64-bd71-47faa92101ab@moroto.mountain>
Subject: Re: [PATCH] io_uring/kbuf: Fix an NULL vs IS_ERR() bug in
 io_alloc_pbuf_ring()
Message-Id: <170178481260.1425677.4337915769048640252.b4-ty@kernel.dk>
Date: Tue, 05 Dec 2023 07:00:12 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-7edf1


On Tue, 05 Dec 2023 15:37:17 +0300, Dan Carpenter wrote:
> The io_mem_alloc() function returns error pointers, not NULL.  Update
> the check accordingly.
> 
> 

Applied, thanks!

[1/1] io_uring/kbuf: Fix an NULL vs IS_ERR() bug in io_alloc_pbuf_ring()
      commit: e53f7b54b1fdecae897f25002ff0cff04faab228

Best regards,
-- 
Jens Axboe



