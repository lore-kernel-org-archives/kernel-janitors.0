Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89ED387568
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Feb 2026 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073641; cv=none; b=eqShK9aMH3PWck85MKMd5pXnQ148TFeCBuvo0jqbAyxeZBXFEcie4a/NY96wqWp33Gj08RIUrPq/314bo2DiRivHh0WieriXnvPMMQd7f7hg9Oi5NQfft1eWKODdCbylKcJVWMfSEVsKV53G0NOU80vsrsE+YXfjVajb9hFm3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073641; c=relaxed/simple;
	bh=ku77Xk2obSr5S0hpCScaedfNXchWz+QP1fK0cf1Cpy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0yZaFa8KFwqd9aXy4qvMMEB8aAbnl+YQFFmZvU1ojXELPs8TRH0soIOvqAdrky5ooNWUtL2778Y1mTBaybLVdEuD9bKNnXXPV5hIdPEXgcG2dWCSW/iR8ls+NwSmQHBl3Wrb7N5xcwaNdABf0t0rYBERojbWvCshvKRA1nYUeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O0rbZ7pE; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O0rbZ7pE"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40429b1d8baso1669723fac.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Feb 2026 15:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770073638; x=1770678438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mDFJ9C0lQGp6d/APJAPHYfTfEZIYLAJJbOb43cDnTbM=;
        b=O0rbZ7pEbsy3hOYc6F5lZWaTwAgSCO6bvFFYIWg9TY/pT0SI7AMZNrcF0iHqLLpis6
         evjNqOKWDtUsnKdBfZCLRaaU6DT6wy+z7PDj1KLWonmq4bMq1m9dND18x2o2hpJyP7ox
         Jh9KWDqGfkiicCPuKmvawIzdm9JLOcLFK6Qb4b9XJxq7Bc5vDFRt6NSGt1ZeTDwseUJ7
         e9ZjNj1S7DDgCzGwJilwS4iW6OfRe8A+WUCT6HilK+dAYk3QAqAq2UNtAoCWxBw2mQRC
         H95NJzAH1e2WaN64yjLjg3TIlsnkf9vbXaQMAlUJuqSRB/PMir9tpbxfMJtzzdEGCRZ6
         tuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770073638; x=1770678438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDFJ9C0lQGp6d/APJAPHYfTfEZIYLAJJbOb43cDnTbM=;
        b=UOoQT+RnhFxz+VO7GWiaHq4BJfXM/eQNRcXMwVV1A9Qlj+NCGsk9wonO12FgnfNB+a
         rQw6RZ5tMphXr23S2yv/OueLKzloPbZyQA6um6fzUaM7x2mkK5xVVAfs7lExoID7eslI
         /FZZSxf+5j/p+p6LtGLJlf97fBXAsoc1U63Rq+bkw5m88ist5boFbbCJcwR25wTfU7x0
         xSZQtaW5ucoGAnBzJfyq0HLiRxjBGwC2yHaYf2eKCOEf8Ctw2xwLQz/uuhYBZXGbTxc3
         cdoDcxfOG4UXsft/I/8Qnzbh/NzP3Nby177yi0NaF8D95fDYfKLFzfzb9vuRisGiub4b
         Kyhg==
X-Gm-Message-State: AOJu0YxizWwKW/RFGIiV6x31WX0ES4B5AU74FwyZQEM5jIhllI16cxmw
	PlWp6Yebwphe5U2ZvzHRH2KpgQwSW1Oambsv3+T2gFFcXMCkAgbnEAQsubAZx9yRAJM=
X-Gm-Gg: AZuq6aIx6xCriVSGjEUy2phlGsm3CRf1E65PCknwYZTq6NvP3JkHYfqMlHEhWHFsAu/
	Y1v+uxvpTU6hhfsrVKORVDXQOnCqZ5VyeD37PhEK31LvdbFnXjn41fuiB76k6OG5m2XZYlfFVM+
	Q5QttF5dxNa0Q1WpV5ljxG5auI+/F5EA3/XJorbzKhyx7Zp2GhVSW4Ni8cGX3LAlz71/rixiNc7
	l9YteYg2uHXbdinx8ZTuzDnd8ifcZ/jA7vq4GRbcyGplGD6NGd+tQzhZjGQ8Snjve9azorBgAi9
	0iiakGtGm9RCjHvrop0036GUc1P8t2J6CuuFuNlUePqQwuq4pdjD2aqfpPt57VRsu3GSryiY9PZ
	mjgQDacxvneJQdOhQTk7GTsvMrtLfoXrkP3VWPhY+fmLNOXL6Zf1CPafoyb0lQV3Y111pqws4SK
	+RlAv3eEo255ywNBnYn7Acm7gyfZazibI350L01PJm55fdb42FLnqniDR8wRqk
X-Received: by 2002:a05:6870:af4c:b0:3f9:b172:33e0 with SMTP id 586e51a60fabf-409a6a2071amr6164787fac.1.1770073638671;
        Mon, 02 Feb 2026 15:07:18 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4095749f332sm12007423fac.11.2026.02.02.15.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 15:07:18 -0800 (PST)
Message-ID: <a5fa2f97-9ba3-4085-bfaf-a255d24a81f0@baylibre.com>
Date: Mon, 2 Feb 2026 17:07:17 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next 4/5] iio: sca3000: manage device registration with
 devm helper
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 andriy.shevchenko@intel.com
References: <20260202194033.627967-1-harshit.m.mogalapalli@oracle.com>
 <20260202194033.627967-5-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202194033.627967-5-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 1:40 PM, Harshit Mogalapalli wrote:
> Convert the iio registration to use devm_* helpers so the probe no
> longer needs a separate cleanup path and remove callback can also drop
> the unregister. After this there is no need for having a remove
> callback, so remote it.
> 
> No functional change intended.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibe.com>
