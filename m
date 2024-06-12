Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E016E881
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189022; cv=none; b=fdDyFPraPr9vkVcp1wk+z8bGq3V9yla3K4vhgzl56Ir/Srq6ZR9ekdtw4NbJfItsACWumDLgDulb7BoidPyPQzi+Jq0ytZxRnvKwdjnqM/Y6oqULzc9ZFngbPfNSooavMyUK5cXYLT4orTynxRDn8IosVkD4UdFO7I2mY7skR/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189022; c=relaxed/simple;
	bh=REYZcvusm3pkwQ7HGYtJFqKnsOvXK1eSq4fjluTiMa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbSC5+q2W6bqf0xT3qUozwN+S5QyDFV0Cy716ZjaIhAy4LG8AoN4TRxyZ0oFP7C1IFrCRKa46NNxAAhr0iSLrJmMggUVwblD4GYnVK/lecEpS4AE0jClwmTpeUXUP+lzyQFPX0FjYe2vagBg6gYj3HeOMQDtXr7OAtza37C/Ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nz5ecIO0; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nz5ecIO0"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so36246571fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718189017; x=1718793817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=en5v3zZb3SYUynuEEvB5KY7fvjCtjNs2C99/5XHt5sQ=;
        b=nz5ecIO0pAY/S7aL5GGowJEQAAJHigWeTCvTLfrU434O6+lYLQ4pMiQpdHx44i7S07
         uLavFrc8a/A6vwKIlUUgnhSDKbvYSfhFody4I34hFYeyod+YcOFazPwgHQZ3Q7hJzuB3
         QzQMdFpLD/m2bOpX1vzEAbETmqydRUHx3BYtGH+WdG+FPFnvgF4F9zQcwsAaYOq1jipp
         xr1jdppunOWlitTbbZhalwQFI206a3PefqXcvmIJezYqHeXs/INrjzfFJlIHx5ZFP87+
         IovLV4n3tI4ikkID7le/Ag8TLRG4iDNkJAlIsO4PHpBCFMLH+VfeTMLE/NSe7hitSNIq
         iGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189017; x=1718793817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=en5v3zZb3SYUynuEEvB5KY7fvjCtjNs2C99/5XHt5sQ=;
        b=XlUhk0Ehkhysn+Wh+vxoZU7mqQTO0b+Ho5y/HotWrG57mnfU7ujL+nVzpnoUqEJqpC
         EZO5r6T02AuuyCO/K6xixg7k4qFHujGx+mWc8zL1fVbH2fWj5yAkb9FkmdubJl3jRwFa
         MzTpd0crZaxAeXOoNFA3KDd1srqo8clcajYyoGRwiOWjQulKO0ieoQZHZPTEB0z1Paoj
         dqtUD4GC27GTp4QQb5JTT2HuaW3gsTAMXy4DvDCXjuObLOzdkiqUrHfSGlJz8fkYHQLe
         37q4aeknYCVM6mEstKxyf2t2ghpNxZfxlPS7Y6jOZiVUFZHfhgP/TYk2V47Leghr7KTe
         4QCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrypf0EVRMLSQ18najmDXXqbmRRzFIsqdEv25qdHt32hZRA+O+kfjbGXLcn5pN8rN0pA/W4yqY/kYoj2zPB4cOmKKRJAdYcwZlhJYkhQeZ
X-Gm-Message-State: AOJu0YzrpOniRYdNF0VN0Wa3F0CDuXPnIfphLQFUG2DyGTkwt+6ZQ2iO
	vvXIQ8sFuAa2v+zzZWx/0OWWinC+mLX3Fsb7h5J98dw2VGZt0pzTyVAf6aXcTSKeiRvlP/9BO+0
	Z
X-Google-Smtp-Source: AGHT+IGAjGH7WuBg4zqQ4D62wvnr79c+GSlh8tV4aOGiyUMLTUamEwviTONC6JOitXK9+WCXuDW5Ng==
X-Received: by 2002:a2e:a796:0:b0:2eb:fda7:e35f with SMTP id 38308e7fff4ca-2ebfda7e40bmr8240381fa.5.1718189017181;
        Wed, 12 Jun 2024 03:43:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de62fsm21843715e9.38.2024.06.12.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:43:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:43:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: nuvoton: ma35d1: Fix an IS_ERR() vs NULL check
Message-ID: <840152f9-d3bb-410e-8164-4c5043e1983e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The fwnode_iomap() function doesn't return error pointers, it returns
NULL.  It's the same as of_iomap() in that way.  Update the check
accordingly.

Fixes: ecc5bf868673 ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index fb933cddde91..1fa00a23534a 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -571,8 +571,8 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 static int ma35_get_bank_data(struct ma35_pin_bank *bank)
 {
 	bank->reg_base = fwnode_iomap(bank->fwnode, 0);
-	if (IS_ERR(bank->reg_base))
-		return PTR_ERR(bank->reg_base);
+	if (!bank->reg_base)
+		return -ENOMEM;
 
 	bank->irq = fwnode_irq_get(bank->fwnode, 0);
 
-- 
2.43.0

