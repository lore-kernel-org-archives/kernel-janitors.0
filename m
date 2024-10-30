Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788961E9079
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293792; cv=none; b=TpmLA1jOazAv280rMq2w9qevpQV6QIvxPMU6R7I/siSj3tlCYjrruBTNSeji8N1I3srWTC20I+EduMAzBuZINWbdDf4UIU3hcI156wMVHY95EPtgrbQCDcBA8BCud50OquxEfwXuFEljbqaCLeuwPvx17svWz/V0JiNtZpIgXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293792; c=relaxed/simple;
	bh=l8Vaqm8vvg2grcGZZMWtn8dZK5+rrhiM54tx+OtEKpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c8VLztgNPpB1xNeR0Ka3mJHR7CqOFFf7VyM71d+XIL6Sxes3U6zabVwa9xQ4oojWQXOBMWddPa4yC8qhqmXzuKs+FZU2Gs9xjGs/yVzCpkQEavtLF6z6QjyDd8C+febVyjmLJF92pQrpwvbjiAFh/tSaLN1Jdl3QNlec2nB/pQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=njkWoBCm; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="njkWoBCm"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83abe4524ccso242543239f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1730293788; x=1730898588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5uFWxZgbqN465Uc4jqzPSiXE3iBEC7P8OPuQ7oSz94=;
        b=njkWoBCmtdDPdEkJI8oxqxwFx6XFnq97pWyHXt479kujWINxtzgugnn+p3Ktl5N1qk
         TAz7jZELMX1oiR7fFO4QlifXhSyuOna8421DIODNoXDcIcCO3XA+p9q59RizcBKdDN3t
         GJ7uo1FDI51aM51MEGg+P4ZltEihVXWm8blk8PRFWNflgNpq/WqrJdGXSPxkvf1JxCnS
         q4uNdRmfe4MypsGwV64HV9WIKcZLOUKrqSmy85nRV7UyUVuS7gjuXcijW54VZvsnszpb
         ZFTQ67BHvTGPwMgl3JNl03k4SQRsdQOyDl+zWZBTHojojCG98bT11SHkXGCEAyOU4T8c
         I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730293788; x=1730898588;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5uFWxZgbqN465Uc4jqzPSiXE3iBEC7P8OPuQ7oSz94=;
        b=q1LLkAkY7fTVPvPdYs1tB1eBnNUFrCsI7SIGG67w8CyLrOWyGumowsMbFd1QgppkCb
         boiHy7cjQbbk+enLjyJLkQ+BPCW6S3+s2nufGqyt+wHK8wXrLGfBCGJekkP6/omkglwO
         ias9m7qS8K/XPtdNaL1aG5a2/XnSXYsJIGhbZvxvMDTA6KRKzhjoEKvNny3AA/UY3sw0
         EJYbKFWfQ3J1WX8DIGb8pmU05HsV93gmRvVOqUKdU8HidzrCHZ7mWlDtpUHFVCSboRTd
         RoOKgnjg63V+mMl7eWQbRxEuJwoKG2rmf+WjEd0MOfWGaSpIiU1CgeSXOTrraT0960/V
         y2FA==
X-Forwarded-Encrypted: i=1; AJvYcCWtFrjve94/mu8Jc5l0lxkJXMYRnitDKmR8cf6PnP7W2M9YGPXBp46uwHJ9OHd4NJ/FHxR5YdH83pFXVx9vLJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywha3u8n61zP8C7855X4twLPvJpCzh0AZiZ+dCxyezpkQnBSi2u
	oppQWg/sYGnKqdDnx99JqX/zyU1xGeIsAaOFQd1KCfRUWCFRZNyE21YEJ3VqkZw=
X-Google-Smtp-Source: AGHT+IFQb4lZiBi+1U1zfzQLBtmJOfTwNZe/OueVbEgtpfPH0xKP6fFxVkr3LuD7QxaPgDfm7eVnKw==
X-Received: by 2002:a05:6602:14cd:b0:835:4d07:9d46 with SMTP id ca18e2360f4ac-83b1c5eb908mr1288945239f.15.1730293787146;
        Wed, 30 Oct 2024 06:09:47 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72751298sm2872855173.91.2024.10.30.06.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:09:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <762b0c95-f4ce-4fb3-8212-01e216f683ad@stanley.mountain>
References: <762b0c95-f4ce-4fb3-8212-01e216f683ad@stanley.mountain>
Subject: Re: [PATCH next] io_uring/rsrc: Fix an IS_ERR() vs NULL bug in
 io_install_fixed_file()
Message-Id: <173029378597.7840.16771277924370009156.b4-ty@kernel.dk>
Date: Wed, 30 Oct 2024 07:09:45 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 30 Oct 2024 12:54:52 +0300, Dan Carpenter wrote:
> The io_rsrc_node_alloc() function returns NULL on error, it doesn't
> return error pointers.  Update the error checking to match.
> 
> 

Applied, thanks!

[1/1] io_uring/rsrc: Fix an IS_ERR() vs NULL bug in io_install_fixed_file()
      commit: 9b79509ce43370ceaf582bbf752aaeee9d40c9e0

Best regards,
-- 
Jens Axboe



