Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8ED819
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Dec 2024 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733443425; cv=none; b=L6RS1q96FwzHl1V0yDdYIgqe2tFpQ9p+qh+oMqycQyPvmwW4BdBJ9FpW/7FcwfmF09cvbwrqBessYSzt76Ce6f+UlkGr/UzCirhlZ2hxnarxuZA1D16GwOKgJ29pBuntTFVLChnna8NNjk5oSDX4BbOIvvkEX4gRFGSu/D1e9qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733443425; c=relaxed/simple;
	bh=qbCLbXOAmU7/fx5+PDIlZxfkhc6FTJSnBNp9tcZ/sBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJ6sWuYl69eZ19eTaDY7g/fBjURMZi3xDCO1OjmRT+T91oYLArP0uM+1R269s+yJNvOP5ex+6E3cKB+irAzZhSl/jdWfqx95zCA4l41pWVGl7zt2XT72e8S3w6PCkwNsd4+zLnua3KhBmwgTGvQ1byVqJnFXS9TlhtIhlQtMiwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uDmidVB7; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uDmidVB7"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2967af48248so867125fac.2
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Dec 2024 16:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733443420; x=1734048220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5vFET2LxG5T8tpAsNWIDLmJd+E6eUUYCjL8dYpTWOg=;
        b=uDmidVB7oXNr/6cbSTzWwLQC7y8JS/D3KYhPUGf/10suZbkQLoqfDzjsPYTtP5MZs/
         uu6MutZQzAKT+FWYH3DqGL5RMLk84Ilx96t9EkMzK19DDW2FOs+gHfLrH5ML/Yu6Vjfb
         BQI1pvIAlv59LLnAyXRqlelNL1Sns4qQceDTUFjUml79geWGJABXPOhGjsdbwxXCS+uY
         uJZuPRUZHuCWvxnz9E622KMgp/bBh5AzNAJXrncQkeNFYgpAPdFhO1FdYmB5tGpvmKO5
         V6vaWQskXllB0zdabkVEbN8wseNbZ1PYiKLLNTmREbt1gZLhArY5E7NrPtExik28Tit9
         DO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443420; x=1734048220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5vFET2LxG5T8tpAsNWIDLmJd+E6eUUYCjL8dYpTWOg=;
        b=hNRcVr+52oabd9XBQtjZGThYLDYYpVQutpMSqknECEQq52alIYonaKUhONdDsm8wtl
         rN2B8EPonQ2RIwx8dqheBvSwtxoJfJwHaDovOGbUUayLwLB/t1EaDOWOS0ARaQ3QGFw1
         JMkQzf7A+pKI9w0XTDZwbJGOPhx+4J8TA2bHLLjXH/04yBTZU1SFshgN7cj1G/WpvIgW
         mEbkNNqxovKjaoo4gIzwsT7R6ixbFmD4J83Ni9NgzzNXaFLUJYNS00Xt6AkOhiGRcDao
         YY0tpuYBMFpHt5G5tqbCL13nSL0Tq7e82okx/P0jiKc5geTnpoGJaYkzF1iw0UQxZXrA
         l3nw==
X-Forwarded-Encrypted: i=1; AJvYcCVjfioXjqC/2hP/8BoVwvzUw/DLoy8Z6CkVvsLfqXJHSZ6qVCv2J3op6aIKnG6gJOuJ3Oh0AaBwhTW8kdyUOxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7Ij1XFNjcSlPTJvWlrNwsGTLTCMHX0MTl7jRcsyMAIELA9fc
	fg4fIDv5PJdZIa5enVmHgeeB5heruhJqn9C2i2azU9yKccVwzfAd6tqWb6QLzbM=
X-Gm-Gg: ASbGncv6+ZgScVZcnKZqiANAC0VDk3AKeGA6YHu49cBqiiXyJljRiQxziTRBN4Ijssw
	qsoJvVnqku2ROge7ItOt7IOOaoC024pPXp852NNRnUqXcjql7+pXe1sp5GyWsUNd+7pv2PvT+vA
	DxsVr6T5Kkwy7QLnpA6l8GPgGYU+qtGYrMOmmp4hU+oYXL/fsrS4/oO1W6TsrEb8Qri+u0CKkQS
	B1wFyZdzeMG6st+FDmkpTQRRy10joQRNMvze5rQsMPGXVQhcf5bms9b0+w5naIUMGVf+yURrlar
	GLWO8KdrmQQ=
X-Google-Smtp-Source: AGHT+IECYU0jj5jbbPl6E6YzHzZxPOVKClUUsz6XXsvoWGW5CsRwuTbkcIDj8EBTYuLuAoRMOO2XjQ==
X-Received: by 2002:a05:6870:6b99:b0:29e:1cd8:4a0f with SMTP id 586e51a60fabf-29f73283e34mr546914fac.17.1733443420263;
        Thu, 05 Dec 2024 16:03:40 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f56739df9sm587232fac.21.2024.12.05.16.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 16:03:38 -0800 (PST)
Message-ID: <5c2d828b-247a-419f-97a9-a77a6653e846@baylibre.com>
Date: Thu, 5 Dec 2024 18:03:37 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad9467: Fix the "don't allow reading vref if
 not available" case
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org
References: <556f87c8931d7d7cdf56ebc79f974f8bef045b0d.1733431628.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <556f87c8931d7d7cdf56ebc79f974f8bef045b0d.1733431628.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/5/24 2:47 PM, Christophe JAILLET wrote:
> The commit in Fixes add a special case when only one possible scale is
> available.
> If several scales are available, it sets the .read_avail field of the
> struct iio_info to ad9467_read_avail().
> 
> However, this field already holds this function pointer, so the code is a
> no-op.
> 
> Update ad9467_info to actually reflect the intent described in the commit
> message. Keep .read_avail to NULL, unless it is changed to
> ad9467_read_avail() in the probe at runtime.
> 
> Fixes: b92f94f74826 ("iio: adc: ad9467: don't allow reading vref if not available")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is compile tested only and is completely speculative.
> 
> Another solution would be to keep ad9467_info as a const struct as it was
> before and add a new ad9467_info_no_read structure.

Yes, making it static const again would be best. Modifying static structs
that are shared between all instances like this based on the properties of
a single instance is asking for trouble down the road.

> This way, instead of writing in the structure itself, we would choose at
> runtime which version to use. The main benefit would be keep this structure
> with function pointer const.
> ---
