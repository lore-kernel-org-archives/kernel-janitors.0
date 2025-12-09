Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684F23F417
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263224; cv=none; b=bpeet+KWAEUytDoq39I8i8H4rKbDkpoCtKGFK3TZFHXWedhG10/MyvmYI2TrVynj+NZotkyLDrp29irD7nY1rgN3OeYvSP+v+aOReZP7QMo/17GdtPpwru5/yl6kN5OZwLn7QRq/gdWeyDcPvRFzCqKeTI9U+XRo7hPxpCy8830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263224; c=relaxed/simple;
	bh=RQdSipf+jBAPbiSIsJI0pwPZWKZWFVvk+g5Ue5AgVgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ash6s9F+ApzYSoHOe9hBrRFpmyE+dUv5qBWRb40GrOBYrgPbkj8n88uh2aooZ13uliN2LvVHg5IopyZzqwEDW7aoyWzm+FPoOPWBXbpDzzAwpMWZmlB8gZ7TDMFkkx71c/h58HCvUvbwyrYLR82H3uYfk4jrsszhKALXeflXEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ut3G1IEw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ut3G1IEw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so40627765e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Dec 2025 22:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263221; x=1765868021; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
        b=ut3G1IEwoFQpjkDL6t56ZC3IYdP5GI9p3Qs2ct0o4kRKj0H6iMf50VTzOd6Mda8Kbk
         28/3rPgVMBLL6nRcL6crtqvHwDLKlnMGCdfKe+3lVzgPaoHIFWODkNi3jVJ9lOqMCBSD
         gvhXBRzlH5rA59SxDb1vtAqOhzjrBAHiX8ztPUl5rSOe3lkkpv9nUuNndolkI+WHcJw0
         Gv/L1VXYgy5p/OHWTIjkc1usb6zColsQACj+yoyQTnYTxxfVOleWx/7Blr/r+8MzvLak
         ho/h0fjYhPe+/Q3YVyGqQEUUoROi/e/csIk9xNCkQRGD1NYKQCFvCk2W/3N1tMhqqvqS
         bW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263221; x=1765868021;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
        b=NrqKQeJWXXLtWyokXdNLZUTxRk+P+KdR3lRuu52myy2W5Wh67c/aJinsuxzZKYgrHl
         HtOVU1YJVQfB5hN1JCQYzFAt47akcznh+fN0dkR48ioWGnQIHSykbhSifUoEAqpSGd8w
         bQ+QNo8IRzIAqXlpl1rQSsf9MKu+OA9J4LzWUEQYcmjpGN5FMpnVisya8bcelG0tZ06c
         zvSXlQw8gyqqALadAGJKr6H3GBvJUDXCxteasyfWjtoPuBpEGfWM/UFor+BouGI9Cjuh
         2NGnHV37kWnMXSqEcLVabF5YCiyVBYJAcHGEASqZgzGxYwob/A+Sr1mlPXxcPprs9+Dk
         7N7w==
X-Forwarded-Encrypted: i=1; AJvYcCXCZerPU+ZtrysU9U7KHredG6YRRBTk0BrhbKTQAJIfJVhqW4OIERBILGP8Zu/m4dtmo3BcIP/YLjofYbbyivI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXzf/pUeUAw/Yc3ZlJf4qjc6n0hUxWcAWCBxgd++2DMstoul2
	5kw112ruiHaKK81Bx5wfBV9s2UKKU7JhIJUQA2iogTsLoHncRzfwMqAR8kPXMHnu92I=
X-Gm-Gg: ASbGncuHxN1vysrDLNsmEgEKUTx9xFQvnfZ7Od5e42GxoN8dcoDJMdTicDi2TKZsbSR
	d/LzwVVkMi+ilcpfrkqYILn8ihvo2hdf/I2JDIORCZZJLnp+wFNdBsyW+rYEl0LCuW3cTI7GJmT
	7s1faGvFMzVTikxLQeFKuMkAncMo5E+Wq0D8dG82LqP6oPzvePm2r7/kK9+/MML2DpTGMufJ2j5
	Y+Wf68LaE7zcXLwlhFSluptPHpc71BFj+gf4j44GT+KAWqXw1F67Bt/mqmkAR6/gy7EhZ4raI02
	kiTV/bUIIPygYSt5fAZ8nTT/Bg3FxI2G4Mft627UTYoYk3uvs+LuIeytz49LvrvgdRCf7BWOVXX
	HKdfvtq1f55/SF1APhNlS+8j+VeV1Ph59YlY0/jwtPNNlbH1zS96785mjILrmDT0gcQAjuqohPi
	b9ry+LDt1BYlGg5c/o
X-Google-Smtp-Source: AGHT+IGaTnV6DUM6NZ8B996sUpARBrir70sGaGW5NyYdRK9/TvpgGM9K+ozidhKmYpB4+XkFZ3zK7g==
X-Received: by 2002:a05:600c:1990:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47939e4d013mr112666895e9.35.1765263220857;
        Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d35713asm11916255e9.1.2025.12.08.22.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Date: Tue, 9 Dec 2025 09:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Fengguang Wu <fengguang.wu@intel.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: stm32-usphyc: Fix off by one in probe()
Message-ID: <aTfHcMJK1wFVnvEe@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "index" variable is used as an index into the usbphyc->phys[] array
which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
then it is one element out of bounds.  The "index" comes from the
device tree so it's data that we trust and it's unlikely to be wrong,
however it's obviously still worth fixing the bug.  Change the > to >=.

Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 27fe92f73f33..b44afbff8616 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -712,7 +712,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		}
 
 		ret = of_property_read_u32(child, "reg", &index);
-		if (ret || index > usbphyc->nphys) {
+		if (ret || index >= usbphyc->nphys) {
 			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
 			if (!ret)
 				ret = -EINVAL;
-- 
2.51.0

