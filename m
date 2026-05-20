Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B72E9ED6
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 06:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256837; cv=none; b=qSN2UcSLQjlwv+uBbVyFzQCvIQOVp3V1lVSkVGphLuBIWl+zjzDBFikikRBSpoydRbhiLZDjaODYt8ZSe510LIAvdOXpm8nHE8I/VKWEKgIjezwMRFq3zbEN3m3/uynj6pnep5pGtHK3u00gTbrcht+o7YFrKmcTuIKbX5qxTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256837; c=relaxed/simple;
	bh=PwdFhbnaIbvzyL0ByKYE7HETeCMGZAIbkeJSqweSa40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBc3KvTGQW0TYNLQbd8Va6IVVTP8iPkbOd94lM8jTv8857ojqYeG08vMnGMbeulwUd/rWVkMkn+z85UhbqhRTE5+SOnvIqW03OA50N2i4kBbm0cCmuU5gBhUYMbLRf6gj9gjI/sF41eeVUmL9hB7HL+S4uJOC8zdNJOwcbBQc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRuM7iLm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRuM7iLm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso42934315e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 23:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256835; x=1779861635; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6h5aMTMM8bzIWFDjN53bSMUWPzwm9wWidLlXx3yYUg=;
        b=rRuM7iLmZ9hqTroKGQqzpwOggl9f9djMT0YcNIzugBySJ7TCV3RV+murkL2Gk7Ha9o
         WBRZGa8orNsoIo1HEVeE2WULyqkD6equIdBStlPxHrVyalB3qTfQyUIZrHfCt+DHxl5p
         cHTAIy2Ej63rIyUKjvHNL/lDl/lHkIF9X8Qf/ofpKPxwtDdiMb+CS92lG+n6mfDjJZUa
         2+YlkDgNlOcB3vzk4KWRcokaJi2+K1mEWz+OtEBN7B7ZNsQG255SaqxXpnRzlKA2L0vT
         lM5I8NAEh54dxDK787zxnlE1Mh+hFFFXxLIcdXJF+C+R2GQovmUhj9cIuVGiqckxC68N
         foDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256835; x=1779861635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6h5aMTMM8bzIWFDjN53bSMUWPzwm9wWidLlXx3yYUg=;
        b=TNtnhBvM1S3UIBQKCi2a9Ue3taHVHCkAK3v4m9KVi6BKbuOSQoSw1jgjO3hiQpq8/4
         +RkPOKFVYgzZUGZkYvkTDrs+dkmB5oVk6bnRKlzfaNTCvAEInCIiyggRcPmrOmgaWwx+
         I9E8CWt6pDnT979MppWsobEoIPu1Kxgii53JRSpJ+ZD77kvaWFO6btSi1uarWvgdRp7a
         e5NHNqN8eQBS/ld/Ma085LHjF4sKpY2VxjD4EFolKdgnMeHqGf8O2i6EULtyEjASUFrZ
         cFw/XM2ez4l7RRxPJp3gC1DNjlQ7B5ysDf5h7CC1+cKFjGqJ2KX87cKA7DjZ5gBfk/rh
         MQtg==
X-Forwarded-Encrypted: i=1; AFNElJ9DGenUq8V5JYXRp0ZRK355Aa3N1YVBAziUX1zwgHEDaIxl6VyWljYetKvrPro6cqdEMzwmE6+pSSgTTf/K3Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHF5sNJFawMxYWSjTTD8D5/DWVPgTugS261ZlembCgklOlf35M
	mHrX4IcRoqBxfpuz0hsOEYL7HpRmu4SuJ1EDxYsP+SJyyaXfuh4BC11K
X-Gm-Gg: Acq92OH+cO/qff0ca7Yon2SrSWQvBsumJqgtu9+CN4dgl3kqcIXsSxF/pRL7Qb8wFFJ
	4VVECSWAnkBpqxe6ltYX/w89uxfTBOAW6n97uaVrffTcAuWGI3QxVDm32ddzqfBGZ9Lp5fps0e1
	dVmtHCQUjl9sI0Pf2WRYmGXBx5jmSIqxqrcrvoWuJ0Mp6ztFSB0/Ww4r4m2wks2v9UELM8Td1R+
	MyexgaYViu7hrdQXZosvn1Qd0IRaT9dIp7A1XZsiIHDtVg+fudvtVYDq59cmvCWJJfV8I/9Z4q6
	KgqwTRZ0VBlYgXQ0pjQEML/aW5q8OiKnvq+TmJQKvbbCKmksyalMRnKlm9seLIWba4yadb8cMrr
	eNO+P9GrVTJySzeY9FQLJt572AvDxObsfwpmfVkZShmMObdaIRJ1LCpKpN9m5sDM/HDmbur57JU
	jC5nJdcKQcSEiORiv5IGkH7smCZxM+2h7Mcg==
X-Received: by 2002:a05:600c:c4a7:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48fe539519dmr330248945e9.14.1779256834204;
        Tue, 19 May 2026 23:00:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf86db7sm185387655e9.6.2026.05.19.23.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:00:33 -0700 (PDT)
Date: Wed, 20 May 2026 09:00:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in
 qcom_llcc_get_fw_config()
Message-ID: <ag1N_rAHEQ1YJsa7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_memremap() function doesn't return NULL, it returns error
pointers.  Fix the error checking to match.

Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/soc/qcom/llcc-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index dcc08f63e020..2006bfe198ea 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5231,9 +5231,9 @@ static int qcom_llcc_get_fw_config(struct platform_device *pdev)
 	}
 
 	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
-	if (!slc_mem) {
+	if (IS_ERR(slc_mem)) {
 		dev_err(dev, "Failed to memremap SLC shared memory\n");
-		return -ENOMEM;
+		return PTR_ERR(slc_mem);
 	}
 
 	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
-- 
2.53.0

