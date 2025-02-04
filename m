Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F1207A34
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Feb 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659061; cv=none; b=hyihpK52kVNIs1NktJ5Dv2KunJNDa+H9bKmkuuocKa6EvEykkZAfly2sjTsRZ+9pH8Wozgm7NeSRcA2yZXrNeCAb3M4hjCVEsj06xK3ByzgrsT/FbG3nVSnXOMrV68aSu6SjgpvB+gFK8zwU/E1R/BFSUrdMY/dUA0aJVpC6yX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659061; c=relaxed/simple;
	bh=YPt7gKipaMwkPE8abX4wqOxhxvYT2FdS5FceQVgzPek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bYiO0x2Rd1nVDfFozN7Umo8g4QfGcKYnsGNTWyR5s4uWknfQxmPWPBTJwdCV2E+j/UhGpHVXIiBKwOUTKuX9rLTJPBvvSiNw9Py+KpXJCgd2ADgdbDH95yVbNBN2Lme50gZ8Ldv1uJ1DnWEScGaFxL+TjNnuaETFIfKy98FBR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIFosrYo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIFosrYo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso312338f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Feb 2025 00:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659058; x=1739263858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=FIFosrYoqaZw9A8jE3nW7g1JYOdhLSC6NHKF0mksHZ1h1PWUuI9pIhCMJ8pb/WEtZR
         DakFB1M/QOPcpwhVfCi2ukcqrBHUNDHlbMLR1s0/4bkToPFgqTmVkJj1Doz7DndoiKC+
         hskeiS3dgLm1vh+FRPwoLyZ9XRW+dXYgjB//Rbuw7d4zrNgYkc8iDXCJEJ3F8ssJbUhu
         W5sbSbI7C5+qC+xvgWgs3/f1Z//EbOikA51rqjtm1MYZacBKDbQaVK/lIL0gpNfjv7r5
         81f0+4AXmkYzkkzbvgIj1gvE+G/oU/3fWTjcJQhiXIbUcxpO9Y+ozSGj4NnT9wj7kdAl
         LqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659058; x=1739263858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=uOnlrwQxOHLt9IuVY5UUADHsYZdLJ2w6oS4P3nmd73j/qwyoBUHSa/HxPUk7gXuJQn
         +sgrkN8upGLu4Ap0EWggqOyOG+8NjkZmDD66vDCv9mnsep2BjjWNbg9OQokQTl5oY8zD
         jc+stFAbOx/1A+9H+d2Ox24k6756Gm4QhyfJ2KLAu6JtsGEeqOBqSGP01jilaFJX0Xwk
         JcUxC6LHgpBcf1qa8uXQfw+xHg8hn6Q7ywoT6u7+PfhOw+D7ZoFzCFvh7ixQBl3BPBCG
         FFFuJfAfOFrQazlLGzq9xQI05PJyLy6ih2JiOXUES7jQne+RqPWBlJuJ2zKkpXEw8uJ1
         Pfeg==
X-Gm-Message-State: AOJu0Yx2aQsuqjL8oP7g6zEi8h/ZLpEibAUzVyX6QwNUib2IpfGPkCem
	/trpwgbr9MBmluAcfXtAXoZfoxe4503xwSIn+Jl8U4KB0vmLnWq53FscSSzUrNE=
X-Gm-Gg: ASbGnctefgRjNplNzQzUkwTrGPHo1V3LY4cJAGsGMHumjOGcp0/LNSj+RBnyPusdfMl
	xt6xUjIOJYASiyThzUR27fO5UlkWL59Y9VqHV8JB777TAMVtv69/7d4B7rNetdmspY4w+NctFpb
	lKVt0sg0hmdlSTOVjCL/+7phpkP5W8x5f35I8qIO6+THFj9yJaTUwvQ2SF8nuf/1x43JWf4jf0k
	66l99dx3plP3UNwL7FiR9x9RP/G46XWsfWFFm8y5qj1yYVA4l60Y3bctnsJZqXGBPjaoJSumrtm
	4DleEVFtmHqDdC03JSxY5HwmM6oBB48=
X-Google-Smtp-Source: AGHT+IGO43N3gDtliqfjaHSeEORXODUkak0lfjeeQYTFjCKfZJOWJrPYG7CBCu9P6KNQnJ4ls7UBSw==
X-Received: by 2002:a05:6000:1f88:b0:385:e374:bee with SMTP id ffacd0b85a97d-38da4e0276emr723050f8f.4.1738659057514;
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250202220425.199146-1-colin.i.king@gmail.com>
References: <20250202220425.199146-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: samsung: Fix spelling mistake
 "stablization" -> "stabilization"
Message-Id: <173865905644.26600.17565544065003058616.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:56 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 02 Feb 2025 22:04:25 +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] clk: samsung: Fix spelling mistake "stablization" -> "stabilization"
      https://git.kernel.org/krzk/linux/c/480b1825d3806d744c589064df4af2bdbe2c7c2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

