Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782413B5AE
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413711; cv=none; b=p9YRpdPLP5kxCv2EwFCAq5OOCVUucnm/VOagNtKjKuQB3CUy04aSd12rZm/Ko4n/3ZxmtxhNMcmkHBoM9q+f73k2YSeT0itVGeBiDirXSoMWYeKtnCvjwb+y9f+A1vtpVvPVweWj6YolXxq2I9qycRdhu6F2g67NYUD394U+hL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413711; c=relaxed/simple;
	bh=V/euKjCcP+EuEZclJHRJqQhL8BiXIhmeGbSZ3k59g8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2i1rMLTQnOEFZeCvDp1XGR440DeBXFgSwKwRFj8ZCBXp60mP5hmDIQPoS6Tkyl7JtC4jVUDTa+ngrOoakXSdb5YTo/a2zWK9+kY2bcInWonnE+RWVRHIylvn01Qy9o187PlVZopgWK11c+v3racAn8L4OL1iaw8sqQD+qw8H1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJzUmGty; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJzUmGty"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac9aea656so8104804f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413707; x=1746018507; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aKGWU/nxQJ1g/GQXjmzKsRQAC1mEWy7RzAyyaBKhic=;
        b=SJzUmGtyqzzENuVu84/gZk73SHdxNhwQToDUfBYEUBJ/yFZmEfZ6yIkSdIhVLRyqnP
         52V7TYA52s6nu3Y5LbqZoKgeKertnyzdz1lQCPOWPcEVXzcsOCRp40AZksCoVNaL5joI
         1ELg0C6/4QP/RjHdPcvrWeipHyNTjyRfNuxH06c+2S/gdpx2n9Tx5rbOZWgpshgkRqWy
         bNuJTTgF61hxrYYIf4KKiASwZEdkVCHPC/bgv0l24ypnLgtgaBcbpeytCuhnAVJxZ9dU
         86CMsMi+rP/ycDizRebXzJopVIdokBt3d2KQ2JPnTLHRePco0IFIY8r8pYt5KY+jmIcl
         JLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413707; x=1746018507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aKGWU/nxQJ1g/GQXjmzKsRQAC1mEWy7RzAyyaBKhic=;
        b=N2wxr1ZJPZxjdrmLXZ81ZEfiVi59YXQ7pLYYzGd70jDhiiWwM1A+JzNmbnO7lQBzx9
         gZO+Xgivow84E2KDZ/6SlTIuFxpHWkOKVEtU0fkEnnlV9kGIJ3hiLBk/jrIRfubM8mc5
         xjz/Ge+3XjoykMuQvfQBlncy+cotT0IpPgIdJ6DcvCaOCLPPPpM23vIDLCcj70h2IFPK
         sk9PmC9hyCQxx0ml0FlTss9tsCoOaOzA4JGAJ2prutCZKJCCcTuv1NZ0jej0zTkTo//D
         OAo1x7kl1U4Wp1OmYVbnRIoq4/7TTxljE720QIILA/m0fCpXC4h3jRwriVAFccX8UHhp
         fqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWViU91lCGMbdgmtpdwNk5lvbX4v69KGUreexXI1d+W0wRHkdLhkRDo5lD48YDjMPiQwbFUlI3cmSm2xgB8GAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46VpcZb9FPkGQos9ejr6hwm9dzTLZJc3ZhpfzTFvy9380Ozju
	7CM/K/rm5pqaPunxAS3Q4VJljtpnWJOBTfjnQOvw4vwTDtoTni+kangHhs8Ajvc=
X-Gm-Gg: ASbGnctoKEQt/A4uAM3GxnJJI5rjNxBeWdADlcDehvjlZCEo9n183AUVY9MjXvpnBSw
	0JPfFg1q+JVLBIwAW5ajy25tZng3R0GUTlx/FVBa4L8qcejPrLIwO5mBkXRm5/O+RnDR0Sng+4W
	rvfcbbAAFJsiyurr63MDg6z8Y1mJuCk/Jgt2j7spafpRXVjDHKV3B8nziqjaV1/41rTkxBLJnS5
	iceYKsQ2hcVaal0AcvPtzfwqYeqf54MpiCd52+9j0OV+LuxEZVK283d41YaYd7YVIlAa1M39iCi
	Gn9XRPvwZLNKW3BEzZNrW14q0VtgOsZ2GmoFeMgSFlrkrp3JxkwNCs38
X-Google-Smtp-Source: AGHT+IHFDE6RSxpVFbftFmRUuMMe1z1mFI84VXLmNBo24gUTBGerWwkyU/8c7yGJzERf6IPYsxhjow==
X-Received: by 2002:a5d:64ae:0:b0:38f:30a3:51fe with SMTP id ffacd0b85a97d-39efbad2f6emr13262250f8f.42.1745413707142;
        Wed, 23 Apr 2025 06:08:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43330esm18445115f8f.21.2025.04.23.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:08:26 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:08:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] phy: tegra: xusb: remove a stray unlock
Message-ID: <aAjmR6To4EnvRl4G@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We used to take a lock in tegra186_utmi_bias_pad_power_on() but now we
have moved the lock into the caller.  Unfortunately, when we moved the
lock this unlock was left behind and it results in a double unlock.
Delete it now.

Fixes: b47158fb4295 ("phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/tegra/xusb-tegra186.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index cc7b8a6a999f..23a23f2d64e5 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -656,8 +656,6 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	} else {
 		clk_disable_unprepare(priv->usb2_trk_clk);
 	}
-
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
-- 
2.47.2

