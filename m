Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF915F3FB
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Apr 2024 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311747; cv=none; b=Wbo32jCQ1226PKujzOsjGu/DtSbyaZ1lOVEWqAqq49hDOOQRaTCDuNUECX04wsxekWgoFIkCcrpITzEWg3YhBCDPwf2XqNA26WI+NSaBTUPclhOjsV/mE/14zICNo8FKQRSTFGx/wE16mZriWt22tXDL0QnTUDdF3I2vBOAb0f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311747; c=relaxed/simple;
	bh=8ImoAIEI0ugK8rC2IFmLmrAs2sbpTrlBbGo+o8vj+No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elSa91Qmu7xagQ1z+SL+zhz/v3CkusN8Rkjfif0t/2IEZuAOCGP2AG2JnWvn1ZYvjODp7IW9DTBoLyt5Tm8DhXRg9B53jNmCYYZJ0C9O84kXeU9s1NqzCwRkp849jTJZGTH6TkAVwlGANyz4feHWB72Rv1Vdh5HQBs8bNPwcJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjSnUDup; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjSnUDup"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a47385a4379so561859066b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Apr 2024 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712311744; x=1712916544; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJJyKfshi1mkCaS5tt0HZulFROWfnXGZiaDgMO8R3Nk=;
        b=hjSnUDupcvxj7zneyHBiU1R2EpvBrhstswDO7W6OLMw1llTc7JtBrFIcQrNK0o1ss3
         7GYrLfw3eVgtcnqW4GB7loxHOUEcgdSsbMKbsb9Gn0MglOizT4N4eHxCARAQWcx/4r5W
         mG1Rg0eRwJkBggrqrGy0r9X3MH4zRl90bjfMaT3JgEvObncUeIYwq0u2aPFSuW8raKtt
         OevqRXINmAx+ASQq4/5C8xp1BL6X2WcPOnTSJp6LT0BVkmVnC6uRXsHCjpI8yNPwxZPQ
         rVeg1Cjo5yomH/dyA4UvCDZCA6MHe1b5pvdtB6/cNvR2pBkpDq+GI4+NLdXVEmYHBoha
         vi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712311744; x=1712916544;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJJyKfshi1mkCaS5tt0HZulFROWfnXGZiaDgMO8R3Nk=;
        b=dSL4hXOH1cehJQHDziT4hVpzqDvXwTxo9d0qIMNcUnpFn15aRXaRNmv0tp7c1c+uVJ
         6Dfl2cA5mxY0beXmeWzL9oq2BGj/ggYYoGL1mUheXYLbDrjU3qFxUyLKZXeHALEpNcQF
         A3krM6Pm2XgAkFqWCqEEr1bIy4hYFFqYUtxaauIfxsFocNBDorv6ZzNxxR+ULGGNq9IL
         00NyHmhAtklp9hTVMKwS3DLUxPIMvSYgxkvPzKVVPgh2iEQMbvr5TpFDiEbydOF6gMoI
         13OHUjTF5F6PoDNXe5+h5LilAsbdTqx1rvsqhhkwe2ncVI0WVeoLk8wi5ZcqNzvOjV4N
         xuHA==
X-Forwarded-Encrypted: i=1; AJvYcCVnzDXUuUVtLXdrmMxJIg0gxtMF62mTAFv4nAJtJ7BXDCCm37FafPpj4yrbHEEMzC2zdKoIARXgWnht6AYrDzs9ImLUDNEawmyK7T3+u1v5
X-Gm-Message-State: AOJu0YzTa4ZOQMHPouv3NoOhpXl2IwQknu1xbz91xN5u6LUuM2AxGvX7
	NYWDIFtHY3YrPk1wPMrtvY7xxwN8TKjJCEnkx+j2xkrbQNcWClx1HI0AB9dkypk=
X-Google-Smtp-Source: AGHT+IHSByE+q9VpdHRF4fCIC0/s5XcORINNOZr0+G4TGptAdJjbM1kdurv9GRJWoBAdanDW5rSG6Q==
X-Received: by 2002:a17:906:a856:b0:a51:9304:1a01 with SMTP id dx22-20020a170906a85600b00a5193041a01mr1067995ejb.26.1712311743540;
        Fri, 05 Apr 2024 03:09:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id lf11-20020a170906ae4b00b00a51a691cd23sm503559ejb.190.2024.04.05.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 03:09:03 -0700 (PDT)
Date: Fri, 5 Apr 2024 13:08:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: phy: air_en8811h: fix some error codes
Message-ID: <7ef2e230-dfb7-4a77-8973-9e5be1a99fc2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These error paths accidentally return "ret" which is zero/success
instead of the correct error code.

Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/phy/air_en8811h.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 720542a4fd82..4c9a1c9c805e 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -272,11 +272,11 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 
 	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
-		return ret;
+		return pbus_data_high;
 
 	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
-		return ret;
+		return pbus_data_low;
 
 	*pbus_data = pbus_data_low | (pbus_data_high << 16);
 	return 0;
@@ -323,11 +323,11 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 
 	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
-		return ret;
+		return pbus_data_high;
 
 	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
-		return ret;
+		return pbus_data_low;
 
 	pbus_data_old = pbus_data_low | (pbus_data_high << 16);
 	pbus_data_new = (pbus_data_old & ~mask) | set;
-- 
2.43.0

