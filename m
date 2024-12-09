Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88EA155751
	for <kernel-janitors@vger.kernel.org>; Mon,  9 Dec 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733729870; cv=none; b=KOFGl/Pr8alCXAVEIdExXoBG6MKIK+H8gyoF5vQ6sWOqLOl8sYk06sZKiLrfsnJ0Cd7R5ffowxrlPTAb5dh40XgmQjaHO5VPIXAvoHIy9mDjyB2feuyQvWdEwXcTvSxSKZm+uDk0q6DpPMOoi9B17Z9taABKSfL5kahL7mT5OaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733729870; c=relaxed/simple;
	bh=wS4LPcc/u+NnlnkZkGYnfx6MpJK7FoHRFQxSj4AUpgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrQzZhIlw9a/QxaPfnekh1LZFjW2inByQENVEoRSes96n176Wa646qs/3TH72hc9tfmoE1bmMnB6S1YiNp5YGm6vS6POcfQCsNxHN5/++OH7qkXdYVbllbc4rBuqz/BnCR4SpYOzbIkEmE6av0+5wtXXFu3rHBg7RM3ZreuGODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/wKqAAe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/wKqAAe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434e84b65e7so18383415e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Dec 2024 23:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733729867; x=1734334667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=95zALzZ9C1moiqNGj+0dTUHzbbBeCCJ9ZsiPoJT1Hrc=;
        b=d/wKqAAeN7K4Z9v7nmHNeE0UQ1zk0qnEqNUXzTMwc0fuFme9Jj0c6cvd1a4fmhlnT8
         as/q6mcWpGmS2drSCgX+NZOTb0eO/u+kNzalpCUWOyhIViwzEMufcRhygNfDMF6ajklP
         SIk+tpMoiLZ0X4RvV0VZrtq9G5mSZQQzf4UYyGQwwzTNGgL2UUZt+BLgdtyK2dC7aCx4
         VY2N+y5a9PPtZbjcH4O9vexdyNawWE2JFzeMcWPZsyJ3e5Vd11kwYg+3zWBnM6jocDVz
         8NbLG0Kstm421gS92t5clELmf+rGMOIKAswAtx3ihdkz2DqyRxaBDAqg7/hGILIp5RTc
         ulIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733729867; x=1734334667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95zALzZ9C1moiqNGj+0dTUHzbbBeCCJ9ZsiPoJT1Hrc=;
        b=PkLkbNqMfedIIZ7VCoyWX9p5ioyUvO5Ni6jVAWI/JTFAGiysrn8AIaaUW1UFavRUkd
         jQ2pvW5q6vZO+M7B/aD0u+DDE6XHAXLLXGKLkFRFtQ9wGRpK03N55H2sVxL4ff7CZXo/
         ylGUyk6DVjKS97IUd9ZBcYUUpgINqTPpGgck6leSpgWwaRONXUq6Htr0Azb+lbD85Yf0
         jAuKOopujPvtmjF6oDoO6ThS1WpSauXMugobeCTMYO5/oz8WkU9tIiX23TA7jJHqKfoD
         kyGBWmTH0XqBhXTXwbP5PVfzp4TsumMDO5CDEKqp3/zE98R9o93Tuera2neTkS1eZcdq
         DTlw==
X-Forwarded-Encrypted: i=1; AJvYcCVg07NKDv7yP6RS1RvYdj+deJbgFQPeYAWSgVTfT/ERIt1vfcinIIm+bcGiIYkeMLMJa1t8BT3z+NRyFzBeseo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx19Dm6N73ucY4ENT97VTVMM9dmivoF/WAgs0W/SvkMXIkUkgc
	ebDWbAwjdGRpE31lsktilt5ywEG0M/qqjsqILBNSvrJBVULohjMeEq4cWIN32cM=
X-Gm-Gg: ASbGncvGWYWY7BJEk1v7p+RxiqlzkqrZNp/kS+GqJQn8n5oeeU78ZZX7kEiOBXfZjw1
	IIWVJrz/u6qU3ljErYMTGXckMLCRTWh814HNiJJOCuOEVk0HjrPRH/spxC+fxS9+YRbRwIwA5+s
	aOf4diQP9Wfntg5F3Bi4cxZ+id2X4eAE1icMO4ata2u1Hb4JcXZZdb2dJcygAwmk0prQNGayqIY
	+UPsHQ7JXUpQS5+RJIT6Q4+KK6s5aEJ5B+yeMsV6QpTzrsCjyS492E=
X-Google-Smtp-Source: AGHT+IENr6dXfV5Cj+7nBYzPXMOegzBfhEhe3lfd7H0VOqbFt4Ej3IU9BHMTxGGVa/FF5Ki/41qtuQ==
X-Received: by 2002:a05:600c:3ca3:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-434ddecb0f7mr84483155e9.23.1733729858220;
        Sun, 08 Dec 2024 23:37:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f7ec35b0sm25804105e9.1.2024.12.08.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:37:37 -0800 (PST)
Date: Mon, 9 Dec 2024 10:37:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <0bc9812c-135a-49b8-aed8-67ee4e3d6d6d@stanley.mountain>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
 <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
 <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
 <fabbceb3-90a3-2cc8-c664-e53fcd504393@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fabbceb3-90a3-2cc8-c664-e53fcd504393@huawei.com>

On Mon, Dec 09, 2024 at 02:27:58PM +0800, Zhihao Cheng wrote:
> 在 2024/12/8 1:05, Dan Carpenter 写道:
> > On Sat, Dec 07, 2024 at 12:17:33PM +0800, Zhihao Cheng wrote:
> > > 在 2024/12/7 4:26, Dan Carpenter 写道:
> > > > The "req.start" and "req.len" variables are u64 values that come from the
> > > > user at the start of the function.  We mask away the high 32 bits of
> > > > "req.len" so that's capped at U32_MAX but the "req.start" variable can go
> > > > up to U64_MAX.
> > > > 
> > > > Use check_add_overflow() to fix this bug.
> > > > 
> > > > Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
> > > 
> > > Hi, Dan. Why this fix tag? I think the adding result('req.start' and
> > > 'req.len') could be overflow too before this commit.
> > > 
> > 
> > I've looked at this again, and I still don't see the bug before the
> > commit.  Secondly, commit a1eda864c04c ("mtdchar: prevent integer
> > overflow in a safety check") is missing a Fixes tag but the message says
> > that it's this commit which introduced the bug.
> 
> Ah, I see. There is not an addition operation for 'req.start' and 'req.len'
> until commit 6420ac0af95d("mtdchar: prevent unbounded allocation in MEMWRITE
> ioctl") and 095bb6e44eb1("mtdchar: add MEMREAD ioctl"), so I guess the there
> should be two fix tags?

Ah, sure.  I can tag both those commits.

regards,
dan carpenter

