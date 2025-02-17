Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD8E216E1B
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788609; cv=none; b=afJO+3+KSTlia2mTDwAyo6d//mK/tkUBC242Y8a4EaxSfgl0HO+GmHjmWWdQEhTc830Ka3NsgvSy3rCwrBjI0KPO91r4m6TSKsLwFcDAAM+OlI+FETnZblBgxEywAU7Qwujw598aZeL+tzlgKZYzuhVNk+xnW9RdGf3bjYuSJgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788609; c=relaxed/simple;
	bh=IW4H/RuddXNAIg/Kohxj7t5Rh3v9x4e3eNtlLWHAcwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lReQPNBZ6OEIJPaGgpVxSS6oJcSa3IwjltOaQ0AkE0k2ScrPbedDElpsa7ilLAyyLLkdmOd7JlNJV7ZpayoAKgv0pJsrt3kW5CdpWqfYd40YucH9uaoPvCvC+sWp0xa8V4/xYXrvJ3StM7krGGN63GRXqKUQIablnY8rIwhtAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbBm2FV9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbBm2FV9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so536797a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 02:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788605; x=1740393405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=TbBm2FV984Gr4efE37lEdExnawWKrn8Ob5J/PbjgoDoTpuh+uQW+Q9dewFSnqz/K6a
         uVUPT5IaqBoktWQyVKbQDEPXo8IlKDlpzdc9fY2Fo4iK3HKUHfh7J0kThEjhgUwYCix5
         VR1DVe3/TRUdxUl1sH5X6DhPwzJjZuHpD3rcdOuubuSyJCX4tcyKWGphdTanQURfjyGk
         7m26TYxDf0N26nRvITzn8opNYjai9p6Ln87L6TqNFMsRNqqeEMHrlk7aWsZ45VXJv3zE
         5hLEngYOLfA+xDftmOLFB0ek2t4MTJLtraWOeGGs0l36P9H1S3UyAVWvsxzN2wm3lvs1
         HSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788605; x=1740393405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odA1UbFuInXahoaueYcnkzROOat5/muuif/VvbnJ9j0=;
        b=AC9ALabSnX4XXHkFXZls5q6SeOjGPwTSu55udZL7YcwkcPUxbPeS3GsL2M/au+BbC3
         n+Uyn/vOtP1CqA+gzn4nPf1L0IKNVwJ3/EkIWP08kRxrLQetqtT8UZxa19B8vDIIb9GV
         e5V8qz8JqFOgEFplH+NOIq0cV32yXPiIXKFUIEdjkeV9XwTPGsfpqs6t2Xn53bFRplqa
         RLclA2/sSFhiBt7Qwzpd8tnjD7tiJA1YniEEQ72JvBaaPfniIbmgpGmK8qwKf49kEbUr
         85O3QlwyXzZXcP0nSSgl6QyUu+rzLGa+fhbdK1lfqB+yOcaYJDjtDTVcIOxoUqmuiqOR
         p8IA==
X-Gm-Message-State: AOJu0Yx0wkmSK4zuyCh0Ra1+wnzuxRLLzAEDktZC94VvMddyF/QFFwE5
	enN4Pr1yK4MzRZ1gujJGZrRKdFY/7cQlrn3ublHd4i7rcry23w0C6AByd1nPlJM=
X-Gm-Gg: ASbGncvJAa9gBTidtah7tHVyZ7k8FaZA1HXZ7lA9dTMvpMu2RuCvaHaBSxO5DLxUqlG
	9PAz9Qqlr0Y6GV8wlaYOXj4HQAhKRtGk6PsDWrnLXz2GxevkOAMxl1aYVlPoCHhPvELOvaaVSjv
	rjBEN/nfcUnCRpJgP6A8q8jzWzoyC2d053ml2R5/03TQPViejqaWYgDOM+7RBUIBf4TQLqHdmK/
	4ip07LUVYMscdFnbojhNUzX26kjr4m/SVVKCInpJH9KkxZbs6vuWWc3q/ccYVGbi135uJGbeYnh
	A0A484V3ADwor88J/m23xMSy7quRaC4=
X-Google-Smtp-Source: AGHT+IGLK9kay2HyRqmw0YxEsi1Oq3aDAG9+iUL0UrTRPcqhtxeRK3H6GewyV/X09yl8wLNmhln4kw==
X-Received: by 2002:a05:6402:5254:b0:5de:b604:355e with SMTP id 4fb4d7f45d1cf-5e0361b8ac9mr2830518a12.8.1739788605299;
        Mon, 17 Feb 2025 02:36:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm230383566b.111.2025.02.17.02.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:36:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake
 "Faile" -> "Failed"
Message-Id: <173978860321.144850.18127886620209008962.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 11:36:43 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 17 Feb 2025 09:13:41 +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> 

Applied, thanks!

[1/1] firmware: Exynos ACPM: Fix spelling mistake "Faile" -> "Failed"
      https://git.kernel.org/krzk/linux/c/8c47b744b49f61604a2c0b64453bd410ee0f3f08

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

