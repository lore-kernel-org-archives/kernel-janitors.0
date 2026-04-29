Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DB3B19A6
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476434; cv=none; b=VhA6SU1dPlayKtcexxApCF0KaWUgVePQ08AWxUG4VAF+yxxNs/CQ3dY2wZ5zpnES65Enrqxno6VMWVKcg1BOHanc1q7J8RLnoWbLuvZhbe0lIvcBlEQ/8K39npqSgzVmus4x2bB73obHxzAZNALigRAkt6uotO9/CLlFfdryRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476434; c=relaxed/simple;
	bh=yH3lOS+okcN9lX37K1yKCibq1O8XsuGDUh7KdJIH8tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnMek042P5N9hrWIml6KyxE42svqr9JObMI/sdfrkI8wq7BRyuETUwaTLAj9ytS/kRS+Y/PsxykAfvNivDvNCqQCizl7gzF+UbPKWgAzsyWJlo3dTRYNNPCrM3v6AWrBdzS4cvqTgS+vT3BrWkkaoHvUFuhBY1Lm+qNv0zbyf78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcbpjvF1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcbpjvF1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so74963965e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476429; x=1778081229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y561SdX4ufl2HV+PYvdTDx/yIZUsaqz/jgiYxdaXm/o=;
        b=hcbpjvF1LXMrEmHY7DtpTG/UDFIuRn3vIJS6pKYwLFqRaoQFM+NczeJvj9E3oKg10Q
         hn8UWwqknWgirRpoT9KibsSdFGimSLdFboMKNAd+emW3d1zim41oi5XRyHFbGIvoO7RZ
         SwkkO0tWhUxjabe47kzMaWXXlCJlqJiLwSfsiMKjiswMZkNazhL6do3B+vNReAyrhbAT
         fv+NkKS0fcEl47q0lCp2OZgT7H1wB4E3Ynf+b/kSr+JE17PZRZasOl6uaGdkMciRO01X
         52qAxecgBJf/qk5mHNixc1f9oylt4pH9Idhdzq8houX7EQYzCBrY8uUOdYr6uDGOmnZ2
         cNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476429; x=1778081229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y561SdX4ufl2HV+PYvdTDx/yIZUsaqz/jgiYxdaXm/o=;
        b=MA/+LAGxdUz2F2qwIqQVvLKZlhxK304KVy+a8f+aJKEP8fDvSkruefM/bLZHih/ikZ
         yo3srYx59YCA0xVjWURiWPY/RU/6RAUer7/UAA5xZfJXfXQsJokcCiYozKAfUDvA8aYi
         nqSOOKzatnpRbxMuE1rNH9MxBYht8QLpS9a5WxkcGgiuWyZnRGBakvbPwlXgB5WDXRa5
         MoJxE+5FweDpL9Io9kDqMjwNEVNYjKvnhpVQtEyIJAZZQd1Fd4f5yNcvs9HLCmgUgEBF
         kPL61VTehg7cu8UVuyzetw1AgXQx35AtJWPDLqzZIxtNDMSOtTnJyobGqKXXSDksCSrC
         CUqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pGT9Fw3hJg18B0xhRWaZZii/ELYNtfKMQGASUmap8SGcm7xnLZxD/v/e4EzKu5xhH4K7B9BaUOsOO//un/ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGehVMzyANZtEO5dv/850vNeEgNPKBboOgTSScujWRoqkj8nPG
	0EeHGg2vb2hAeIRQEBpLQHfsHuY2XRLszy3NKFxFrt5v4aoBl39ZsR1z
X-Gm-Gg: AeBDievnrvZCLi/pmbbq5QiH5P/pjfL4cMUhR2nYAlccA8ITDnIeaikTE9ryjFRYzZM
	SkcjW55EmY54xRuFdJp4Xiu7rEmAV8Zqp+SLeVWkQ7TCMQMS6XCvVSNu+ZI9vMsqdcenKLHGPQ6
	fon8DSVL+sXtbYmQO057BeIOuqxxJGkyDkW4WTAmxPTbWKmTO+ospVfCleyW3PKTRjk/dnNBkSe
	tTdmzLclznJGbLtCZvPqg6RncqpMNINF1VxbtqBEKHvTlHsWPdsYAGZmUgl8tXO+fcOpg2kUZ7O
	xMj+8CyJ/rF1RkgQKbxsA+gr02uz7F87TA5sxe81cNb/wLftReKMsQRiqBPCvF+YolBW+iRDSCU
	xlWd3lI2w//iSajXgE2Ew+m4raA4C5hWguQUge7li9ROhCZ9TLyT5i0PH97gYNAIZWwsrGGqsRg
	1FjoJKj3GH+dRyqQoWLpQ7dssVO6l9YBmSKb74zbQmo3SztXnFwgDCABQWolo1plIYzPPzWyMKU
	Xzk3ntQ5oRS1Xd0lsfjr3HK
X-Received: by 2002:a05:600c:4713:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48a77aed429mr128781245e9.12.1777476429200;
        Wed, 29 Apr 2026 08:27:09 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c584607sm60074975e9.8.2026.04.29.08.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:27:08 -0700 (PDT)
Message-ID: <b99eac30-ec61-4b33-9517-3cc2af0cb12b@gmail.com>
Date: Wed, 29 Apr 2026 16:27:07 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net] sfc: fix error code in
 efx_devlink_info_running_versions()
To: Dan Carpenter <error27@gmail.com>,
 Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <afGpsbLRHL4_H0KS@stanley.mountain>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <afGpsbLRHL4_H0KS@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2026 07:48, Dan Carpenter wrote:
> Return -EIO if efx_mcdi_rpc() doesn't return enough space.
> 
> Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Edward Cree <ecree.xilinx@gmail.com>
