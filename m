Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5384B7464;
	Tue, 24 Dec 2024 01:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735005239; cv=none; b=dYh4IFeIP2or0KPK50uBJeeMiCZj/JnnY0osiSTkpRoCfoC3B5GuPiJR/s7jTXYLsRuQnMtCCI5LcthnYiX7NXqZ/F057nQoDr+6W4vznBu4LK/EGXPoWbl/U4G1NZALe8NbnrdFczpj8+cx2QKs+5Ea0+YkL3DzgG56r0U/F9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735005239; c=relaxed/simple;
	bh=VnwcLPXzqphwAru4vXuUQ50A0B78VxkwzhAKqzuZEv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duzSbIfObMDJJRobmEQzydLwaavL28/oMFJQYbG9gQq03A0FSb9qkurh7iHeHEjP+mJ1zTHExkIJuuu3Q2DaX5XVlRLII5o+a5O2Gx0KpQiNnvysqPVxZDsHYlQkMwa0v1WX+8EKQ5rr8oxT8iEeQf+xp2acnvue3wJaXqWERR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS4DyRWR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS4DyRWR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216401de828so43589625ad.3;
        Mon, 23 Dec 2024 17:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735005237; x=1735610037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oC8GYDukRinZpuoEEk5zn8i64A3XW6v21GLGztLKYa4=;
        b=OS4DyRWRnAmmfbB23WWO3Llm3bW3/AjO/XccC0gXrX6ryS1kWBcdzCgyEE5tE6uPkt
         n6a/bH967YY4VyaQrvCEL2fby60PRpQBEeQ01ClGvvYE2EUNGo/cyRCjdiGS8yczTl8M
         6rBCnYr9GCK96wmWnuoGnZtxpISPH5C9zNSWDaPdZcaBsxUZCuup8lN7GC12Vvx58UGp
         Ktin8YFomFkF6gHyAbXcewket5UGxwrEfh2zPcHg0o7ZLHAD6O4Eprwpe7wZ22ZATEE2
         jUfsYCdt3BlQjNYzDl3TZf8soEwGG1J2yf11+drw9KYRI14T28ACZ+pkKqE7R4Fcmo1b
         +LEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735005237; x=1735610037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oC8GYDukRinZpuoEEk5zn8i64A3XW6v21GLGztLKYa4=;
        b=ukOahyzSFdxGaT3ZIJAo//AmNU4BF3xNFttPqpi/T1TAkhWeNrsOlbuNCJEgvqq73b
         UGeVBtAZCxoPY49OUBhiTrYNLrHIIbyh00IMlnJsvjw89o2niMIZtuPeZB9FetIISK/m
         ot9/EgC4ByL3oHTVnk0GeK3A5+Nfnljaltjwls2JAzVRiAJRcdZgLRtRrbb4EHhMpySF
         Db3kHKW++FquEBkuuvGLCjNPvdURa9kPIr/XC9Zm0gCzoD1WwQY4UhgVEC7dYVFCOZ4Y
         2HCabuRa0Z4iwrj5ZJbQ1Hkc1/UN6mIgoB9iGW7Rapq6EChbYdInwztCzivI64EZrDhi
         COJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJYfNYKuhV3/L6dZMwoH04H4oOcZKNZx2Uf0H0eYARCr34rdMMvIDlUUk4m3LsnYL3w7llvjI/rq/ezuB/4P4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfA4qPk8EQj+9MXdh322ZZ6D55xwfh/Dj6uxl8OCRZIpeCmNka
	OlhpC6xLN1WifvQ8RWnXbn0mUczLVQHkaU2XcTW+7ZofbGewc8AKdadBGw==
X-Gm-Gg: ASbGncuywbStk7A3bryhrYn3m64fJtgprrcKZ6k+tSWaJ42iXdjH0feT4oO+7HFyzzN
	wPhrATB8DAA9xAbCRTprtLTn2rEz2JjTHClAZRKB0IF5EkhcBi/g9f/hZFn1u6+0LELGTwbYng0
	/kLeAZIQRkgnRnV72D6ZyMPFpBY6JgXjP3RgDfS6/tJrXW4V/rUBEYjX5zCrFFTmfhJNlMdu+2S
	vdavLvmRYfIXxJ3nkIvPIDltycMdPyMbK807y1zcVaDOp+XTfXyyaVI4NylFLCDyhZbz2/THKah
	7g==
X-Google-Smtp-Source: AGHT+IFvID5nwcfm6cCE92DCDypKQpsKIvCswMYrxS04bcrP1v/ydx9K7UDHMR/ubdPyyNsEcj+7Hw==
X-Received: by 2002:a17:902:dac6:b0:216:2426:7666 with SMTP id d9443c01a7336-219e6e89559mr184496045ad.12.1735005237434;
        Mon, 23 Dec 2024 17:53:57 -0800 (PST)
Received: from [10.125.112.12] ([103.165.80.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0194bsm80186515ad.248.2024.12.23.17.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 17:53:57 -0800 (PST)
Message-ID: <2cfea522-8015-d86b-f78d-a6a2c56ba8b8@gmail.com>
Date: Tue, 24 Dec 2024 09:53:48 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2] sched/core: Prioritize migrating eligible tasks in
 sched_balance_rq()
To: Markus Elfring <Markus.Elfring@web.de>, Hao Jia <jiahao1@lixiang.com>,
 kernel-janitors@vger.kernel.org, Ben Segall <bsegall@google.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>
References: <20241223091446.90208-1-jiahao.kernel@gmail.com>
 <d983b931-b623-4af4-ac87-3807a86d1f87@web.de>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <d983b931-b623-4af4-ac87-3807a86d1f87@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/12/24 04:50, Markus Elfring wrote:
> …
>> All of the benchmarks are done inside a normal cpu cgroup in a
>> clean environment with cpu turbo disabled, and test machine is:
> …
>                           CPU?
Thanks for your review, will fix it.

> 
> You may occasionally put more than 63 characters into text lines
> of such a change description.

I checked the patch using ./scripts/checkpatch.pl before sending it, and 
found no warnings or errors. The commit log should preferably have less 
than 75 characters per line. If I'm wrong, please correct me, thank you.

Thanks,
Hao

