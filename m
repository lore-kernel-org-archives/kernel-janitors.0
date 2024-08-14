Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116028DC3
	for <kernel-janitors@vger.kernel.org>; Wed, 14 Aug 2024 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650428; cv=none; b=CnFNC/MSrH62mRWIzGl3vOnuAKpnKj7oTHu8JZDWMLZ+iTSjTQ37txh4tzzbvC5BJ34g1neSV71ByfbBSpWEtASM+CzNrd4ToPyAg49O6wmx7emvcz5pyGzCD7L0VAoIbQTGYkRgMP4/cnEP4Rj+Mcp9bk2eMA7HaCHBhUqMoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650428; c=relaxed/simple;
	bh=6s2UZiIbIL+xs+ThX4zHMsNr9MWrd6Lm3gZ9jqqawDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuyo8OiGVN1jkDz59kAbqTSdzuis98jKO+DtAnmRDPt2mwJXGFgQK+nIYjPa6BpVsgEX5MQD64+QP5hfMvO/ZFFDfEHkOLNcfBjoPMyaAqMQrQ92lpf3gPzEx6bP52ErNzD3eb/IkLQXJ89dxnsrr1ES52da4ICk4N6kIIQ3GnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJrBP9ra; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJrBP9ra"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42816ca782dso51984275e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Aug 2024 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723650425; x=1724255225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxHKY8j9JY9GSssq+v7MBgIA0lHkRpEmbrmi0vFachA=;
        b=VJrBP9ra2mHREB30p6Ha5hk6E6iqh0Tk/tK1f7PxaujenUMN3aVDRKQkW2xWtojVKE
         VJImKgzByA5ZQPZTR14/s4r7+05i7UBotqcM4YVduVzF7Qz6ntnuzI1MuhgqPq6k5PlC
         omhh13mxOrfFHrBlPUelAmCHl/Tv472HK2v9oY7ihLQZyBeWJl/ji9r446lVWNk8mvyH
         t5G+XGoo7iCU9q6pb46bVxX4K9R6mHgHdzsOTXiEyPzfFwuT+RN3CSf9rTv+5AlbwyaL
         u00pKmRmJD4kYUhv18BYN/DYgLPWizKuYBYJIfuq7aA7u1rdNXMeas8AesrKuKe2AyW8
         TTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650425; x=1724255225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxHKY8j9JY9GSssq+v7MBgIA0lHkRpEmbrmi0vFachA=;
        b=ohLGbMQOBnHU0yqohyLXIBLbqzMTQnpZI0ArR8W4Rua0qN7+qQnKwG+woXkrB73j7g
         1aY/EL2kXeqwCBdpFkSqHxWNU6bkbJgv5iX9V2Fj2rLGOa+X0H8NqGkGHuAQ1nBmqPNq
         Q3IAmsqC0JYLxETYV8hvq9CBZxrb7wxBLMNgRx/p++bFccBFpEzbBJNjVWrJ8VQZxfgJ
         CGrH7H2uHdwpKY+BvOrWFEB6IUQDopouiIRQsMSAOH6a2Mffl9ZLaT1GHkdvRTwZUxzz
         l4yr3jjCuGXTrHPwzh1oM2/qm13JCpYPwpP0reFCpT/xNG1cqYNE74BLVR73D8/ZcJJ7
         jXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOosNzKx2IJuN05SA4P7EygCALn6yx5b8b7fouPwPcJGsGJ8yW0J1wE9pljBVW70UOhntpdKv34pjytl0C2V9d9KfI+iMzHZPzwo6f81pM
X-Gm-Message-State: AOJu0Yz4mgxhXhUCAaxCTdk5d79Pxhyceb1wihA0G6TxLLUrLmblScsZ
	IFEszX368cYBO9FZm/vtMcguvgW+JDuB9166wXzriztU6M69pftH687ClgObbHs=
X-Google-Smtp-Source: AGHT+IFJ7TTrqW106H8grxaPaM4TrNtxNgYAZzlQEAw+ii2wjX4qbf7zwRvdMCxwyRkjkZNGpv+B0w==
X-Received: by 2002:a05:600c:1d06:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-429dd22ecb1mr20690655e9.3.1723650425302;
        Wed, 14 Aug 2024 08:47:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded36f55sm23611115e9.26.2024.08.14.08.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:47:05 -0700 (PDT)
Date: Wed, 14 Aug 2024 18:47:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Enno Onneken <ennoonneken@outlook.de>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] reboot: add missing break to switch statement for
 LINUX_REBOOT_CMD_HALT
Message-ID: <750452a3-ac8a-4af5-849f-3db83158a1e5@stanley.mountain>
References: <FRZP193MB2563F43FFC350926C0B7EEB1DC872@FRZP193MB2563.EURP193.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FRZP193MB2563F43FFC350926C0B7EEB1DC872@FRZP193MB2563.EURP193.PROD.OUTLOOK.COM>

On Wed, Aug 14, 2024 at 04:24:45PM +0200, Enno Onneken wrote:
> All switch-cases should be isolated from each other due to shutting
> down/rebooting the kernel in different ways.
> In order to fully isolate this case (like all the others are), this patch
> adds a "break;" after do_exit(0); .

This patch is obviously harmless but the commit message is not clear what the
motivation is.  "missing break" in the subject is misleading.

do_exit() is annotated as a __noreturn function so it's already "fully
isolated".  It sounds like you are using a tool which doesn't understand the
no return attributes.  Better to fix that instead.

> 
> Fixes: 15d94b82565e ("reboot: move shutdown/reboot related functions to kernel/reboot.c")

This isn't a bugfix so a Fixes tag isn't appropriate.

regards,
dan carpenter

