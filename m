Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505805228
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Mar 2024 17:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313808; cv=none; b=JLPOi/JabHXrCZcv+q8pvjUfIKQbrkEX2bYhQWW4ToSwoK44fRGXy5gWEygOF+stMwjcosumiTsHZNgxb8257h7hG/XM4swvYB4NzdQYU4phr/SQVjM0IDCNo7pnR/0Yksy9LlPV18+P/bEitgb86yvW5RcPTyLjZo3JE9YNNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313808; c=relaxed/simple;
	bh=ZB41xxYjV5A+nWYJEkfqZuC83VuREIATmp7V3mKC6cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0KfFkvzzHSgPY1cFX8VTg3mwmamSiAW5ZwDe/5j3xWXZieXyVbxWG21v8Hp63AKsNA0Lb0UbAZvYYwZo5seQLRasnX3mT6TCIiZM7BV1mMKFGp5PTl4WJAJa2Gbkds9eeQiBJBpFtPm/5vMZvvpHC09+vwQCaMNgq10HWEbn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LOsV90QX; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LOsV90QX"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5fc05784c60so3039987b3.0
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Mar 2024 09:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1709313805; x=1709918605; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GesJ1JUX6AzHnSVJK5O06OdbpXZSjoyV0Rx4Wyc+lJI=;
        b=LOsV90QXYpin+VPG0pmevGnHUUBTbM+T+45KAW1yzZtty4D3qiQ20d0El2JQbvh3hA
         qKZVoJhOL6t/pr5sWGNhwoWSY8i2jmx2I2LEmqY8334hemy5P++50GqdptEbSJbeGkT5
         D2LlufmFSMMy1aHrTczigrjSyNl9+xYX7z3dGesAJkzDf723Zo72G3vOlZB0Ysufsr1k
         XoC+kd8D5A/XdyA4ffQiFNNKHea68XL+wgyswp+vjID/yfisJwq65reSyEg0MtubB5Cq
         UX+VXS+dlKEJ+EpHQJVoq7ZWPsuPFDa0D97IYP2OYQRaFSfhiub2v3yhWST6jigtIb6R
         9vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709313805; x=1709918605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GesJ1JUX6AzHnSVJK5O06OdbpXZSjoyV0Rx4Wyc+lJI=;
        b=H6ksD1Ilf+ZXb4fZXk/UW5t/un6F4wt4axEavF5RW/ra7An1kJpnSObnChmpbKD+Tj
         YAdgVWFxZRR8c1r4hdTJpMeRSD1afwz7fkKGQVt745achXBY4SqaX3kjSkRgrOFCVlXy
         ygxq976hWC2JH8tC7Glz8Byu2R8+Rmfz90eyZ0TaULX1FrWM2beQLmGUtcViiLIOGNK7
         M0FBeL63tarn/F8URGzPx6bD5y3BZsc9lghKjOeIfGTr00IBsKAcsTIY0QSV3sj+v3Ks
         bvrgf+pv1e6qH6eBzwVjiLnqSj9e3kY4xIewEbk+amegRciFbsGz3iJmpWI4W97svKq8
         QS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9n88IMV74oooftgy41a3NP0odaOC2nfkqvBceB3wvRQOLpo6a+HWy0bSSI77lVwu8DtqNEgWUbWHSiGjmKdzG0F4KMiMp8OVCRzSuiFzq
X-Gm-Message-State: AOJu0YxCmfAedSuawy/QHDGeYSC9B1a/VS7IaBnt4Q6N1EILjN0o9YhO
	P7ec1YJOqK2aMe00bcw2HOrddvnV9QpAySxDnonXwasnGgnUfMMX+XvCVhQaYXw=
X-Google-Smtp-Source: AGHT+IGC0G34ue7Mz6Bxa2+Ac9u3TgFULDTUIHDsYIc8Bej77mS7rq/TVrjQa3q10GvBOOUZsbMEmQ==
X-Received: by 2002:a0d:e248:0:b0:609:722b:1bec with SMTP id l69-20020a0de248000000b00609722b1becmr2246600ywe.1.1709313805287;
        Fri, 01 Mar 2024 09:23:25 -0800 (PST)
Received: from ?IPV6:2600:380:9d78:b2ac:81c:a8a9:d9d1:d5ee? ([2600:380:9d78:b2ac:81c:a8a9:d9d1:d5ee])
        by smtp.gmail.com with ESMTPSA id x2-20020a81b042000000b0060987e4cdfdsm239325ywk.117.2024.03.01.09.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 09:23:24 -0800 (PST)
Message-ID: <8d04d4e7-5d89-4ec4-8069-2b38ab350741@kernel.dk>
Date: Fri, 1 Mar 2024 10:23:23 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] io_uring/net: remove unnecessary check
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <7f5d7887-f76e-4e68-98c2-894bfedbf292@moroto.mountain>
 <3d17a814-2300-4902-8b2c-2a73c0e9bfc4@moroto.mountain>
 <da610465-d1ee-42b2-9f8d-099ed3c39e51@moroto.mountain>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <da610465-d1ee-42b2-9f8d-099ed3c39e51@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/1/24 9:56 AM, Dan Carpenter wrote:
> On Fri, Mar 01, 2024 at 06:29:52PM +0300, Dan Carpenter wrote:
>> "namelen" is type size_t so it can't be negative.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
> 
> Jens applied Muhammad's patch so this part isn't required any more (and
> would introduce a bug if it were).

Yeah good point - thanks, I've dropped it.

-- 
Jens Axboe


