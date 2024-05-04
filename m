Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7D1C694
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714822013; cv=none; b=pM7lmfyfkiJOXedwyzbTDMOHC1eSAkZa+8URO+nlIztAMCOZ5YKQ/dmQ5a+1RBr6BkZNwVUgRAzRYOIoT5efc1wyHI2X7OThHhA64kh6nuaqvLKIUTtTBvaHqzZV1UWy8kYuACUOrDECMmujIsqHg2rqBmjB+NAIN5Fk55j9t2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714822013; c=relaxed/simple;
	bh=ppFfFH2Xic9iAVwfgNcWsVQ85IK5kVSydtT3vRbOtKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/66KssYNrOX2OIVJ2vlb6T85XPHM35Vodoig9vVDgbhVmjCWvmG2vepPDzc1bcrB3I44RHYxvgLOfevrYhOtivd0WINxR6z9ZBF+kSsUrYfTeL4gG+4HS+ui85vLmRPbUIRc2ws/BTctd3dX++mjidGcccjl6Bh9edwny++2IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WYdEVS30; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WYdEVS30"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41ba1ba5592so3378575e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714822011; x=1715426811; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=WYdEVS30HM7KTDlgLgubFM/W4RTcrUan/ZI3d6SDmUOc77JyCzbPJFah0XqjPIEByO
         v2kfLAdcNGBQagU8an1IZo6lJvQivefab7cvA1DrT1dKDS6ZTC3qoMpaXwH+SU1embep
         C8rujm3FjRgevjqUkbivPywsKzwuPcR8a2350uNIAhbDKPGkmsyBFstVSDvui5TTds3Q
         AulbFrSgekGo7jJZEkpmUAlt2TdPWauguF2njrIpjTg5P6cmToKLKH8lbPyjzi5xk5Cj
         5Fhxwt93z2HyL1lftZHjAidBRudX8+fm75xvfN2KNMhoJ8hCtFwnTgh3fHXXZlhm0Z3z
         pfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714822011; x=1715426811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV/srAsSb/6dhMxlpXH3Ch1iy2rebWL62TcHi8lGmvY=;
        b=F/jaMje6mpPIkXxuIYsIfqeHhI0lNzsR0PnP+Ma42FNPNHBXAu0zcFsA11yUqFxkl0
         OThyo8F6Lc2p9LWjJ5VzjcZ4APHAxlYWGFIU2alChUe1tpmGByV+eITVejyXVestx4by
         O0MTEo8wn80ubgfZcIL9RsZo7STKTgntBKF0sZHfpEvaW+iOfGKJ3yppZBff1oDqn3Bc
         mPNQy2L0vlmtA+tkwA02mxqp9zwL3WUxuP//9jC6VS2EOEeEU12hAKHLi33rb7wnM2cJ
         vdHsTfqahojS4UJNGvxg1+BgXSBOFhBanVHxUpzk+zlC58SKW1Dcju4QT3WotDc3y+hk
         Bxjg==
X-Forwarded-Encrypted: i=1; AJvYcCVp7gAraNcem+lwSujtVJvG1Kpg76DX0HXwSIqJICbW2Opqz8DldP29hnf3s9YYt/nubeBB6QEyHX9co4Gv33Aamo4aWNEkao3Rhn05Rv5P
X-Gm-Message-State: AOJu0YwvvsjLeOQn2q+pQXkV8ExTj0vOhxXgQ9MO7AJnVagWbqrEUpNv
	VfseRsfjbP4+E8mIFKo8V+fzhtP1lZ1+lSbRW9YQ6RErdTj4/fn7ZsAS8WSZmGk=
X-Google-Smtp-Source: AGHT+IE3ubSq/wuPsXCd+SyHjRU511lcaaoiLbDliJjNVBEkZCScLOt8UDgKVnn0wXxEtm0TJxiXFg==
X-Received: by 2002:a05:600c:4f52:b0:41b:7c07:cfeb with SMTP id m18-20020a05600c4f5200b0041b7c07cfebmr4493542wmq.40.1714822010816;
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b004186eb69a55sm8958487wmq.25.2024.05.04.04.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:26:50 -0700 (PDT)
Date: Sat, 4 May 2024 14:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
Message-ID: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
allocation failure it leads to a NULL dereference in the caller.

Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/mtk_scp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e281d28242dd..b8498772dba1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1156,6 +1156,7 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 	scp->share_buf = kzalloc(scp_sizes->ipi_share_buffer_size, GFP_KERNEL);
 	if (!scp->share_buf) {
 		dev_err(dev, "Failed to allocate IPI share buffer\n");
+		ret = -ENOMEM;
 		goto release_dev_mem;
 	}
 
-- 
2.43.0

