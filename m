Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69722253AB
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717071; cv=none; b=sr1jgX1w9ShsB/9QfFNWeXiZool9RkNSUtYM6D50vhV4+yc8TcELAfNd6uFesLj7Im8EGycDPRt6uOcC2V2tTu9rcR+f39OgNEgSg857cLBqLeONoiAEf0H1Dn13o3oT+WRb1eMuRmaTAsUoTKWgIM1nn4xjL6u1zTRWGqDvDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717071; c=relaxed/simple;
	bh=/SfKCCgas8Y073ZiKa6F35G3uPziVF59ejNVoSX4/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTW5gYZVDtwtPxEjRAtJF+E0LtNqWEWnqoxlthrLWW6DC/1S8p4CHeFtFyzYqjyxd/pKIE3qIxedVYGmhTBlcMLI6qJfCwS58gXK3EiSAo8LmcHdhQ7/TpMHTM2d74Iv5tTB78STxc23dnY1P5j7Ud/BDw27dsSNaer9XKsGR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UM0z0+6u; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UM0z0+6u"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so7835955e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 09:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760717068; x=1761321868; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XA1CkPbtaxpNOtSPg4ZNDO0+nr3/dCGqWcDsk880cQ=;
        b=UM0z0+6uW7WszkIoYZlG0bEa/Y4lv6+uSd4upghmoECxO0ylsWXwzlzYQA3mML+HIK
         bNc3o1Ki0LsH/tQ7tgafz/L8p7IANUE5aWvk3mHC5v8aQ4QBCM3p3qJOfmJ4H7wFx4MR
         BN7od/D5Gd19zkbHb4CP3cjfVgcgoRg+RKU8IChwKN6WtMu5PP6OauRKlmY30COhVKpt
         XeRy2GKWeWFU53ej2sz0vcV7tcPZgG0uLAtjhZpm15kgbb9UTd/STXOx7m+9VfWChmrq
         mAqopbwhahig4wYZTmrwH2df++DAMd58vVEfq4zUgDtXqiJFx83+/caK1QtETardviKr
         JNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717068; x=1761321868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XA1CkPbtaxpNOtSPg4ZNDO0+nr3/dCGqWcDsk880cQ=;
        b=jV3wLgNdw01kcReg7T2dIeYr4/t0gaQ7PItkYusnh9Tv8ch3G2DxOGFyJbt4Fi6CVR
         lEGxlCPbZh9qghWPI/kU9WHQNyH+dX+ug5I+1n1CKsaqNVj/pgPRk4liSdvpIGzNo9j+
         5NLW42/QmgZVUKnPIC93++oXjLMU169inTMJlaDKv/ubZLUxVsJGv+uoNcO0HLl315tT
         L/NqzUf87LIAC34CKsrh4FhyZ9a+XLxINcJkSupe9as8OcDNhdja8EMcpvRD185KxM3I
         4TafQER+z4GOFHGYLtNX2FyxDkg24dc4GbtpYhv3Kqq+lm7i0XnUFI/M9S9G0AOguv1Y
         rV9A==
X-Forwarded-Encrypted: i=1; AJvYcCVZHnos4V7qQmB7nxRzNMJ6EF+snaagOx5Kyvew7PiKH1Kq4l4BwK3aMUaOPoXBsAVDt2lTX9QRB87LBUD788o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ROGQnr/0ZmD+Qkr6vFBAJ2AkD98WpjIf0H6ha6aXTlHcuoO7
	J0qe3lmp+OXcA6qHYaXcsj1+QZFoanjSOwHQIxmf2KcJiKONld9EeSjuGZkR66/TXCE=
X-Gm-Gg: ASbGncvptpO+//QrZ5XEoK4GpKvGPwgJFPIj3FHTfGxKhsBcKIqiUQuo8+53cYJkJps
	m4RPDGUr7mRWteuF9bsHKgkAOPq2qWqmAEtAoBsGfL1F0FFgiBW16jyJBdlnk5Y0zoFbmX0843s
	EeYj9SJ1obQPyqpC2e+YmxMDURALMD6cL4gMoEWVwY1/wXh19lkrXVlFl/sWW0nIm7V+R7GLJM1
	Icy+rhcCLmC5reEDQ4IwyPnsknBnLW4XT6x5TcT7XQwo0vdflLT2rZnb50CsyVy/E+aV6C3TH00
	8+0bCVfCLScuqd/50SS0681NG4AFJF27Hdnz6JZVV8OEQMpAKWZ5u13YwUOVKS7pQYMS5KIuNa0
	a1x0XrLYTtbza9shdXkRgnJRLO4feZ9nHB6FXqTGRdfllgt3iXsEfrK6cOK5e0aNK5ooZFNEAxd
	i7pJ0mjbzr2kB/AYge
X-Google-Smtp-Source: AGHT+IG35xafSuQ5BPv2Fera9k8oHJR8EziSTLu7op3KCmIHoxM7gv1y6xtU5v4UpxQZ0+clT41dcQ==
X-Received: by 2002:a05:6000:4604:b0:427:6eb:8499 with SMTP id ffacd0b85a97d-42706eb84acmr1802064f8f.24.1760717068025;
        Fri, 17 Oct 2025 09:04:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e8141sm40851309f8f.48.2025.10.17.09.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:04:27 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:04:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Michael Walle <mwalle@kernel.org>, Andrew Davis <afd@ti.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: ti: gmii-sel: Add a sanity check on the phy_id
Message-ID: <aPJpB-QI8FMpFGOk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "phy_id" comes from the device tree so it's going to be correct.
But static checkers sometimes complain when we have an upper bounds
check with no lower bounds check.  Also it's a bit unusual that the
lowest valid number is 1 instead of 0 so adding a check could
potentially help someone.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/ti/phy-gmii-sel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 50adabb867cb..6cfe2538d15b 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -341,7 +341,7 @@ static struct phy *phy_gmii_sel_of_xlate(struct device *dev,
 	if (priv->soc_data->features & BIT(PHY_GMII_SEL_RMII_IO_CLK_EN) &&
 	    args->args_count < 2)
 		return ERR_PTR(-EINVAL);
-	if (phy_id > priv->num_ports)
+	if (phy_id < 1 || phy_id > priv->num_ports)
 		return ERR_PTR(-EINVAL);
 	if (phy_id != priv->if_phys[phy_id - 1].id)
 		return ERR_PTR(-EINVAL);
-- 
2.51.0

