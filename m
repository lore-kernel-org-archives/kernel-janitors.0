Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8B1D86DC
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567781; cv=none; b=s3zK0w6zruGIkEguvTrJVyuTaqyiDcGIoF2GBc+V0vlNucIHpcHdVEESXkV5kjGe+ZLaDLZkw1pd2APwKAuQWHPGWupHlr6dtHUXGqxBUL7XxSCBIJtP07NOivf+gVjYJ77f/bKlvVYfpLz/b55uEDLT/HgA7PMXeT3CHwsEqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567781; c=relaxed/simple;
	bh=3tfB7n6h6FyjzlUtea67REfTN8UJaPakhNxFywAX3RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9Ql+dQKq1IlU/hID5IbcIKs9Tq4hiXHWjPMLIBxkkEn/t+bCC/DBN4SBRyjK6YQ7kWMW7J+ko/1hebPi2RNhXNcnpZCqZ5efaM++Chhq3qQCHh1CXLX/lJ0UVgZtNBcYY110mPpOLijwjawdhyelBH42JMZnQDfa1dglClnloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gAgsI+Ml; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gAgsI+Ml"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso13077355e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567777; x=1743172577; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=;
        b=gAgsI+MldgL6BzP8q/MVf5j2hAX1Ju7qvQqmSJqGeUxb1RNOza1VfIeq1vUbPXwAwY
         3HGjWPrJZpc/uGkyR2pAQzR89QwaqjEX6cYcY5BBGlo2MFCyayrrNSkccst010KeL6xj
         CtJqkEKapG0Vwbu+Lm7KeHaTCMf1nLzVIzNClWiBAKH43ZhginSjtrbDYJps4juKBFFI
         Gwj2engaRBsxyPehZq2371o4zocX+/nhpIRf7O4JxmE0rGrxMir9STw6oSdwBqXSqPjC
         cAk097QBBzUi1F0oOOs5iGfHXkZ4nccONfKSgst4Zukn6SzXDuBPYCElVc8QNURwcz7e
         UvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567777; x=1743172577;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=;
        b=HRp/sPa3yDs/N/zvyptUqyMxeIEMSCxv4WGuBbHNd4UIub/mfrmLqBr/K8VPs05OGj
         lyEIo9JDbit4/pqv8+EA5IZXLI3Jjw/IOImS7lrI1dfEgcSJsSpGWDQwfzPIzujbaCRh
         ydYRoDCBcEMDdDNm9Dfr+UtrcujeE+GxOochqB7z2fwM/QdfqRnoiHFa0hrJQLY7oFcC
         sRG9tRlg9yNpxkwQOEiQSiuaJ5NG5OiX/HbTrB/ynmb8QhPbNfQ3wb1CBnxOHaxyRV6R
         IFTAEYkjkHa2zhqdeREOyAfPZFCP/HTu+9wLHkzDlk1OPEMLLHM8IDtkf/EqLUEwpmp3
         t0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7X9AOEn27hn+zNjF0J3KJ7LQZcBLasFQWVuRoaMAHTOLPL7IQzaamZ37kQxD/tcwgxkOHGmYzCh2qayDcU9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOg/HbxwBABNUGuxcTQAOMblhzTt/fTnU1ibf4pplRe0gn50K
	1G16F6KWk5OEUDMWhK+UB5xJultO6YBW0+yR7skbjn0umugvH4fZmHAOmZC6dyw=
X-Gm-Gg: ASbGncuvDMiR0BOrTHXcordzmWQ3ucXWRKMtBmll3bwNlugFWg0OpS4tv5yDfXaoIbQ
	o8zp0tEH6lOLgMZiOHJpYSMKPQI8lcWXxOQ3bTlDpWhp3UBJ7XIy5V2EU/9StNBY0wdRlWW2Qey
	7KC5RRbEsGs1lqiNiva37r1UcsRfI7Dds7IScUf9wBtCuTI1TBvWCg6SxZqE/99EBwTkyfuKYgK
	WvSOBRYp1AhNCeMwV0+Vi65Ima6IxcG+9FQjF2Z37T0Z3qQh3vgaBkHtlTMVtLHyJjb1Xz39cHI
	CP+4YDkSuNSE48zyEub2H2+9DWnWQglJlsHD6cUFhjmEbAiA7g==
X-Google-Smtp-Source: AGHT+IEBLRuGXXY3Hg/ewdBvYCF4zvDlD21Rbhn+1Z3hKO681e8YV9SPfJqpV9SZgDhIe4keKF4QkQ==
X-Received: by 2002:a05:600c:8719:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43d50a4ae7dmr28254255e9.26.1742567776837;
        Fri, 21 Mar 2025 07:36:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fceafacsm29121045e9.6.2025.03.21.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:36:16 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:36:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] phy: rockchip-samsung-dcphy: Add missing assignment
Message-ID: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret = " was accidentally dropped so the error handling doesn't work.

Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 08c78c1bafc9..28a052e17366 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1653,7 +1653,7 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	clk_prepare_enable(samsung->ref_clk);
+	ret = clk_prepare_enable(samsung->ref_clk);
 	if (ret) {
 		dev_err(samsung->dev, "Failed to enable reference clock, %d\n", ret);
 		clk_disable_unprepare(samsung->pclk);
-- 
2.47.2

