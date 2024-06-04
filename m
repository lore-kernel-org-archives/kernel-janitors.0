Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B9148305
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717508331; cv=none; b=WKYAStOtmjqQ5QwFAjRGtEXfjZqD14RlE7RllfEKn/6H4/YCSZZe8WD7fKhTnPJBamBrdLMuJgsBdmPVOR7Pp2u8LXP8FyB2yspO16uhK1ja7+vesbA7cZ4OSpvwhKPRlv2l8xJSJB6znwdlx0FpxkmqqpHmybWbMA0eMi0GnaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717508331; c=relaxed/simple;
	bh=mLOB/pRDSaqep4kaNRLrvlUmHU00bgxlnVyjfSPtsEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s/H/rEoZMhi1Mp0n0NYINituM2hR5OAqOXX4NzWaoBh92s/8hWsLHhLf+r9zV4gZJ4wZ6JNjpM/80kkdyzzv6/F3yr4tQhFI5zuzpfezOzmWbmvmSyh/iL50eR6Yr/UV7pRO+TlvCmeDHA1BJxeM/PNclzxJPR7jW1c5ItouoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IyewzNbo; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IyewzNbo"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6c2d04b0833so493157a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1717508329; x=1718113129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyXYBZ9yf/+pq+sDdhkihpXpTq6hpcaT1psfHyvcipQ=;
        b=IyewzNboMpcwW5LFMTFxdY4SQ1KG2Q+U6IGwJlTrzALJKOjw/JKNzXkiCnHi9jmS9J
         eOlFQY+innZPCcgj56KeD6Az2gAsr9khEuktItMjqTjCRV0HOlA6LHK4FvKE/kX8GcaN
         DjJ9HDIVl8c4etQ9mDDS2tOBKmVH0urcEJpp/3efMCMSOxLuZMhIkB1DfHdu+uw22hpW
         5r2jONIgP0E/l8reAXvD6z0NHJxrdyqtHJ9b+mxD/cqRS19VEvzmXG/vkkxwS+ZK3Rn9
         XtkJdIPfHqxbjDZZKvn1RBhJPJVym5TWFFAn+1koXb3jqScMupOOk5lhSMtnDGcXhJYT
         FMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717508329; x=1718113129;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyXYBZ9yf/+pq+sDdhkihpXpTq6hpcaT1psfHyvcipQ=;
        b=AWy9Is4rojUwot/5TIwVT5eB1JgNKw2eonWzTGuXAliF99jfw0NTm31ehinSMc/lvH
         wZ3qHl3PEqn1VenbgXnerBFBaORUCfG9BEcfzxcOgP7shBS5keJ7oraFRQI5rwhllNMA
         x7a+LAZwghjnyo1dUcMLXMiH4b3X69OG6MmvP3icntDFibDOzrr7CMrmFi3YTjzZidub
         cYUGF/pvUS4jSJj4/py0u+kHTk+0XM1MfTltUHkyHa/1e7JzonJIbX/fYlH6MAolgG5u
         rwoHRqF3jDCz7PzayYoS89nESoPA7E0Nz0tX435Sz0VIqjQlMqf3lzKlhEq5cXSvjlak
         JgCw==
X-Forwarded-Encrypted: i=1; AJvYcCVy/odF/qmsLcsPuduZS0tfaZN2vKGN0y0VZHFO/lLKWXFdyzuKLumSIjc6vwz2a3FUi82EPoCsmUejMXB3rWtBoBdFha8h1EEA5/2VzrVH
X-Gm-Message-State: AOJu0YxWByiaI+63AOkQAe+VvJm2hAiE0c5vdv8ysdLhKy2VMDOWJdl0
	nteeznylXQloqhY0yFqssZ6/eh17QnUeyyV/M0lFQacK0UmqwAG9YwPHIe4jVwI=
X-Google-Smtp-Source: AGHT+IGgE1PUAohyvsVgmtFENCcomUvJIkWVXPFd7SdjzctUJnwKJA25eUqbhTVsMlgms0m7bEff7Q==
X-Received: by 2002:a05:6a21:338f:b0:1b2:53c5:9e67 with SMTP id adf61e73a8af0-1b2a46feafemr2610730637.4.1717508329280;
        Tue, 04 Jun 2024 06:38:49 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77bab23sm10440745a91.48.2024.06.04.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:38:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, Su Hui <suhui@nfschina.com>
Cc: haoxu@linux.alibaba.com, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604121242.2661244-1-suhui@nfschina.com>
References: <20240604121242.2661244-1-suhui@nfschina.com>
Subject: Re: [PATCH] io_uring/io-wq: avoid garbge value of 'match' in
 io_wq_enqueue()
Message-Id: <171750832792.373240.8767021460699358833.b4-ty@kernel.dk>
Date: Tue, 04 Jun 2024 07:38:47 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Tue, 04 Jun 2024 20:12:43 +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> o_uring/io-wq.c:line 1051, column 3
> The expression is an uninitialized value. The computed value will
> also be garbage.
> 
> 'match.nr_pending' is used in io_acct_cancel_pending_work(), but it is
> not initialized. Change the order of assignment for 'match' to fix
> this problem.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: avoid garbge value of 'match' in io_wq_enqueue()
      commit: e87863ed45a1c36b0d8a5b70134caf8c794d8d57

Best regards,
-- 
Jens Axboe



