Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B1354AC7
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860737; cv=none; b=kUD3cbG/oiPEUbnnjDuZmT/gq/JFNUhwNLUW6m91PhicSWjGD/ZgFiEfRnEv6TvIeWZBkvmo0B9fb1rSKvAwpSIGeVen5rsn0HAUiEuMOA1pMJr0f/OuBcQoTwuzkUnOE1AO8kYFoR1M+NYR1OLoshQbBhMibvl20EwKd8rMcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860737; c=relaxed/simple;
	bh=kgdLseVwqgNsrnA6mSZdwhzqu3zFgVWNp2vzWnPMKeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBWqP9C0HgzKg5L8VVk3lalKUuuSGgL5TP/Qr4+HMaRcXCkFvw+5qZTKhmPP9YriWCQ99WQafkJhVjDOs5icwshSHSNW4DOQ5P6mvi33Iy7MvBDgCT1ESGYDZhB2PwIMGtRJYXHY5dxm5H64Q5rVu2/oxAoCzUEFyO0QlyzT+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Syy0Jpei; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Syy0Jpei"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46726528f1cso212858b6e.0
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Mar 2026 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773860735; x=1774465535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O9yp9YjA8SKMzZSgAh+Zo3Mazffp8wu/lSnpv1/5u0=;
        b=Syy0JpeirBAc8K2vLGihKuBKR6VXUgsrZr0sd95AS2qFoyaWPoinIlrLtPx7NlUC0x
         sXs9W2PLx1748w0lDF4/GGgNoDqFAkDwV5Y3cqkUEQXhxAIsQS9tL7p3RrwHy9SDE97W
         QdiQyTmeRFoxDH1x96uXr7yANuEbROzeUUVdcM+Pc975d6Meh9P9eDFGR74qYiuzCQMn
         cMn+Fyx7E/kgAIixTOI8SJV0C6CZKXW+5UvmWFA0jV8rH9/WEEVNojovoNsPsjLxxMYd
         oO/jY8BcsnEgj+atDUnBlReTxZC5hiZl3OQYxaGuqY79YE0HMO2iISt4PlCAeFRkPkcm
         JRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860735; x=1774465535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O9yp9YjA8SKMzZSgAh+Zo3Mazffp8wu/lSnpv1/5u0=;
        b=owCQXck5omWPOB8CTXMKLGrS7/xTXV019zWEuPpw4AKLMWZihsu4BvbnbolgqA1o0t
         2ruZTDCq4X90jzo+KytRHTP7bkXmtB+SZOLIQFSx73d+VEFJNttxhbNg8MU8OcTVWS7v
         Wa51pcwpKNaqXxdc4dUC4ZkOKjfEf64RdsNGGkNIbtLT3g91kBI1EnOrdxOyfCbLwRjD
         LyxLzLlCqt3KTcJ7p6yPfLbNT5ck/V3nXqmHaSYZyPK8D1OqaCiCp8nSWkVf5/whmfal
         g6+pZ+4ab+gOqYVxgIntQcr1bP+YzkzUHdUkeS7o+TJ3uimE4PrqxAF7HPSXzOGwR63r
         Omrg==
X-Gm-Message-State: AOJu0Yx5eFmyNLEYKLUJZs/Z+UDK0edrjGO8rkL8eboqdi85b/LJOzQ4
	yvTr8ztUYcgCBXzfPqCnmdqJGZ34N4YtE5HpdvUdVFK7h7dHoJyJaVHIJHyc/Bxwr0I=
X-Gm-Gg: ATEYQzzZ7lrenVXrQW2SrM8n1TWQAmEO9fp37gMKNiebos/4VOjclx7aMsQVC1i6OJV
	L+5jNYsfbiyZPA96OyU3dJ3aaBN6VI+dto/Lg2hxzMRDpfZeYIT7EzHC+PQQXDCfRyqQjELhuIE
	bygbxMpdYdM3Z7hBTNdjbQJMDNKttDbGH+LeqeVl9Jsdme6iPQIF35to3UC9LXuuf2v6GWVBH6M
	ME6/SvvuCMBZ0aEa2td0SkEpLMZGapk4DNnundQSHDGu6HWd7u3xmtMjraxSdAWqTKULpZEkSO/
	BmOjQf+LgDjClLb1D1GJ7k7vKTAf3C88k+P6dnOZH9zC0zcp/hQFOsDYLTT2MtOuFwxrTLjS2ea
	t4ccvVr4QB2nNXd2NWJ9fakinuyPJCIDuKw9humsiYT5avIDoKPbfA/J58IlvErpwIqKJPt29bB
	lO0mFyMCedvqAF4T9+4HFtXlEOejE5r5D9pOTEAW0ScxUKqaEvk+gUy+64MjLn3fm+6fXgMyc7g
	AvT6oHJ
X-Received: by 2002:a05:6808:179d:b0:45e:e07d:4eff with SMTP id 5614622812f47-467ba216488mr2658412b6e.21.1773860734890;
        Wed, 18 Mar 2026 12:05:34 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-467cb465136sm656777b6e.0.2026.03.18.12.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 12:05:33 -0700 (PDT)
Message-ID: <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
Date: Wed, 18 Mar 2026 13:05:32 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
 "receive_peer_dagtag"
To: Colin Ian King <colin.i.king@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260316202549.33978-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/16/26 2:25 PM, Colin Ian King wrote:
> There are a couple of typos in drbd_info and drbd_err messages.
> Fix them.

Doesn't apply against for-next?

-- 
Jens Axboe

