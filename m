Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BD62BDC3D
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Feb 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002341; cv=none; b=ijX5vHDrbWswp/EOxtkGQCxmqhGYlrl48lU6hbiGKZBMJ+1Ry+dLrqaUF51mE+R3Hw/ejOWmAfQsxCY58ZAY0Sk00y+XsUkgQ6p3FGlUR7C0QaJW4T2Yk7BvAclMNo2tjZ6eYin1iFI42ZsSMq1a90pdlANFA0wK9v+LbZi/1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002341; c=relaxed/simple;
	bh=wWlnhUKYqV8Wx/7Onzg/8pKZVFcNwdYvLbRKD8COaVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prOTux5VsuLeZ3HaEOuXwmDhUj6iET7ZxPsbQfCpclun0SMotqeVfdYdddl8Re8fqeTbwRYRghm9m5CNfroIndojnS9gXAgMEfLym5/o2fZQpy2geBRNC/FjykYuNxmf9zvXM4EtWUwCujIMHgmUbJs1ameWghuRVAdHNknn4PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBzfC6y1; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBzfC6y1"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2676780a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Feb 2026 22:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772002338; x=1772607138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDedFaVY+KaOvNB2BxP1xWzhD01NDhi5iX3Ein+K0U8=;
        b=VBzfC6y1tatOMh7V65zNo4ttdmTWe25uBOx9JVQvyY3rWhLbYqjTa7ocg3QFnp2U4P
         gL8NBL67BJuKRU3GnKtMRLHGBAh9hv0dynzCMdSp4/SA0Xvd09GRq7dXjCJsebe/CfYq
         BLGRoIyF4s4Pf459H6joid/9zAPGmfeHCGA+Xma3E09K/J0+LyIW14jCza7njj+QtuNN
         SFfWdMGV3MKzm74oxb4/LgyYO3EzZt9HuFKqpsLeca772omb8xpu53+vQUDaoBWDfMCP
         9KS3iqbg5ZUw8GpvAxgNQlCkZQs7BTPo6elOaPv2X9t66KkXC3o8gxTaDEK0UG9iD1NS
         G8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002338; x=1772607138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDedFaVY+KaOvNB2BxP1xWzhD01NDhi5iX3Ein+K0U8=;
        b=RhsTHD/tqpm8C2uK5Ku/szVWglKVNPIh6+UQE0GKnNXiGOWxXrnp3rrgbsmYh+IqFh
         r2caceCO4rNbKGkXX7C7z2RQVprlQC9jnWfdabQYxcNh92AvmL7q22FbLzrYXqHSIbjp
         T4zU38Z95ng/Zq9/HVEI8FjUHtCTmoN1M0QMQDs/V1iOok0yE+LkPcQwNgg2thzfnvXL
         zo3UXQ6lnP4rDF0Nby6xX017Ob/k6fJt/MjFE8drsEyG+Dm8PtpvUodQh//4dbviOJvP
         bdQZsgJ7R9AOPEWZhTaFpFmVjUzzA8wz5RKpE/B6y/ge/qv50tAzRR/81YUQmX84kKOX
         /kog==
X-Forwarded-Encrypted: i=1; AJvYcCWBTQAo5HAtu+zaTNsJ8qn0Hb8W9nKJ0ehwRYJQeIgayKVeS+GXMfo9Q6L7SHuak7qXnwrAdSbLrgEJLqvgmXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygqLdVLjqRPt/5O/qv+OdGI82X62uDvZXBKTSV6RHBaFHE5zAk
	ijcYN2KAh3wOxkJvbRaghuP7twk9SHO2O/shl17IK24nmQPCRbj9KyI6
X-Gm-Gg: ATEYQzzfUn8+lpwbwj1YJbmS8oVPJ8HdnZ27CIp7yIUet5xHty2cI3fFWRJqPKAEPyT
	GsAQ4zPPwX9Ykv8r+LpaR7EHCxMDnfkRLv9r/vfI+yMe6CV9nHWrbExUIZiiWHtf8XXjdzpaumS
	J870Kf7nP8ONXURmOnawy538Wi48i0jgLQuOpPlkKy8t4vtPepdSp6OO5+0xpqZk/sOTvp7JrKb
	2pj5SCekgSUgDa7vwwYtHjmlccBkFNIgqRI2xsyH9qLWetc81mlZz2Hst0sZEp3R6M7kJu67sH1
	Qt9Zvfryr2CoADbLPfOlkp5jPJLwPfQAazKewtGgMBdASEgsRIKjSqP/LKHsPVXmvUyV49trY6C
	WrtDN53Fo1St1T464FhrxFbMPHbJYL4e7oknYccJOItq0QhqobvsElNeHPhYwmAlBaQx9+sfGHO
	ny3gEWkqOHP57FaRBQGUJtWEB9MOb56bvz6qu1KpD2i1xn5EIcd4dvad4C5tMvw/uo716TlpLNe
	ond3Qs=
X-Received: by 2002:a05:6a21:b8f:b0:393:c607:9d3c with SMTP id adf61e73a8af0-39545f79318mr12151549637.47.1772002338417;
        Tue, 24 Feb 2026 22:52:18 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3591349c87bsm434207a91.2.2026.02.24.22.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:52:17 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v3] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Wed, 25 Feb 2026 11:51:57 +0500
Message-ID: <20260225065157.8952-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
References: <20260225064245.8833-1-zeeshanahmad022019@gmail.com>
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
v3:
 - Fix missing version changelog in the v2 submission.
v2:
 - Targeted the modern dwc3-qcom.c driver instead of the legacy one 
   as suggested by Thinh Nguyen.
 - Audited the modern driver to confirm the same redundant error 
   check exists there.
 - Updated the commit message to specifically mention the modern 
   dwc3-qcom driver.

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

