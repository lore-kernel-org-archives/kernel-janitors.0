Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAD192B84
	for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299784; cv=none; b=dre6bPZ0Xp6C0nKQuyPFT8AOH9z/3RTD2R9ING1kmMyzMV7gb/gLkdM+JSvku/5FklUvLcHeVYuFs5TrCcsV966RHoFxheQTlfBNtAuy+FJ0RLnOzz4X9uQDRcW42kSsBn0LNViqbdziX8Un5A7pnFnr1PO+5xGSgJoisJIFsqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299784; c=relaxed/simple;
	bh=zx+GRYFooWpW9uCN18EKoluPmanyFaOpZIsBIGuITSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YyWtPiHQxU1p2Nxp8YnZuRj7U53FhoicxGJsdtb2ACapotIIwwDWrl9OdyiD6W5KiJzSa8RYRxLU31VcLeFNweqHwFgF0wi4pQQKIDaUv7ZAAnPNQ3letF93MdEQZXaU5NuZRmIq3WhekWF9CHUk6NNIDRkXPJjcuF9LlS7kkM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHkYUpoV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHkYUpoV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b4e5c3d0fso16999465e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Aug 2025 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299781; x=1756904581; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUBjHWZmJuNWePIdzQ6iJakPqEcAcCVwVw61Wzl+bZs=;
        b=CHkYUpoVHLht957ycyKcEN7Yv6nPFIrPyYX5rRhgpz+DmxJwnn4iVH+KKgkOIn7Yrk
         Yjgzl/kvAQXKAi84mLrbce87Wf/P9xBIeSt3mi1U9RZi83xo+5Yz+4C75fDOCip5lh0Q
         sxiC5ccsYlx/cYZauBK+HBBgcXP0BcU+me4HZxVYCiJW/x7+GykIkMiEG3uuqBOsjud3
         zUzawj9btwejzvTNCqfZ2L7tFOKoA5znZyT77n9GK1YcbjO8KXiR8mb4hU8JOZ5rywho
         URAC+WRgL8/AG4TrjacLOa8JsSL2agSpod9uMW3FgN8GPvv2OHhwSsPF6R9V0WJjx6ZX
         08zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299781; x=1756904581;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUBjHWZmJuNWePIdzQ6iJakPqEcAcCVwVw61Wzl+bZs=;
        b=WKH99skXD5vzlHqM0NqVrkJK07RDq/nMUJn+L9HXRSGxPhZY43QVtVVjshUm01efsk
         0Z/eyBuYEgQNrCC4hyBn0vZVb/voHsgNassbHocifEGSzt7qginOIDke3uLTVsUBSyuQ
         g227WXPuAZLn00JcL4GTb0FsIPQrAdgXOUeGb0EyXF2P8cugehxDjP5oUzKFje/aScVL
         7uI3PZmZYS3I+HCoLje/W6gr56HXF3AeQ4OeQsyWtB16o3m0bykOnuyzLSwSfNo+ufTG
         H6K2T4A0IcK+w3evPU4gqACk1HPhBOQpaPJh7fnyx9LqWpRH3D6YYZOx43e0oHagn5/I
         TEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkRifnoJDTqjhqWMhE+aftlD+DxsDSyjejRTcU9LqwN8j5NFu3giNjXyS4NWlgN7Qsj56XUeYVHX8lNaVKT9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4vQfO1NCKp+FaubLMacppr5okXls4RQvjAXicjdVkwf++jWx
	Rtir8fXhQywQIeumlUNnD+HP/6DHrFuUUMZFvsdugZ0AqZfbMbY+IOxeUcXfMNqSePo=
X-Gm-Gg: ASbGncvDiszQvJWtsNbX7deCxwcoOaWGeTj9z1Nr+DqJIcsQ9+dR6wKtKitPqnjMSQU
	xh1A0LHoDpimItulrEU7ukbL4Nk1O78NJxVLy+6eBMfX7AXi9stNqeGRQZP2Ojj7Fpnl05//xus
	C44Xl/HDyT7zzEh2LVxKX16lBCRthHpJZuYQLlr5s2tpE3O3b7yzW5bQuMMejKbPi9+gyLb5sm8
	6qKHC9SEbR2wsQIMMw08fpRe71G9x074U1IYJYxFZXUias6ED3czXa2HULL4fU7JkGlEbUicbSV
	KSwOz+QY0OzpWVjUkK+/CxaX9PGRQJq7KFcOAHCIbOFIMzAie9dMPf3Y+SIbolM9hkiUKoNQobR
	IrsxRkk2AUVmV6NglUYN+GSBoOKA=
X-Google-Smtp-Source: AGHT+IELT6sCRdQHPl6oXE1cEnsudIW2S/Fsa1FNb4czZPQVDcQfdTiLtbkuS1heqEyBiDapqSdVYA==
X-Received: by 2002:a05:600c:4f8b:b0:459:dbb5:399d with SMTP id 5b1f17b1804b1-45b517c2fcfmr155117835e9.19.1756299781217;
        Wed, 27 Aug 2025 06:03:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711211bd7sm21044448f8f.38.2025.08.27.06.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:03:00 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:02:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in
 ti_csi2rx_request_max_ppc()
Message-ID: <aK8CATf4EdcYcTe-@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The media_entity_remote_source_pad_unique() function never returns NULL,
it returns error pointers.  Change this check from a NULL check to an
IS_ERR() check.

Fixes: 31f91c5224cd ("media: ti: j721e-csi2rx: Support multiple pixels per clock")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3992f8b754b7..b75aa363d1bf 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -497,7 +497,7 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 	int ret;
 
 	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
-	if (!pad)
+	if (IS_ERR(pad))
 		return;
 
 	ret = cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
-- 
2.47.2

