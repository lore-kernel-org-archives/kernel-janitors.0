Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949FF2DF13F
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Feb 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001795; cv=none; b=PSEU0ptrN+qiWgaEgRL2py1x7NLbDMvGGc+6OhvaNKnfvbkRKegycrhPVwWlwkaroA7SCMucquIRd8lherT+mDGwPfxigtINyznPzKwj029LpOjkXZf7ENA8wEocsJDuxSDVjcLxMOyPhH4MiFCD5iqopBWujm3/qEEFAWJvT/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001795; c=relaxed/simple;
	bh=dGJkN6SnVshmKW6KFF4UVx9o8lSkn1Lt8gx8YuivxlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaTSguQWfdfZfnVnatWXs9JBEx2bbDDJSceYhgFaATfTgonta/8YcfN5uxjP7QeZnCNQLLjSfxP9pr3xcFl4KHIW/hF1VtclVEzYWgQFe/pjMXkvBtS4r2lRM5yJjRJXEGQZSki5rE5HqmbH/Q/aYtq91jGsxOhBHTqpfkWhzJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAXANip5; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAXANip5"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439857ec679so1341187f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 22:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772001793; x=1772606593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=TAXANip539EJa5cTLIFPeinn+cIjUHCMCNoq4l21gl+9a7ZGhyXTDWWaYvQOPkpTiC
         rhXOpZYgzs0817cpO+27SzJ4PF0+8cm0P6gEO5SNg54Q/s6md8m2ww+UNghYXXCYaHK2
         +qdJkQPHfOoRxTZ/n2dH+ZLMHBaRiIkkRiigFzJIwEmMxvEIsth6+AW0PJ2r3YXXKazo
         oNXdgMv/q1gT4deJhU1YQRqt5nXkuta3rRFHreEy49/YJwEirrNBqBoiwCA6+dhjBsxQ
         /r9m3ng1qrLCVXovA9k29IsiX2eWR8bVgV36+ndRZPg1Rt8LPl92M9rY1KD42CMCxbnY
         bazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001793; x=1772606593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1j2htuqmQpTTkLQ6035xROAKmDGpEfPVgSnXewPmtLo=;
        b=acrJoZGIZwSP0t5RI+UafIYneybvSbrsY1rzKywTNOJd+T923wIJSN3aBydBDL38uk
         JxDuGfaqqCEW+ZdLYCJiGXBjHoP066BlbS0iep+d3BP2TQ6bZFxwr7hZVqsErgK/RRDD
         0VqESQTkVtdYgM68O/d73k9quU/DTOumd5SYG+Lhm+/3WaURDi834e0Iq2GFa/MLgHAx
         zvWzcPPo59fPHhDl1O47GxqCK++BWwG9r3oIAMJ7xybbnGw2IX1rkSTxEtMN7YFVWGnh
         ZUoTiJ+K0b7TaNBWgZ0VeT3E87d2lK5qLZyXR23X2OMWGnSNVJtZ8EKFZmakUeQAlZo/
         dLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSkG0gr8vPkfYOeoo4qUelzIeIF8h2sWMiprdQ4W8tRh1F0zIm93xvl1ChvRCq808gjzOBg5xA9unHyMQcAog=@vger.kernel.org
X-Gm-Message-State: AOJu0YykmvLLHWSizzTDoykMqX9YDDN7jfuRBk4lbIdDQuV0W1eQwnSf
	Mp+9GbhC4p0ytwI9cshI+opwq/V52OBXw/IlcUMlNkXp97NqwMkE4j6a
X-Gm-Gg: ATEYQzx/rp6uHnIW8lZ5PmmOMArg26wKDWG4ORLTFUUkYCOFlIFM/0aYrK0Hchq0CE/
	nblGJ9mR3wBYO8ncSzO9rwByRtfXY2h/uAsk6aCw7M8OV47+aEw4CL2A4g+DCccFxFV+dQGmyVU
	nl3zWu3NUGhSTsCzxT08xLQcu7zvf9kKC8h1fHCLEdYwReQ3OAsFLXV9Z9wWc3ulsyzkIBfBe24
	HJzz2KUQKFI56DKerWxjlRrCCH/qaj4HJsZjcMoF+fFp8SsgDboDO642JybE2OLghlORFM1VIAG
	Rf9OJiLWklCo6Ypc75VqMjTzRH85XSMLztv357nUTvWD3IK93jK7NYadvZo40FCE2vp2lNKvguQ
	bsxgtEWH1NFR6hT7utda7chgvaO3p4dLwF2wxILY1+uvnBZWm1OOnRAzwDpPPr/nE2vah2KaGgb
	/V6sAD6t8127QtelHjgVm+w1nSaRgjJpG/vSePPyOyEn0Hpig+w7qTAELje9nWe38fu6ek
X-Received: by 2002:a05:6000:26c6:b0:437:7168:af4f with SMTP id ffacd0b85a97d-4398faf1376mr1688051f8f.27.1772001792676;
        Tue, 24 Feb 2026 22:43:12 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43987f3ed03sm10954287f8f.16.2026.02.24.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:43:12 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v2] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Wed, 25 Feb 2026 11:42:45 +0500
Message-ID: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225001036.gg2ghnayekrhbcxh@synopsys.com>
References: <20260225001036.gg2ghnayekrhbcxh@synopsys.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform_get_irq_byname_optional() function returns a non-zero
IRQ number on success and a negative error code on failure. It
never returns zero.

The current implementation in the modern dwc3-qcom driver checks for
a return value less than or equal to zero. Since zero is not a
valid return value, simplify the check to only look for negative
error codes. This aligns the logic with the standard return contract
of the platform IRQ APIs.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9ac75547820d..f43f73ac36ff 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -526,14 +526,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	int irq;
 
 	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
-	if (irq <= 0)
+	if (irq < 0)
 		return 1;
 
 	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
 		sprintf(irq_name, "dp_hs_phy_%d", port_num);
 
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq <= 0)
+		if (irq < 0)
 			return port_num - 1;
 	}
 
-- 
2.43.0

