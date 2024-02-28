Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6313D311
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 23:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162819; cv=none; b=GDWwXZsC31VoOqdN1FjyyQwRDYhwfJqdKLqKzBczz/Fjhbda/QxCXaJ658cYc/oHjagzM3eEa0TXeGwCB9B7ABnkQ/h6JmBW1ihOErvf9aoRXeVpI1lLgk9bBMKhgvUP1lJElWrWQVbWNvc94x4xSRBSFCqF3Kguip/3DHD4LcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162819; c=relaxed/simple;
	bh=8FTj6Koa44+7wIfYWJIPoAle8PfST8SPtRF2sQxL16I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gT3ZgJiN4JxgK8yQrAO6G/54zrcBhS8ryEEs2krcv2JJy/9fPcCkr4pkMUfCqQVvoK4gI8O3+NwyQpRirUo8HVh3TgNTMj2jvQmzLYTKHCpggsv12RzGITlSjY/t/T3dMfkWUDhViSet30R9caGC9v4rmo1ndC9Sp9oxsZOcy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7HSEoza; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7HSEoza"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513235b5975so273571e87.2
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Feb 2024 15:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709162815; x=1709767615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
        b=K7HSEoza7DCdIqrcWgXXP62YbQCQYuMTXvgq7CHcNaOta4aWB5IYuuPC4ZTd00TQIC
         dDRItLh2fANircRuUuzCH1UrwlY9WjWUkYNIifpwhQpZaSCv3QvyOjOFE9UCNApaduLt
         CdW+mGt3xCIKGv0rTlSKBJBDIehivzbzwHRLyo4oebRX1cs49wR2n6HOLU4FkmyciG6z
         1TUR+xNX++n69zJfmA2NwhWLV8fJkRy8wmSK/Feeme5DN6K0hzbi73TfyBdqJLngT4yn
         FhMoJWm4kvhic9OJBIgQUnC7VIrKHWDadTbXx+K1t2jyR42CznPlLgT0h+P8q7ZmuyiL
         VHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162815; x=1709767615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eYiCisy9EvDzPpdsA8EnqFrzrb2WGQGdFzfYxWz3OE=;
        b=aoNlVwW8Hs5zQjZp/gI/mrz9flqbH7TfonH8NiJlfnrkItPjhzSOow0qVl4T12+Zwg
         VyyWvUZ7jwFpSgytTc6VTBB4xREJAi7cspEFFKN8UlMknRiJ7bJVUtPpTJTV/7bwtIn5
         mWK+4DROC1Kt4Fd3HVPDOyzXgvvR/8GP3CSGdziTfa56d1dx69zrSYvGHTJjhTbk1hPp
         KzfiHBcSRANgqTSaweoz6leYdQtlw5gT9qcatDGYZDrOOWWlfiqbLRL7kz5fGNm5srob
         cRKvmR22NT7kryoxuvEGGsiNkAcTHN2ZfhodgcODzmopkx4P+v2sS7CzZGxm2lU/XUkZ
         pXoA==
X-Forwarded-Encrypted: i=1; AJvYcCViMhtZNz+m6dX8dkcFXWVlGrfFNqxjQrqafJEm3rUVXv27jE/PRyEYHjT/RvgrZG2A1Bj2lBdEk6ETghJH50geB5+8PE+e10Vk5lnJeQeD
X-Gm-Message-State: AOJu0Yy7DzM/CmY4+VZ04/2cPmcRmmNGjeEH39JgClXjAr1H2e4mldf8
	/60nmaFGWoDy3JJFvveUVPN4A1ygiM+GHwYb0vnSovY7peqe2keVetFw63jHITE=
X-Google-Smtp-Source: AGHT+IEauPA8YU76AZ2HWn9YzhqJSaQh/sxY5dBOq9kCUqmFc1a7D67zChdJwrqxqulBHP/Mq3mKqg==
X-Received: by 2002:a05:6512:34d3:b0:512:f6a0:1311 with SMTP id w19-20020a05651234d300b00512f6a01311mr236650lfr.47.1709162815082;
        Wed, 28 Feb 2024 15:26:55 -0800 (PST)
Received: from [172.30.205.146] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512028a00b00512dec300dcsm28686lfp.2.2024.02.28.15.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 15:26:54 -0800 (PST)
Message-ID: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
Date: Thu, 29 Feb 2024 00:26:49 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
To: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Zijlstra <peterz@infradead.org>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/28/24 19:05, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 28 Feb 2024 18:45:13 +0100
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

(+CC Peter)

Hmm.. this looks very similar to the problem that __free solves
with <linux/cleanup.h>..

I know no better, but wouldn't the same mechanism, down to the
usage of DEFINE_FREE work fine for _put-like functions?

Konrad
