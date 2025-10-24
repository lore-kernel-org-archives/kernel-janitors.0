Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5C3126C7
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305022; cv=none; b=nNYaSREdkDsE/OpT4R+jd3R0m+43Xes/PkIEycLMHvpH2SsC05r+xdJmkUcmK9pP7bjoYlQ0LHUSJK97fMpkB3hNLktiT/DF/WJNNe4IiSexw9ivNkU46SbClei7rx0y8F0BZEEElZJWKeMoANsxZ7IkBT8NXhn8P4sHwCJeUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305022; c=relaxed/simple;
	bh=0zowZQE/EmMI6GxlKIwg6FGmmiIJo4BbJNTy9TYrt7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5x3KUz4UyX04GgWs9179iBQn+ZxNQmKGvN5GrfVc4wFH7DGeb3GErfg+q6gt5sTwhSn1DP31S346uiwQJow7Q/yzfnSgm1V1EmyMIoeINNKIhRuxgXjqH4iz8FaOEn8DQf6E2gIMkSU23hTywjdSkvg856xfal75P+rFazSnX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY6QzpVe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY6QzpVe"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-427091cd4fdso1169561f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 04:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761305019; x=1761909819; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=DY6QzpVe0rxSgKfR1z1haUEhujvUsfah5zRuRK+UNKDNuQwQDhgN9Q2Pv/I6rSunfn
         myhJ/e2273OQCiglJIDkS1JB7voG3EU0MHqMxLATAb7bdAAEjJTA+W43vpbn1mDCkAOL
         so0Nynvwyo56spz7PdCkRP35AB1hil/QXwMtKf+3aKT2DBgN078yqy8k287KyXHTEBKG
         VfAAaEVJGfCPaAXFbU3Hane6Llc8DORtJcAQsubIDVvHZqQip9BjGrhcbhiWL/5j/siA
         4HZO3RKb+H5LYfSEKByhCnp6fEMQXcFNXrisTI3nts0WKc2RSv82LRwO3DKU1FpKV21W
         zx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761305019; x=1761909819;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQOc+jM39ubvRhhSlIjQuPooaB7ldn1LylmA2tOzblM=;
        b=hBy2qz6aibWzoFsHXHBMChJ/QE6htG4+ckVt9ifaErYvqtfng8W+Ae3LzS1VPu+u7m
         SEp7726Amn9LK4qS/e3es7BgcUuTvKU2Vn8+fUNQfPa9gj3oXsxkIMQYroECsnk2SgZn
         dM92ukn8N52Rv4PCWUdef+d0GXIUmMwMWEDXPRIu10v8Yhf+0PAKg8AAzZvhxce8xYPy
         jE5YsCTYnBbAIPl5acmAlXl9xqJ0qKaLT3FguIocmjATXgKyw4m7JfW1b2yxbZm2R7lj
         0F5APx444YI3eyAA9eTJ3jG5/gnam536NFhZfaiFRJGn4fJZu1bjQZUtoNDGE4feS/5f
         2rfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwQkgVtw6PUaAfyg415WZe2qhI/sRLkRiETSr9c+k7XoeFlCu87r6CqDFdtdhep19qKrNeByeyKV4cfIWuMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDP7F3qleuxHQzJhtboIKFShalSKjjBWconf9tEF0t/9nrGlHO
	I9srdvdchcm3+XvwQZ8GufTrlv0iYLuHlO3EgppYaRe4VGz7NbxWiHNv8kMGvpNP9Ic=
X-Gm-Gg: ASbGnctvZXN6sI+j0hQmsT/6oZczo+uFAmPzEkvgT1pWDFn39cLByTYPnS8I+KzpL/k
	HW/uNtx3ikK02MB/PRJt6DcVhMGPQcXmxL2DKqZQbGxnPN+6dXR2N2AR5PHf4rmGUYrDXBVfH4R
	MNpQ6Y4CZV9KPv+1lOoeEs5ulSSgTh6goct/1oJwXI15kctjQ5nQPcWOqFlZwYLxd0JMkVfZfbb
	Uc0KqFrF7IJ+1KynziZd16nt/hxodZ+HHL+IUwjRI676P2V1tbzd81NjWnhhhFA9QCdMx6crzzG
	ISbQ2MST2BnSgcpsG40JVQKVeaPhkct/lZ/71uMU4qrShZpbhPCy/y6cyivEWgKcLc32uRJb+Nu
	0omZ3z8jEUd0S++bbxUp4VLhMetRyGnLWK51CWYcc06AFhkPWZ/f/sqBJPOf3rE1A45/Pj9+9wz
	Xvnr2xcBForVXbf84l
X-Google-Smtp-Source: AGHT+IExQzOyk4omzvi9Zz7XZjs/LOOnvxM4yvkC9gtz1IfMXQ9aSiPVkXwgXIxJvNBEVGrXMNkh3g==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr22219100f8f.33.1761305018812;
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898ec1dfsm8923611f8f.43.2025.10.24.04.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:23:38 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:23:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a copy and paste bug in probe()
Message-ID: <aPtht6y5DRokn9zv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code has a copy and paste bug where it accidentally checks "if (err)"
instead of checking if "xsi_rsts" is NULL.  Also, as a free bonus, I
changed the allocation from kzalloc() to  kcalloc() which is a kernel
hardening measure to protect against integer overflows.

Fixes: 5863b4e065e2 ("net: airoha: Add airoha_eth_soc_data struct")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..d0ef64a87396 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2985,11 +2985,11 @@ static int airoha_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	xsi_rsts = devm_kzalloc(eth->dev,
-				eth->soc->num_xsi_rsts * sizeof(*xsi_rsts),
+	xsi_rsts = devm_kcalloc(eth->dev,
+				eth->soc->num_xsi_rsts, sizeof(*xsi_rsts),
 				GFP_KERNEL);
-	if (err)
-		return err;
+	if (!xsi_rsts)
+		return -ENOMEM;
 
 	eth->xsi_rsts = xsi_rsts;
 	for (i = 0; i < eth->soc->num_xsi_rsts; i++)
-- 
2.51.0

