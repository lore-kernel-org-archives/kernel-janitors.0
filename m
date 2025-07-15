Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18A2D0C7B
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620485; cv=none; b=pdSo/xnHv9WvY+/SY38PY1HPNCPW3gWzD0/4jynbYrkMkuiGUwm46HnNUBarolRuKf0A0AhfkIS4J/9F62CUU7T9pkcr/wCRGp8LrbZUmSYxQyobPllA4df6G7GtZoisOZR1t074U1FZLkhuKNPPzYnxIAruoB+5BcW1KBBg368=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620485; c=relaxed/simple;
	bh=b/LA/fS6G1ALR75iCSwylRoGN9ZsUCbGZpu9YxrMRv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUPgSRiZLYRXkandfHON6CFN4QZN/STJ6wVdZBHaMRw2SYee3wgeIDZn+3pGGW7wekOpiTfQtZoh2ZeLfLa8No54Nb8UQTTR1Xf2xA8hS4rmTkWUeWQWaF9yNwSww2EYfts2Ug+ZlTYx+yTrSRfZymH72G9GcEFsSvzFpAk/2K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9GXd4uu; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9GXd4uu"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-41b6561d3e6so980460b6e.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620483; x=1753225283; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=v9GXd4uuanam7MiY9coe2hgWN/wJfqgjJcecYUy7JPw4f2lPJ3cupMj0zdQz76nUZS
         8KND3N+WJDPM5aZZsQDdAQ1gk2QVoSHYiJlG9qFxZpifZ29ugoWfz4qoWZxTmj213yTA
         N7kZHT0KUrBSRaObYepCZunlD16Ypncjjf1E+O4QhWV1v3LeXIc1LAHpuf0BTGCdXh0L
         m5O9OkoaXk+Kz504c+lmzERyeRizZp9doePktFeDx74nvUhy6JvT/veAt1Xh1+lCSriq
         u7EJJhGDkwwdAm912DlQs1PqMUZttsgPOYNZKQBwI0uL8pLaNm/eyQnt93I4lMF6lQHe
         Sglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620483; x=1753225283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0CRRO8Zw5SYMNCeis2H0ecNCwZ1xJBBe/YWgqbP+9k=;
        b=Ij4NQAzh/SZogT28oxMnyg+nU3+ucg3lrSwUk3j4lt05OoCKRd0xbForlYDSWuiZa+
         vdbozOnVw64eovQf6hp730cluKqhYrCj6NYRUcNjzeeVd3urDG660sdXNvXUbTOOOrk7
         qaz45s263l8pvX/HDyRz0yUIbl2r3csfKfUMLgoyhR7lW5Qc1laNHhlE2aupojY68pIo
         nXXxD1jImZsBLxRGSlGSTqiiPsugyRBbhieXamxNq32X3KcefP5YLZL7rwAcNlAMCbC6
         Xorp/KFapX8Ydj9qF1EgGdBcgP/mw3Kes+j8W4hPr/cSTLlcJLUhzJBjBTE/fvs7Kt3/
         ejrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN2IIMEBck6fqzV+lvChm/zDCivpmbj6ioQU7A41/2BmyZ5SH96bDHfJ/h1fGC+AofrFup6fgNA7ex5mjKZmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCfJLD61vGVs/SCIWpAGPOfSeRbUY5OjCBY6mBGOp2YLLCVW7
	bPVMCAeQN3C3JGmdlI2UI2eXJZ9rvqTxEBxTm/kATpZ/tUCtKqri49NfdSBeo67mAgU=
X-Gm-Gg: ASbGncuFI3weKRxJuJWyNNWJohxlpvVfZZ23c4vXBU6e5syhdI9ErQjFX9ZTieUN8Y8
	IZIG0QYKzIX3Gjl7StpSubGWFdWOzaNMzfr4JCFAaQUHzygzklhvu/S5l00QOuuaz/ELKz/TDxl
	3eeob3hacQLtJACu21P09C3rpxYWEXiXNZf5+FUrmommijlrBCnMc7z2xL4c7XXHsQ5M4Kzn0eI
	Jym+1xRjv0tGU0D1SClyS3j0yXoUrYxtD8D/Uqm96SNQe2KRKLX+J/Kfb5cBLxH8q4cog19frH+
	HQN/VudZDnoMW7a2Pn4tfN0fZLB05TgEzxU6zMlCKdAr3T9bYYjCPF8Hedkq3ta3k1djbw55gYr
	HzV590tNjyjDOZzl/811TMzU/zBAf
X-Google-Smtp-Source: AGHT+IGQtllmBc9kuXNMSNrT8BdEoXm/J1sAHyCL8mClXy5PmdAT8mA8+MNoRfXMLo08tASsstG21g==
X-Received: by 2002:a05:6808:199f:b0:41b:75ca:b104 with SMTP id 5614622812f47-41d05d37a1emr470408b6e.39.1752620482690;
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41418c0ae9bsm2349086b6e.6.2025.07.15.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:22 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:19 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR() bug in
 mtk_wed_get_memory_region()
Message-ID: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently changed this from using devm_ioremap() to using
devm_ioremap_resource() and unfortunately the former returns NULL while
the latter returns error pointers.  The check for errors needs to be
updated as well.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 8498b35ec7a6..fa6b21603416 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -247,8 +247,10 @@ mtk_wed_get_memory_region(struct mtk_wed_hw *hw, const char *name,
 	region->phy_addr = res.start;
 	region->size = resource_size(&res);
 	region->addr = devm_ioremap_resource(hw->dev, &res);
+	if (IS_ERR(region->addr))
+		return PTR_ERR(region->addr);
 
-	return !region->addr ? -EINVAL : 0;
+	return 0;
 }
 
 static int
-- 
2.47.2

