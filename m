Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CA40DFA8
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775824912; cv=none; b=X/pZEphCYbRPJKKPZOnhNBcR45BLWZ/BJF7LSH3RKOO6Nhq0EwTmmwPKRM33m+lSzDTjR8XS13vEWjMNQ6ODFm88ae5m5Y9r1AlhwTd6mSU9OMQbRWJM0uT/n6QLaE5fwUD3PAXh9giQexeKBa9mIoEg62B+7mmaDGFKH/915nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775824912; c=relaxed/simple;
	bh=fUTvlatld455rE026QHohXmYqmcoXXtgAIxQDnIzF7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQnKNaGz7RJd6BS6ab4quINnzK+KHJYCfLISimpK2ox4coZ00G2Ds2kSKgWgOZektNU8DhPorUHTdtWxRWsBXlzorol9mstBSv0N/NbJnVqKjVEFhQY9U4LSyRnbAPUEW5C+GXn+uhFgz1SvdRCnsKK2eTgN3zGQhKxUZG4xEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NjXY5OkJ; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NjXY5OkJ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c1fcce8f8so749482c88.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775824910; x=1776429710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiALXUGoApaH1OBcmKA7Ty9vDWz9xc/ZD0RE3/YEPdE=;
        b=NjXY5OkJvB8z0f/FqhUMNHHKq3XevCmjHu7TAFY7HVkfC6baRTI8PBl2FlsrNZLTgY
         CSFN9dS8UX/8vDh59M9PJY4SplPsAqCD26C+xFBXRAwg2jjGDaMNRLgLghGgDhfugcIf
         hUv2VL4mXQenIU1rEAbt7krHJkfOOLOC30ObzAsnFHOVmHdWyg4DpNdVrSvAHsUITAQ7
         FBHSR5FJWn/vZc15YPOGKsS83OSHdq+/VcjIMrjn8ZvedxvlcVDli2fvA6YFcXS9mya2
         XXTJgt9uJegeAIb1M5jBEciu8ZbPjshfgW2shVnw2nFNyedUCIGl8IbMWSs5ef43PVr1
         KCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775824910; x=1776429710;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xiALXUGoApaH1OBcmKA7Ty9vDWz9xc/ZD0RE3/YEPdE=;
        b=DSqyE76bgyJgFa32lu1WFfIX3fGwjtLraCIqsunOSXXrDiwVqJyIjNu6RbSu6N141q
         y2BWXS2IMouakvo4ZNfqPBAWMB3hUkMUl/4XUmMZ3K2E0SUvIhYRYTVmrzdkPCtZPg3G
         sx7YpOVeSvl7VjL2nB5nFBx4jDJvaWQtLIJiuj1PRNq6/12aM6uABqpuYOEGnam8V6FO
         Vhg8wjhqBUut26/hA+rArU3cNlQV65Ivq/pJymdwJcTbTftNrmTvNpFOQZu10tLdmyZ6
         QK7jb+vXlXTKG8f+cCoSADH3BGaYWbL7ZAyOzVCAV5RpOlDVLinMw3p61G7vo/MpWj4M
         mj1A==
X-Forwarded-Encrypted: i=1; AJvYcCW5uXZOGRU+vGgpvTVJshNwsXSZ8LA/Xx8OgcikF4QkDtcEjfQslrd8Q978fayt5lVFbkr0nCWpBH2qjl2iYM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhWundnFJEF2whT0/UEFvbe9mkcQqYUluMRIsVLkIedi7Ejke
	CulmID/SOai8fG7l8S1II81etFyG+0+2ZYU/KAiAB0qB3WIJTYfRia3m2k+7AUPioCk=
X-Gm-Gg: AeBDieupC3NI4s6udBKtB3lT2hIkcvyh924c4rVVaZD84nEXch78ctXBVtOCVr6ZOOD
	WuZzzsqpJ2Fm/P7rPYbSe+D5ywioWemnuel2PH6pNgaW3UhIXwaAJSMRPBNAkUZbF2EsUWQ2Atd
	bsriFrSp9511LyMpBI7LrcgmD3QZI7GdqLC6Mlsr+Eiafjm1HbFtwcO+i/kd4nkVEcghnRF8sIi
	rb3/qWkH+ltei3SIzMbhEXY+MpzBickV/3aUTrdhpPc9th7/Z3UQrLG6syLqi63UKu3ap0YT3+e
	aS9sTcEDsvdhWTcJXSkWd8Ix27fWhPagVQm9oHh4SNTptRvh4DnXJoKxsaI5fpg5boKrFZweBfD
	4Jwqh8p7CJURmP9dRUT3rhSd6tsv/z6oDeZ/KUDINA+V3PyY2H6xSyMR4oezQLcfs1HsdO4tWOO
	XNm0kKZNd0s3cfB/djykS8rnTGm+xkBlpg6gdmJbtyrFdSxAfnlTL6DeFXBIWwlngfi55YqSC57
	+CxvrBtQg3cDyZAiX5r9P1u9f+Yo8tFPlAf
X-Received: by 2002:a05:7022:e19:b0:128:d714:3ca2 with SMTP id a92af1059eb24-12c34e3f4e9mr1754028c88.2.1775824910269;
        Fri, 10 Apr 2026 05:41:50 -0700 (PDT)
Received: from [127.0.0.1] (239.sub-75-226-114.myvzw.com. [75.226.114.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm3061572c88.13.2026.04.10.05.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:41:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Yang Xiuwei <yangxiuwei@kylinos.cn>, Dan Carpenter <error27@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <adjNnMYK7A7KMNkA@stanley.mountain>
References: <adjNnMYK7A7KMNkA@stanley.mountain>
Subject: Re: [PATCH next] scsi: bsg: fix buffer overflow in
 scsi_bsg_uring_cmd()
Message-Id: <177582490925.498357.11572099652786235764.b4-ty@b4>
Date: Fri, 10 Apr 2026 06:41:49 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 10 Apr 2026 13:14:52 +0300, Dan Carpenter wrote:
> The bounds checking in scsi_bsg_uring_cmd() does not work because
> cmd->request_len is a u32 and scmd->cmd_len is a u16.  We check that
> scmd->cmd_len is valid but if the cmd->request_len is more than
> USHRT_MAX it would still lead to a buffer overflow when we do the
> copy_from_user().
> 
> 
> [...]

Applied, thanks!

[1/1] scsi: bsg: fix buffer overflow in scsi_bsg_uring_cmd()
      commit: 0a42ca4d2bff6306dd574a7897258fd02c2e6930

Best regards,
-- 
Jens Axboe



