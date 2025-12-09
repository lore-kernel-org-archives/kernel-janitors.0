Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1BC21FF55
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272484; cv=none; b=Q/ek8ckwwhYSgv436ih2BbZzYuWQWc4Hu+pXJc0pnlbDuRyX+fWlntZAV5EG15V9nvB1Zpc1D1jXo4HX4OAfW6RDWlStTFRQ1X0cQb4ep0Ch+c6ERjJCUdhHQZyFosdIKPJ3KftkXaCAmqXoWc4EtiFp0wcRcSKHmn3AJF++i/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272484; c=relaxed/simple;
	bh=kwgclz4dXdz8QcECqcwfxGyt5SPgFbmgqeaP3PoEC1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBEZSJq5CbFzP8bZCd0jv3sLifwMjPB8mc+n2e2w7fIGSJde/mg4eIIxNMEW3yHPbLpdpblE2Wd1XWqiuBtmXC4hpRBQkzucC+YodTiAmkOYZvGkCt4JngqjU59URGdgnh4hrGmQNGu5A/B0XFKQq+vYwR7LUWtGYyzRf3ITcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lGQ/58zi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lGQ/58zi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so46324435e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Dec 2025 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765272479; x=1765877279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R3CUO+zBXmtdsEkHsBoN0U2nlcRNrt25WJX7v9vW9fw=;
        b=lGQ/58zitcHXho4KaD6m2KgHOU7HviS59q7DUsNHHsa+pCjvAAzjN1yNiBu2cJv42z
         DtLXAHp+cIpU5IeCYDE9mfArtBfb3bvsqGavVYHGYJiExJQfv6bJYM0meyAeuQ/yYOkO
         D/JeUBmZa13Uo6jOH5Fw0WCJl6+CKTkkxasp9BLBzF6DIZC8JNse7pswbRNB9PFUjbJA
         8DdvorVioPvphjeL6qhvdn6N1rzjWcxeeR7WJOSln5j5bemk8JOzgu5SvozVMefEHAqh
         6oBmWQHOT5avnGOfQ78Ob9OMGkBzTNPmM3d6nTXaM/JALJHKRrbxm9vNnbNyP0SkHVyX
         iAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272479; x=1765877279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3CUO+zBXmtdsEkHsBoN0U2nlcRNrt25WJX7v9vW9fw=;
        b=Q5TuitGJPT/0noJBlytB2UqRUT1k8see3Ac6EyH9uUQBSSRFPufSAodbD93s3B6yUM
         q/0zYEPJfx4T0ggRcxv6N6iGq+x+EJJ8moEN4LW9dT1wRegh1m55mMW4C1lsSVwRUr1l
         3f9xdTCV3ElALrcLd5d+j5SSAkM9BlnL3/nOHjjiklLGDaEADN367IQJw6+ftmdwUw5E
         rVoGIwYxyUkaWymJx44+04+1SWCf5LrLmsvaxfNhWJJAlLPlzKK961BbJeZG8eZ6lyER
         2DqNr6H5SxYMsyWNSiE5FE2ccyMn157HzXi0L8CB3nOBCadyTr31NVvdF7zmZg3Orrem
         8eGg==
X-Forwarded-Encrypted: i=1; AJvYcCXqGbYYR+0x/zTFbkanNV2ogroA2qLj+uflqkvoXZhXOjeD/LRoKT/W63X4AHg1bIqjpDJCm4di79PmKX2XCcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHop96xPeOIdPWQsF5or3HdU0qyGPJH+jyU/HFAJH3vjFIXQe
	nnimHpwjMd3v68MQbe+Zd3WditC5qDYvUiXVFR5wlopM3Yq6h/mLjbJzEGy3IPPfbXg=
X-Gm-Gg: ASbGncv9Q/MI1e/AfcraJ3lNf6fG3GcgaBRt7V/Fys73ouhR4xj/2T807oNJBJQTHBs
	pm5DiAHTwc1QLmz9YhKn0dqW6Z8oI7p4w8tuzB26LTMh9ZxascbhHt0A67kyBgqsAnXPlgmRbOh
	hNktu0LxUsvWxDvsqU58y2EgnuqRMpKYlPngUip/3Csdfym1FaT4W6t/VVIXtNbL3X/68AGQAoa
	bIOQaLYayjA6mCmObRsc5DW2nr/w2/DA8qY2nofZ8og6OsMBzJdx5JiPqQPrcaQPBYxLlp24u/H
	J6tsJJWyj7PVTgsSQEvjCejJBlj4qimr0c2DE29NiKrYmMNI8mrJYarytmOLxUMf5r+FsSjOoxs
	ynu4AXku9Hp2bI5OjLrf9l2Uh5QrzE4fAx/u8bY0JWIthCW9KflKcSvzGUxhppNodgET/G3gHqN
	ekq6aWtPNkFsyvLIvezWo=
X-Google-Smtp-Source: AGHT+IGU65rxEAITpH754auEUsEUpkQYQjZXXF4Pby3Lcu0cneSAD5FbIv9NJfGhM0XDP2w3AdsviA==
X-Received: by 2002:a05:600c:3593:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47939df83e0mr107183285e9.12.1765272479234;
        Tue, 09 Dec 2025 01:27:59 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da084fasm12009025e9.8.2025.12.09.01.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 01:27:58 -0800 (PST)
Message-ID: <b0c8616b-24ec-4da0-abe7-4514069c1679@tuxon.dev>
Date: Tue, 9 Dec 2025 11:27:57 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/mchp-eic: Fix error code in
 mchp_eic_domain_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aTfHmOz6IBpTIPU5@stanley.mountain>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <aTfHmOz6IBpTIPU5@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/25 08:54, Dan Carpenter wrote:
> If the irq_domain_translate_twocell() function sets "hwirq" to >=
> MCHP_EIC_NIRQ (2) then it would result in an out of bounds access.
> The code here checks for invalid values, but doesn't set the error
> code.  Return -EINVAL in that case, instead of returning success.
> 
> Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

