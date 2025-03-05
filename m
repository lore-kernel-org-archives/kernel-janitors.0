Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36E24EF78
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186814; cv=none; b=FKLCjxU9grD8S282z/Pp7VgJSDaBWXN1eFIv1apCjD8Lpr4LyViqIs+j6Y1L7mH2PMyA87IgH72Vgnc9NK/p4tIUiSij6+q1GEMC7+ZOn3aY7nc+zREN13LpqBlEOYvudtWj5XzRdW7gjR4IPSrRG/CrTuAE7C0Oo5MjN9egkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186814; c=relaxed/simple;
	bh=Q8DJ8fiTmNjeP/+2ks1wRurrJfcRDgtOToR7IsclVLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBVOAyMMNvXEvH/kZzZcgB6CPSkG6CwgMmEKKFXuMMvpy204u8H+zP+gcucNCvDgSK5JyGAtkm2/3XOii8ofqPLsAQJ/2ReCagi369VZfTeEK5uY5Aq6iuy6JHp1XAAiWKyasW9hRJ+5rpfhj7SjxqFGzo+/I0LmUCNf90kPUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4XQwnFr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4XQwnFr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so15323295e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 07:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186811; x=1741791611; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXn+R30pfqAeO+ripC6gzbXJrYwc26V6TE4Knds++Rc=;
        b=Z4XQwnFrXlxKwgfpMtsWoubHNjl00O57875c1XTaww2fGik1DcTZoywAX7je1NLgAC
         WOPcwwKvMA6AVMesw7kZqb7SGR2mzfkQqaWRaVEVCpsWwrkJgUvcWqydEqOIDP4HsRKK
         0wDVjHjlqxtADqXOWjLWRAcfiPnPQ3q6be/iGqNvN2tbM3TzFAwGYNWkKZi0qnV0UYVl
         sixFDr6cYoh8c4D9XvyMALvvml/Z5Uy5t1PvsFqxbRDUbQbUmeaXbXODTOFDmhzeedgh
         kxSgBvzMWDQ5BAv3zFOI1GLUQkaiVE8kilaP6nIr7CcZwtjZ08Ayi0HfaJYumXmcrRmU
         2Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186811; x=1741791611;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXn+R30pfqAeO+ripC6gzbXJrYwc26V6TE4Knds++Rc=;
        b=kVuw0J0PDYwILpHlguUMIS4yFnqkX0F76VPE4Ogc4ayMteQ8ghROhnDmWdunlS/HB/
         /hkxGc+Xklfp4DDHOKbxP03dFYdik8PoUs1Jg2spbPnoA4KPN3fUh+RaE4I2d0qhatLA
         v0mnvfkOj+z4Rvf6ueI79yBoQKGJPAbMgkTolp0Iync957+iyzR32rsmpiyWkGdNk9Mx
         pLkixDZmdKSHloqbsYJ9gStgihI46RVCl5XJyHpua2S0xK8K/L2FeUED/knFMYsaSMz7
         ErVs8UTGhw/hdoGoOkF7JQpbGv22rILH5O6QW87PzsGL0/JDTQ6Ue8qFad22hDb2NNoO
         Nc8w==
X-Forwarded-Encrypted: i=1; AJvYcCUwa5nzN/h1vL4F+A0O7ztnET5SfgYjjWwsNc08yyHHPfqTw47pxZbGCu98GChwPc18rYL+WKUZsmG+QpbLwq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cW8i5HmHUk8o0MSiiHNLIZX5riVgvLWyYpYd5z3ew/oCsZuJ
	NN9gc+apAQ1Fkjkn+XR4/armSE9XdKgFgd5OUT+zK/IFFH3OmLHz6+FfmkEDSO0=
X-Gm-Gg: ASbGncvKqnMHmxmiqtEBHSVF2G3/Kmtydq5AXxrOFkqB9OZhV4kj3kYCgrJIYcXpO7y
	7t4iM1Szj7SvgUs1rEqjOVPvPQXrcRpi0e0zRGKZexo+PMEaYRMzfWy9ex9DMUptHmsiR5jZqmH
	4AWvHC4kr7YROPEaysyG1XraQPXL9gAc/bPLMsggzYJIdvDKxxAxttSgV2xLCIJTjaBdMnD2d/Q
	c0UDr9qQHUHRaCbRnNc4GUIwKY2Eh8//HUv9KXTuY3HV99uAXQ8CgbnjJaaJK04mksB1hWiD8Zj
	lUIQUun+H8cm+iLbOqPo+UGvZ9gc34++LO3B0Szr3sX4Tw2RrA==
X-Google-Smtp-Source: AGHT+IHwAOMpL/YkvcIgyvX6we6SxWByrXnH2O7kDqMIwc9Mimc1XxnvaS/gUDf6T/jHttMfPf7cPQ==
X-Received: by 2002:a5d:59a5:0:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-3911f7b7459mr3110045f8f.39.1741186810870;
        Wed, 05 Mar 2025 07:00:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47b6cd8sm20988561f8f.44.2025.03.05.07.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:00:10 -0800 (PST)
Date: Wed, 5 Mar 2025 18:00:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vidya Sagar <vidyas@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] PCI: dwc: ep: Return -ENOMEM for allocation failures
Message-ID: <36dcb6fc-f292-4dd5-bd45-a8c6f9dc3df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the bitmap allocations fail then dw_pcie_ep_init_registers() currently
returns success.  Return -ENOMEM instead.

Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 20f2436c7091..1b873d486b2d 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -908,6 +908,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ret)
 		return ret;
 
+	ret = -ENOMEM;
 	if (!ep->ib_window_map) {
 		ep->ib_window_map = devm_bitmap_zalloc(dev, pci->num_ib_windows,
 						       GFP_KERNEL);
-- 
2.47.2

