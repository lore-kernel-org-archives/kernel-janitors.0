Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0733341644
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134643; cv=none; b=hjUfIzPjX9HmupI6MhdRlyULLe8r+bMtOi1IMn5Wb8vZkYHx8iIN1gquu9lKsa+HY5m9Z6KdyHXCnO+YNecY7r2lW9oKA/jHQ/wYrznzbUmPe/sWMJuuj4hapMCaob7abLl6Kj1fYOxUnQjYWVGpK/IvE+/VIp/9779pxLzrDuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134643; c=relaxed/simple;
	bh=M0R/PwVK/S2JynNC9isNcWEnu3MHAOkI+7d2xOVY6jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTKKv4EjoJcTFK8AwpD9lC8W702qp8AD8x2FQowy5UXuuXt0vAMZRsUx85cNq8R7NAI4tVkHhULG9hOcLOgoAJH25tQg35G0ptNs5Sa4ijK9PgGQXW+8UA+zVCknh7fJOnKz83j/1y6OzNkGdO76vSC07KGk2d0M9+i34iKXLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBF4TwfF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBF4TwfF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4270491e9easo4193238f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761134639; x=1761739439; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=dBF4TwfFy23l9nZJSovKohhu+yBasyGsSjW/F8VmLBFWwzhYMJVdMNISX6tZnfrK4n
         dVdrgt3YMqiD2BWtXbUeoiYpwB3lsPF8RTet7SeXsqoVVyRZp2VOLD6/InP4x3xWjcbL
         9VaFFnW5EfEg0vsuUxo1gVJE8hgpnPQtK8kK2IuGfcxBzAAH+UoeCUUZzCDwZcP78mSJ
         uHIEugLcC8Hv4E9n9hae9N3A17zVcOEiASuXtzSrjc+2iu5R2GdAbcqWzNUbWWGD+rF/
         een+NC1A5LjcdDMCSj1BHzGCLO/roTHbWP6qR4+VaiEq+n1VB/91ezwYuGxo5gyCV27F
         la6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134639; x=1761739439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBT8mdGkZMhubx3+PF0HBbvtvo57PUFO+I9TYpkyhbw=;
        b=ZGzI/mrQx68czkYekhVSWzgakfsEsatzJDnOb1/ND7hTZvcKQQZNE07+EjhLGloYot
         kZPPJ7dF9vw85GfYgnIIYDc1NCjKcQrAg1DA7ZtA1T1XTXgQseadKMpxxI8SrlH3uKKA
         2T2h39Qgj28sKrVAApqL0wbJaCoz1tDg/FYsgpzKVQcqX/klHQ1SZTKbJi139pu/QQ6u
         t5fkHEjQ2tjZSxocYz5QeK/XN06vtTmgkhU0ELW3Ej8ORVjJwcZQHSzR5uyxJ2SDhvHJ
         Gv3c6IajS82wCe9K9Th2ms2gHfILD67wZ+OMCTj6P39iGNagdnzmtYuEZMrW32dfD7rN
         ZnmA==
X-Forwarded-Encrypted: i=1; AJvYcCUTWRgDT0XH/iYDBkwzohbIgw5P0f29Rqn/yZj5uOEe9zWiX0Tdo4tdDxP7P5n+Mk8xuK8O3Hsd8PyzYfRsGHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4Hm4CICoQwIuVfY/71sZxdFSUGfF5u498TAdqdSrd3Kg1jU4
	m+qNSGTeCHWXoGXWvbb3X6hxkueizJYs0uxPidf3s9n1f02AYmLZ8rzwXck6nigVgQ0=
X-Gm-Gg: ASbGncuLBNbnGHvUcmw3J6JRk2QZkVQP71RStTvP5F6IAboSSeCRpsdV2vtOMf3R4Ca
	lNEIiNWGKXMaRAO9IiuqXRJePSwm6yQ2gfl5quvROiG2wCU2yr7ksc0B+Gx9LS0uiuyqAYuuoQN
	41QJzlB+3G2K5Pu7MeSEsFw83s+gTb+LMcKbeT0qx61LmN/01eQNaQ8GjSSin48qPbxmCpMNsbE
	3jHTS4stOmJsW5s+oeDWkHIvmJDAEptP158ys/1M6umL71TMscu6PE3zpu6Rs3oeDTQunlh3lUh
	Wh0fIIb4NQF356hOhjvwHP/O1mVVM8k5cq4Hgz9Ilvx6qxIGoht/yg67u2liDm7ZPvq+c6Idjux
	1eKCXw/FHh+6JgkLLux9mepl4kTgL5tthHgG+O4hEono7k1efQR/m/c930QgZK6y+7cGpcrnKJR
	+H0lU5uw==
X-Google-Smtp-Source: AGHT+IGK45Cu7R7RqMblJ0H20sOThyXTHE0mGsTieR9rpgEJC68Mu7KEhV/qc0jaopljgaHcbYAevQ==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id ffacd0b85a97d-4283cd7a3a7mr11330553f8f.63.1761134639094;
        Wed, 22 Oct 2025 05:03:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm25019851f8f.26.2025.10.22.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:03:58 -0700 (PDT)
Date: Wed, 22 Oct 2025 14:05:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mtk_scp:  remove unnecessary checking
Message-ID: <aPi6eBlFLH43A4C0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kernel implementation of snprintf() cannot return negative error
codes.  Also these particular calls to snprintf() can't return zero
and the code to handle a zero return is sort of questionable.  Just
delete this impossible code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..9b624948a572 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0

