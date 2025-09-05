Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9EC2FD1A4
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Sep 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059468; cv=none; b=HwCc/2sznJF6R/ZY+vTTchKRa/zeKBv2YuZDE99Yb1Ow2Et4+vOUVDYNMaFy7mVStMK2dcLeUwa8BhHJrsMxLUMaeMSnhrN76VH/Vq2bFPBiM2yDW4siexPIcTo5uJC5SexmtQAJA7bJ8JQNT947XMPk8ZMuP7Lb8spBa9+p6Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059468; c=relaxed/simple;
	bh=BK69GKXDo5Lr+Qkt1GmUdgKZZr1aJR2lLdycYBt0bJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsoGtVVSm0rHcXheBrBRJo/Yn3ADJgALRXlWvRuz6TBxKg5UOFAeVmGw51wljM1Hvdm4qyVX06aOlUVLHaOI8e7vLyaiklBNsWFj8JBRmMDrUfKXoZUgjqh51fwqcC4i6y1jMqz1X39qeXcp2bf3rlQKine3hTXucrMnbBsj8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcfCalSB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcfCalSB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b627ea685so14812505e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Sep 2025 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757059465; x=1757664265; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
        b=WcfCalSBQX5L5ITP6TimiMFu5LeZmc5lCsiv4UcIC7sgdWIAeacQi+ivcACERdRbJo
         5K+hEqjm9Fzx8dyl2G/09eXEa8r9AjQKrB/SfEVqduRj6IGOGznuC+vvebSPNFePhQHW
         HKQXFYWm04kQNz7C9nHmUfUYlqNdoVY+hzr8kXZQ0Ep2iS8+SYwifQaTV4lKRVpPWCKl
         kQ8uOBE8MdobqhEks0IiblQjB9vZv7D+MJinT19M5p7sm17udyD5jxCtjpKuYo2cUC1b
         UTJVhz2viI9Ds5vlyWoaH6DAn02bpN8b1jeyekVLEpRK/XX3hkAtqbCiyUnmQWNyxwzS
         rSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059465; x=1757664265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
        b=WyxCplp1X2+P8Nd9Y0/b/G0tRhUIH839Jo1K5ETgtWm/ZipsdCuNUTrcSS9myLr69u
         ekbmR/0iHIhqBYY02hDzwDeFClt0eYPLR9x5po9QJAm6WKFMX5xSzO4YuYHvdLcgHXUy
         4j9/1Wacv+Myux/bZQSJlDoqPuiJbnGLZBiKo/ajDnlIBKxzlKd1qlldpgGe1NOJpFvl
         kzl8jPgtWY32+GuBQsE3RzHLCCd0BftpHJUP2/6mCdKhoxWUUeaa6AlMEib1I7RyhmmM
         NcSwaYSAubimhUeg6IDK13AqG3FIwqufvE+Pg4NmV9GVlucmt6qbeWSodmFf8t5FiZQy
         HT0A==
X-Forwarded-Encrypted: i=1; AJvYcCUmsyy+TXgKOe5FnPtlk5cWmKrlCqJp9vs8EFfPSxPp1+mYXPIiT+j/1YCDNgYRfiiBY0rO2rUj3Ol5xmroZYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8PHRH3lt1JKXX2D0XuaZXk7D+W0M2cwgU0yaYLtS5s1uRNOp
	EdY6vtEgkFBxmDlwdyjPq7RgJSA/GKqNGd+ynBQB6GQsue8idHxng3SoicS5xGvFiJv4TDMW/+E
	zO+cA
X-Gm-Gg: ASbGnctDU5/kgVABTaitdrn3Ks7U8p2P5rhPzDkbniKL3f5QargWb7SOdFQb2H28PKL
	Q7sQK3/jTWEbF73C0lbR/04csS9ucTFMvxrKLVfLEjPPbd74cGTDjKnHAqfZPQzb5nAO94BEiII
	AtmaBTePHFhNvh41KIDMEHtnbreciKkNJzc09qPKQe1/SLSBtGSvPa8YnunvsD7nNUZFMY0Wj5Z
	ewcPYbe42vlIHbVd110fxNIpNpRohpAi+m8fLFcQlYLDLjxHDVgQ+dfYFq5QSgVfsYX4UAUdUcH
	gxgcRQZyh62osmx5ALnUJhZRLhKB75CS7fOcZXFt4siaCQpPY3e84t+OVg+1afb3J25rer7Kh3d
	bVer/EE56K4z2O4t3w9A0c/rXvqH3FG5qmtpnFU7wYqbLzwzq
X-Google-Smtp-Source: AGHT+IFg31bO3+yEGrU5RDt0pIsHa2/S7Tm9NAlDysnLBMH3Sorox3ujEfiAyqMx4B2CxZfrtHTl2w==
X-Received: by 2002:a05:600c:35c5:b0:45d:cf5f:cff8 with SMTP id 5b1f17b1804b1-45dcf67429bmr53251585e9.11.1757059464523;
        Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf276d204asm30777648f8f.24.2025.09.05.01.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:04:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] PCI: stm32: clean up some error handling in probe()
Message-ID: <aLqZhL-DV4LOnHlD@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that the other error paths use gotos to clean up and
these two don't.  Generally, the implication with that warning is that
the error handly has been ommitted.  In this case, the error handling is
fine, but we can avoid a bit of code duplication by using gotos to clean
up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 964fa6f674c8..96a5fb893af4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_set_active(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	pm_runtime_no_callbacks(dev);
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
-- 
2.47.2

