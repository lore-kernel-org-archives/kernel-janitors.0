Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26C9A35
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 06:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708496426; cv=none; b=P6WWAaMgNrsx2BJB2rMvJOFY2IBfZqux5S7+8E2r5af2mUDbIwi3J0vAT/DBzPjikcZCO+z/2BB9+4qD1BF95KWyFfmZfWiovrHlK3Y41WDteuxTIkUhS0dKseBrJp7nWFjY/EzF/LOg13T4JW7mIFwNYg7J+E5caEhXQu+4e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708496426; c=relaxed/simple;
	bh=Aa84HSv1+2OvUetKNGlbuxpski5nWr6VCsHSEhRtETY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DL3rf3Z7Ec/O+X6nMRGPVj8PTHOxEj0FYBFfudXNbMRTUFvMNqqdml80nIRKfv5CFCN5jy5MtwIbQPd/Xh1VeUt78Qqeq6W0rMZipf4IUCsq3OOLRZCDGVrn90TREpt20qAKbcOTSFBwYACKijwPE6100eBdzv2mlLFMqVocxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m49MalvU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m49MalvU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so1120879a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708496423; x=1709101223; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7BDvVnOFI8EfULdSJBhx0Uoarr0dwLKho4DFLKCbPE=;
        b=m49MalvUruAIQhB9yuPc/uMVxLpvLNAfVqHVv4KhEPUMQhYBLJRobwiUpuh8t42HdY
         ZJMQoNnDsIVTIN2gvvcttjk1Bi9c8/m5O6XS4ZEsVMm1ihQCeNjchr16KKWRoh8RFg3K
         LmGqxYNXggdcg/gRSiaNkJZPl0UrTx5qLBdC+meD+BGxSBNNrBjqeu4qYfT1rIEhp2WW
         zUKe1uoEiv3AsYzGmJD8RCNhP8EUQ2tFPYleHp2iWdHz9s3kjZM7Pr7058HBAB1q0GZn
         3wvMVR6sfBeZdck2lbI+ftSDI8GnZ2Tlacx50uPhhpbvNX4VklI0tFjXVhRvnYBEvPGs
         4Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496423; x=1709101223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7BDvVnOFI8EfULdSJBhx0Uoarr0dwLKho4DFLKCbPE=;
        b=HesJb4kyqo/spw6V86UoFz1icVg5KtCDxGyMv9obaG9+fqQYooyMJoIhUHQc0RDCEZ
         EEPn74igJ4v5/m9R5ljLvhlSJHTzl27xRQjKxTLPYuBg2dpRLXNCSCu8fLuhNYvMbI8y
         tpWXAY7SnBvo5ssRxRqJQrAS973QlHz7RZQuaqveVkI4izj31c3Y97Fu9muQaN3RJTwW
         jYuPZVr+ZK1X5I2q/9uyFaT4PKLSMPBfpL2juC05wRjrKnZNKRLWnWPefDQIKGeM+9no
         LJiIOLPY9Pvw9xgreOIWqycQcNO7Lw453pHqNC5tyj0IREynZcoL/9M4iZCNb4tfHR+Y
         9JUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjdNjRPOuxnSBhkGRor6OlIm4YPbYeNMzg4gXcPTjMz5ZSlEIE//vJ1E9B3zmshU+Vdv63msUT1hRKiqvHNS1HptL3wmbO4lSYeBsnSeaJ
X-Gm-Message-State: AOJu0YzpkyrfJVDb5beOfaZD/XjmtJpladh9CW8efSqrRk5v83A/6UJL
	M1WKa7mdDbxrfFHhl9zvdxx9+XQ/qy6P8lbahLvRolaPQpWRXp9Y0sNmk2OmJ8M=
X-Google-Smtp-Source: AGHT+IEo1seUMFO75qlMhw5YgJjVl6BOsKnCUA2331SaQXoJuA959myuBNCXTpBpJJToej8dHPipIg==
X-Received: by 2002:a05:6402:17c4:b0:563:ccd1:26bd with SMTP id s4-20020a05640217c400b00563ccd126bdmr9951812edy.2.1708496422990;
        Tue, 20 Feb 2024 22:20:22 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id c1-20020a056402100100b0056486eaa669sm2266459edu.50.2024.02.20.22.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 22:20:22 -0800 (PST)
Date: Wed, 21 Feb 2024 09:20:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alex Elder <elder@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Erick Archer <erick.archer@gmx.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: check the correct variable in
 mhi_ep_register_controller()
Message-ID: <bebcd822-d465-45da-adae-5435ec93e6d4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug here so it checks "ev_ring_el_cache" instead
of "ring_item_cache".

Fixes: 62210a26cd4f ("bus: mhi: ep: Use slab allocator where applicable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bus/mhi/ep/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 8d7a4102bdb7..f8f674adf1d4 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1497,7 +1497,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
 	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
 							sizeof(struct mhi_ep_ring_item), 0,
 							0, NULL);
-	if (!mhi_cntrl->ev_ring_el_cache) {
+	if (!mhi_cntrl->ring_item_cache) {
 		ret = -ENOMEM;
 		goto err_destroy_tre_buf_cache;
 	}
-- 
2.43.0

