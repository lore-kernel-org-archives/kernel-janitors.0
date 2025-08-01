Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2221E0BA
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055285; cv=none; b=PIoU+h3mDDWeHTbHiESCBIEuH3wRHTDq++rTbA/492AmD04qpXZXM6cRWjVGaq2UUxEyVus6foB2Eno/7UD5FBu06/kJx8o2wowshSrOHl4cn4PPrssgEgBfTCDaEr8NJg5BiNnbs0854TtuKu4fiRH5QaB8z1Abrl4H3Q5fKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055285; c=relaxed/simple;
	bh=MPOvYXHyt1VUDDVRVybn8iaD9dzrXwNCpMsrhQkJ1g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIbVsgN90FShBql7gWJzhuB6BGmq5C5vcIfAEqYC6BjJvnRywsdPzztNNhREHpkkDgJi92n6jbdjW9c+JoPWjR8fBg3Hp4FbpGK2Tcj0RE8iEnFktkCY5PlTClVunJuGMkmhWBxHxglXJ3nmza/YR1BgDDCfapbsbYHLQq/ieJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COSBTcni; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COSBTcni"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso4329625e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754055281; x=1754660081; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXrCxZaMMaRtHFaNQGeH/9TtujLuny+WCwC4B5wtCMc=;
        b=COSBTcniNu9VVI60cqSqkKlfElyVj0jBO0n9flH0K6iBDw3f0uS9vQzXNAMHMUJSd8
         7YjZTXGg9fRoBsaPSQCSzFATGbH82yMuyfAA8LM1QTZTYTMds3AG1nmUGAjfT9BsBDp1
         KENDwvqsQP5r2FTJeO5VQZgxjYny+5fnZJXutLdncgf9hlo86TosOsPYMx7TqGBC1EP+
         jx9wNp3+2hcq+UnEvX942lVjMUXEY+vfvq/IPF74Axjuo3GH59sqbDmTi8iWd/EfY/YR
         WP2KNQS6zpOK+jXLxRJKXsY8xxM8OuaR3Sl20xfiVnzFfm/5wsnVFbQrXbRpXi2qCcms
         qhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055281; x=1754660081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXrCxZaMMaRtHFaNQGeH/9TtujLuny+WCwC4B5wtCMc=;
        b=AEnSjBRUo3lWWfWRnAmwdgO/PdbT2wkSiPePdvxuBBYQnOuVE97uIfIPSZVGx1RuHY
         It2akalKw6HCFOUkMvXumVTBl9S2NWk1KFPY1kR6OiTHV+RdqefIH9IwMLXwmkglb9w7
         O9me1WCZMvhHxgMA5/XMEKyEi1SDSBmecO7Dh3waxR5XhFGxU4z1NX+FaEyb2DN4yHzJ
         9isA1Sg2IFMK1xY5ycL2wL6xw8uMnzDuT/uskTsC4KdWq5QbSYQdY6W9DPEy4jdQUl0S
         DvYOhjyV0w+wAq3gGRM44HJP+6ODT6rAzL99mtKtSBKanVFtTJjDF/GAT1Qko90YIDKt
         WBfg==
X-Forwarded-Encrypted: i=1; AJvYcCVeBz9jWzh8JNUoPK8ZY8Nc/ltmLWEFT3S05AZJthgVAakfxM+VNtJzKiunAHaodxQLLeL6Jg4glGFtgBC0a2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVohy1kpM0ZqCu1acIwkirwnZ+ulSKO4WCCYoXcDhclS7mzN8s
	+qOJv2W95GymWbt1S+Rwn3p9/6wc0t4HCHeDyR1mJnzhNdnPA6pX51nK63lZ71JfHC4=
X-Gm-Gg: ASbGncuViG8yowj8V5wS50BVxgf4rVS3B4u84HkN4rWsBUCttj22oOmjPoapLY4Cx9K
	/RseIR8qM+mTiZc25IcGHeawyovU05cE68Oxu7gtpPp8sU7Dr8jX1meMYUzRilIr55Vw1fY/Xzv
	xhMR3IOdsRGjn0TuHC6/e/Ab02GRswuJBKEr9MdDUAVMNvStFjxkucBkkluPB8NnMNDzrlhUZTE
	C4UGMfjUqjf7+J/QxmeHmAuFSmsBDLmh4A5b0zfvFMLUEgWbPIkR/lYqoppeGW0XdedaMUE77sX
	MQ8kM8vV1mzPrRdsDE8Rpqu1FrbpOL/ev/E9C9vOSD2tG9U4xpzM1jb9w/dT1dgRlNU6d5lshXi
	EsJm0wIF1Y736TpMVQWPs5pmXIR6bmBJw3cEeCTu4acw=
X-Google-Smtp-Source: AGHT+IEY4PzKF931Cl4hXP2ucH16DnQzD1sduXwZybAumiUjCHWrT+naQgUR/VvPTU7PmaLeiSG4OA==
X-Received: by 2002:a05:600c:4445:b0:456:22f0:d9ca with SMTP id 5b1f17b1804b1-45892bd09b5mr98694275e9.26.1754055280691;
        Fri, 01 Aug 2025 06:34:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edf5683sm66413925e9.7.2025.08.01.06.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:34:40 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:34:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: xgene-msi: Return negative -EINVAL in
 xgene_msi_handler_setup()
Message-ID: <aIzCbVd93ivPinne@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a typo so we accidentally return positive EINVAL instead of
negative -EINVAL.  Add the missing '-' character.

Fixes: 6aceb36f17ab ("PCI: xgene-msi: Restructure handler setup/teardown")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/pci-xgene-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 0a37a3f1809c..654639bccd10 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -311,7 +311,7 @@ static int xgene_msi_handler_setup(struct platform_device *pdev)
 		msi_val = xgene_msi_int_read(xgene_msi, i);
 		if (msi_val) {
 			dev_err(&pdev->dev, "Failed to clear spurious IRQ\n");
-			return EINVAL;
+			return -EINVAL;
 		}
 
 		irq = platform_get_irq(pdev, i);
-- 
2.47.2

