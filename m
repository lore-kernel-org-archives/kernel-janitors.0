Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23817A935
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2024 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726482525; cv=none; b=BVZuzW8R5li/CaQGqsSJNjYVmwTxLfL6sra2addPmZWhHJJRFHUtpYvzuoW8TQpr8bdL+WL1p9FmZBDv6BmqPN11vOJrFxpMsgm5Y/Qe3BiWZQvCFO2pmA0PQ8LeG+MFflhkDNV+t6qbApWqi7VP4yyjIZ/Z+oV+k1wdx01MKqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726482525; c=relaxed/simple;
	bh=pDqst7knH5b5b0N7PwG3+xglcT7PeB2fKqtQhBtecIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NH602Xa5FUl1G2uXu1kB1c6WuRu1gCD2vjD5qAMeNZAS8wJTSg4ZhjqVaKCn95lkYaa3beHOKB+51BtUTvVmx2/Cj0GayHMKdTNLFYqipzE1wuyHbzVnb5hPeBJrJxgqRloRF5o+fC/8zcquB0Wl9xIrzBghuGeYEwcm4/raKT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCM5zITX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCM5zITX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c61ea33bso344349f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Sep 2024 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726482522; x=1727087322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FrvXr7mWJZPmRuY1IQsR2n0NYi0A8ps+cVaZEBwchh0=;
        b=cCM5zITXYiNsd/Q4eDMrU6Lrt1vvrNkuoj7rfC+HtkbvuD8tjiUg1mng673U7TOCx+
         5oaghDjBp79eOhZbhfzzDi23ke9v8R6sQsQLFuTOR6uJFRj26d7AwqazPts870N+m1eQ
         KcSO7WCbqN/u2+wxGWAOxt+3LTWfRqUo4EbdjznXI1YQgkpP9Y2F1ehX5l8s10vmUyoa
         4jrkAJzxqLtXuP6wwae8RbKIbZlOh3qsobyySHFwQ9ZzvrtdoQsiIUM+zbAC83YTOAtp
         p3jhBQ/Wp94o4yWOggecrE24+5w1ZkcCO1uXkUlNiuJgnGTjlHe6SXTa4LFeRqaSFzR3
         SBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726482522; x=1727087322;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrvXr7mWJZPmRuY1IQsR2n0NYi0A8ps+cVaZEBwchh0=;
        b=irMqugzG2TqUbLMyk0ypE6VOPDJCPVkR+57YpYFItM9Qh92zhjmUUkDZ5nd3m3qFzR
         o9j5qrssoWwSEG6n0QMDYSFviF5T6MFAEziWvxI81DEL361FzegaaMCern7aAFyVjKfM
         lI4tMmNNNqou3bgX+HFt8u6f6womUw7r3rdZ0gAvC+nat9+SKu5LUmguEad9HTQlytuF
         PIFF08t7fh0Y1Sbys2MPSMYNoSV0fzIh90Wybv8NLuxX7UxL6GGnw7TDjeOvi7Tv5KIp
         3zoXWeRIn2IKKAjaS4p7y0LvtmwPBr4cBbL2XjMa6MTVjJlXt1jQ4BH8xu2K87Wa9ptz
         HQkA==
X-Forwarded-Encrypted: i=1; AJvYcCXk3GDy4YVRG8cLJSkhTKYyRH+alY3ZXxGhDSGyxDnHChgPAlbRew5ZC0uTXC8qTySyuf1caylid4sFkmDWkc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2XS7HigKdrYfnqIeBcAnFUhh+H9fyqYTPS+2NnexgDAaDa+BI
	osYh6L3tK70rDz6sgQC8I1geLL14w/2Soe4G4lZIhD/QM8xfUekEE4SyCazRSes=
X-Google-Smtp-Source: AGHT+IGh3WqVzNod+W9x5au2z3vMgPIWUCC/Vm1m+KWMKba5DtDy1+nj2sJBydGEfOc5xZFR8D4lPw==
X-Received: by 2002:a05:6000:402a:b0:378:955f:cc09 with SMTP id ffacd0b85a97d-378c2d5f6d9mr4080119f8f.11.1726482521780;
        Mon, 16 Sep 2024 03:28:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7804483sm6785972f8f.92.2024.09.16.03.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 03:28:41 -0700 (PDT)
Message-ID: <8b99ac02-fc68-4797-94c1-c9b1ecb8ea62@linaro.org>
Date: Mon, 16 Sep 2024 12:28:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: rtk: Clean up error code in
 __get_dwc3_maximum_speed()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <865e56dc-37cc-47b1-8d35-9047ecb1984a@stanley.mountain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <865e56dc-37cc-47b1-8d35-9047ecb1984a@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 10:54, Dan Carpenter wrote:
> The __get_dwc3_maximum_speed() function returns an enum type which, in
> this context here, is basically unsigned int.  On error cases, it's
> supposed to return USB_SPEED_UNKNOWN, but it was accidentally changed to
> return negative error codes in commit f93e96c544ca ("usb: dwc3: rtk: use
> scoped device node handling to simplify error paths").
> 
> There is only one caller and because of the way that the types work out,
> returning negative error codes is not a problem.  They will be treated
> as greater than USB_SPEED_HIGH and ignored as invalid.  So this patch
> does not affect run time behavior, it's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Fixes: f93e96c544ca ("usb: dwc3: rtk: use scoped device node handling to simplify error paths")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof

