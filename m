Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064FE32E6B6
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140778; cv=none; b=iHJVsYhQzbC3xAyjq2Kiwx7YdV6e7cMT8G86kz+J10PieLnnyrCYgv7YqJcG9aNAPr5Ue0ZoNRzFwLwqB3uott6hf3UO/MS6U5SgxPBxx0/3JCLRT7mQs1YMkLAevE26Yq4qCv6p7vyyMZfFx5HDDueQrSOm/6+U3tyxa5B6HEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140778; c=relaxed/simple;
	bh=yA2lWnYeOsGMIHc6VyQMkPT2YEEU6Yd6eVJPkXh8Tyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8vdwpcoY7C75Hd6LT3OFI4/KTmqo4wyxWK19HwhZyAeWPx/aleGRx/0/Saywx7isOHToGmEVkvs+uGbbLD2aVyulEZm99uMOIRJZOF9DuO19FwLConhXVfhugFzJ/5mCwLaqRdw9Qdo53+7KSBTSEnVyz/2q83QiOByzpa1O84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hMrioFTT; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hMrioFTT"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-430bf3b7608so61241925ab.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1761140774; x=1761745574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMa8S3z385kl/4H9dQfYkDdJgEgDVCU2D6eCwoHGu/o=;
        b=hMrioFTTW1Y0wTK7/XdqDASYG7XFxQFuc9MrjO1lsqw05EEb+wTV36ANpIqJlR4Aqo
         YGo+TPR0Ly3GRSZYprFTvowj5MRQiBd23sAiOGYufjnNNyltzMFO0BkuX0Nvf/acZ6mo
         snEfoQ0P8kb+qsy+NnhDyMlZvcR5eOkaXcVCnyBVeH4+Zc7OJskDWLePNVFjxRkbd6tP
         YKKgToaITRQLfIoIbOii6Gkn25gFtWmpjzrskOShBTP0IzKU8KRCN3TiGgbPRYBbCGvh
         AKlfOfZ180XdOrX90gF91PDrKC1KAzBojYRDQETneoGFS5ZxO4MlW5fi2jMuf3bPOIhs
         29Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140774; x=1761745574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMa8S3z385kl/4H9dQfYkDdJgEgDVCU2D6eCwoHGu/o=;
        b=svlouf+kGhiQuNu2bls65xxkNf1GhoOgXf4YmS9zqG8lNJLfn8XVu/Jq8Md9gc/xeQ
         o+ujspepZ82EUcNdcP2/LdNoIRUnmaRXa9Ug+ZdKxbeBWN9X/4UHdO3r8dx219oWf0ZS
         zlwBB8kJ7ELAL8MJ/9Kiax/v4LYd0xvfHzuemOW8G7qyLzXGDsooK690Ggx676qTeEwZ
         sqnykEhyXokF4/kBZuVAakEDkLmjouiQy/Jd3+eZqQbkEmNineaj8NcFFCUH6E6DddiO
         4qwLbhuYBCMwqhqx3WBjiD4ti/N45BPe2Rbyqdr8/MI20EwtijectpXQ0+Sz3ltXfSAT
         Y3Kg==
X-Gm-Message-State: AOJu0YxgZFknfPCKVRuKl+XjORhU/pL8hwJ7AkFDRYFdn7K7QKMZJRvh
	g7x7x2dfoUEvN+JLIQVTVSxbWz6rq1USSGeyEtfwjIShqGkDUBXrAdZtoOKqYJOoxac=
X-Gm-Gg: ASbGncu/B09h0h8gaICrqK+bZAIsoe62BK6hZx3xjYAbgV76bMgmuBPY+AhfH/YqZE3
	QkeYGBsNhev7TxenqYaTdi6k/wJA05SdE0Tc7BlzMv1dINud+J88F62iZe1JXP5EAuPGYguvqPb
	fb6CE8tNXYKQUPWfYKcoCyT0BJdwmtUhVubFCAHis/pdifQAS/peNbk7TWAoOaZrg48naWPD2nd
	CLkqfbSvjUHsFGMJoRwMcN9EBOxw7aQ9gdin/Cz5dff8OB0aJ7V6PrwkNnJoZ7exbc00dC6Sggx
	Fm5Mtm7oXFsUJgmf1zAceuYG0AsAiFAQxBghYyyF4BWsCluN8q6yOnadoR0m9vgihtckHQHr2hU
	MHsiwfh3IASBSSS9GiV1N7FeyFDu0jdbNdWzsOiROO/aiszOZF5lsWbFjnwC+pr73+O2+8PHN
X-Google-Smtp-Source: AGHT+IEfD6GtwrizjSnSJ/vma0lV9Pjo5jtl6uYqaNlzb2Hov9ADryiCCr909jA9XOYjXdKBJYINOw==
X-Received: by 2002:a05:6e02:156c:b0:430:acb1:e785 with SMTP id e9e14a558f8ab-430c5208dacmr295440795ab.6.1761140773944;
        Wed, 22 Oct 2025 06:46:13 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07a8220sm55488655ab.25.2025.10.22.06.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:46:13 -0700 (PDT)
Message-ID: <e5f234a2-ef18-4a54-8436-f23f7490c9e4@kernel.dk>
Date: Wed, 22 Oct 2025 07:46:12 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] io_uring: Fix incorrect ordering of assinments of
 sqe and opcode
To: Colin Ian King <coking@nvidia.com>, Keith Busch <kbusch@kernel.org>,
 io-uring@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022134431.8220-1-coking@nvidia.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251022134431.8220-1-coking@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 7:44 AM, Colin Ian King wrote:
> Currently opcode is being assigned to a dereferenced pointer sqe before
> sqe is being assigned. It appears the order of these two assignments cs
> the wrong way around. Fix this by swapping the order of the assignments.

Fix for this has already been folded in.

-- 
Jens Axboe

