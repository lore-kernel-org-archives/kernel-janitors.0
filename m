Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E03263F4A
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055292; cv=none; b=qiGvUuw0ataoC1Fc8WzWBk6PE6/Y4eBI2mFqynz6riGTM9qVX1Yw7azoupTx1lV/5OfaiJX4EcC5OkoTY0YziqVexW5OsrZv5B1GSDM0QyojmVrg/JZ0vbJrOwIRpmcRUqkYBhlhzOT6Tv15WN+Yg5jnVCze5gqrZGeSoHD3Tyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055292; c=relaxed/simple;
	bh=B6dkp/BBDmEeyjf+/PEcpn9dFT32NaecIIHFog8H+Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qe6mOdWftyNz8nmMnOfoUUy/uUlmyZopF21keHIH9MVOIM10aodUhGaIxbUFSHq4iqZulqiqCKGtRD/F92Z3qJCjXqP1emtXRk1iyU5GK063uaZR0XkayluDa8qyRtqYEZtsNx2BM4JL0KEXEP9QkEbXvA0WVDhNkJNbwDfoHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGIq5nlO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGIq5nlO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso21747075e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754055289; x=1754660089; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91nE9pIukFXGqv89yf8nL8EO399drb1w4wsJvfUDGbI=;
        b=jGIq5nlOTqTHOeTMmdnAdUm4MVBgOjeeSwxDrSwiJuuEnQw0SFXoWxSXZgLZ8YwVOh
         Vtga69wUhbQly/+rJNXs+En0o40ERdPqLOdtIigc96ifZfsbh1Xc/GHquQJyCUGLhMYd
         A/1PQzcw+T4axYTWoFfMyH349K6HcM92jFxqims74R2XzFo31NQ2R3PS/92VT0xgb4om
         TNJMMddMSpVplI+ShJRS2B0c8WDz7ckA6fnppjZWCZX46Dv3a4YIKhN4a8x7H2e2WNfn
         oIU1GE1aRxcHfxbc7xqB1vTM8ndW1lDWkXzjY1aMvj35NWPDeZVI/L1JIKEvVhAtYPh6
         gwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055289; x=1754660089;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91nE9pIukFXGqv89yf8nL8EO399drb1w4wsJvfUDGbI=;
        b=JaZy8e/h49cnaB3s+GQnGAbb94W9LrzF1RCnVjQ39NSy8s3Tprp5+iV0whsYwCT1nq
         q1boHY24Nt2TiXQ0b/PIlTF+yQ4o61PafZcZ+WpaEGuQOhBYhue1GVH7tAI53j0HJjjY
         /Kpumb4e1C0MV6F3xwFF3jXeWTteYMO0uJP5yqUMI0mK/g9hpiKUQZgrZiFpD3OW/ogC
         miuJTrBvqDVABorVLXea/t6Pc7y5cPa7Om33waezJ0j15xM5ldDQ2J7+uyMo1uiVg8w6
         qA4R49v96cJFG7iPqlfaN3DZPp1rKHQ2m6x+ro5nLN7evPw4SmzKEFzjl9vUJ9Z4+Gqt
         CJTg==
X-Forwarded-Encrypted: i=1; AJvYcCXHhLVRRJElV6qPamENhS5CVFiG0k8Apabf4HJHwKUlSiFoZFdExUq/8WvVdrgr6EB8XKjFUoqdlZUZESRmIgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNWSPoN3FhWCdo5MWYgQc4GIzssI3ZVKPJ3iWf169o/DpnSYB
	8Bj/gioXu3gafF7/s7bpB1loJYi3e7ctA7iTh+MNF+FXYJ1j/7I3MtD7rx3xmV6N4f26Xo8Ik7u
	vsG+I
X-Gm-Gg: ASbGncvWE+eD0erKXCd6RjoeOrtGxoCiac2ez+dPY0PqfIQ+d73eOn1s8S5B2wwLUZu
	Ab/Pw91ZnhtNvavFBvg+RFHTMmTtNZgtXF1lovkmiFd5mZGVUAvk0AoRQFVCLuyR8TaTjdOVIXe
	wunlSSfGqi8EQzxd5lvPRqwEcfbUgPdj84uxmU6KPArZOeFL5B6Y4pLr0e1j+o5lIYZD6CfDnKP
	ATjMl8UvH6osu/cZdexVb4HPKVCEBe6mIVHqG+uS/D5uuIjOHfkaQMIDKS7uGm+683bVo1iQL9H
	lUDRc49ekxVIH7uNhPYUmFet4spBBcLJn3Is6QKJkITwfwHvzEf8xbORfC2OtKmXuW9+PUMppKW
	SWcvCTQgX6cfEiLqn8zrBvo/jZJSWkVaCfYJWXA==
X-Google-Smtp-Source: AGHT+IGINVe5hDq+30CQhj/n/29dWvuH5Attb1DwC+ibJDto9n7Mzc5Zl/21ZMrbaLLxn/fjg1KzyA==
X-Received: by 2002:a05:600c:1388:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-4589af5ba2fmr100886665e9.14.1754055289518;
        Fri, 01 Aug 2025 06:34:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458b4a6635asm1093675e9.29.2025.08.01.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:34:49 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:34:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] PCI: endpoint: pci-ep-msi: Fix NULL vs IS_ERR() check
 in pci_epf_write_msi_msg()
Message-ID: <aIzCdV8jyBeql-Oa@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pci_epc_get() function returns error pointers.  It never returns NULL.
Update the check to match.

Fixes: 1c3b002c6bf6 ("PCI: endpoint: Add RC-to-EP doorbell support using platform MSI controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/endpoint/pci-ep-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/pci-ep-msi.c b/drivers/pci/endpoint/pci-ep-msi.c
index 9ca89cbfec15..1b58357b905f 100644
--- a/drivers/pci/endpoint/pci-ep-msi.c
+++ b/drivers/pci/endpoint/pci-ep-msi.c
@@ -24,7 +24,7 @@ static void pci_epf_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct pci_epf *epf;
 
 	epc = pci_epc_get(dev_name(msi_desc_to_dev(desc)));
-	if (!epc)
+	if (IS_ERR(epc))
 		return;
 
 	epf = list_first_entry_or_null(&epc->pci_epf, struct pci_epf, list);
-- 
2.47.2

