Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9358B1A2388
	for <kernel-janitors@vger.kernel.org>; Sat, 15 Mar 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742033071; cv=none; b=ahmdC3vu3v6B98A88upj3j5BKV0L+/z5JHTrDbBPRYR+0cSBpK9AOPVsA+H2acHND8D3VaFyjS3ncdHx8Ec15h6vz2KEuft1pFPRi/mbs55zcGJtw0D3k5vtD2L4eqpKPtyMFXFtJhpKnKZx5sa+Jf81MQum48Rih0AtLmPr2Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742033071; c=relaxed/simple;
	bh=Jzfw4uS+2xNHSt7CL1zvCanecwXZCQddc4jFWIgRqxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1i3JRnFE3E5GvnYNLnvbaMoqj2ShfCyca17JS24qVFK0eNPAUXB5ibbOSg155+XJsqbT0gGYGwsHfdP+k644e3lotFboURucxx1Cj76AGlcobiZyb11t3Q5L/11e9z0TZzAffFzWkysM7wSmaGyFBxPTbLNPaX+vcRYNHs960M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2wa5mKL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2wa5mKL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so2563975e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 15 Mar 2025 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742033068; x=1742637868; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Ome34xzBD6ytuYkcLvh0hzc1tsMwWzkshxKre3ePFs=;
        b=r2wa5mKLhJJvxdKhng2a0DPJKyBFH/H6HWY/AXEwv9ak4OS4SVbGlGxAwJ10UEIGZC
         6ImPZUBk5gQOd6ZBZjNwElFLjEh3mdfOXj6HEMttysQ6scvRI0uP/CTiMuFHggvVIUPW
         df4nuFdEYYCauO/9tOD7MRxt4cFMW7l2Eub+DBf0rXlZqO3bKq8Inytt27qQZXmw/CQ/
         Bj/kdFAELlqYU7mbQOqkPuDL+wmrIjRLw8qX8+sN4vLuXpw7DZPsyD4M0m2mh8BNTbJm
         u3/ltC2CiTz1/STc946lTd1UhPE4d2Mc8r9hzcceuE0K26IOiWtO+IqmzMzNehwMN3M/
         4nNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742033068; x=1742637868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ome34xzBD6ytuYkcLvh0hzc1tsMwWzkshxKre3ePFs=;
        b=VLqV2JdkcVhtNLPWrykLS7SZV4/9/66iWzt0NUG+rrRcQdh6F4sQ+C0CAl1w68oq/i
         Cjmr99q6FC+i0Z4aeu932yXfkqJRUfngr6S0m4xuG57Wb+qxaAFamVDbLOKMASHL7S/r
         fX+j1/yl5RiFZ+iX7kdifnKAC0u/LAoF79AR5fyeSAJvOcbszJrfcroXXlJvczWZvPbf
         liTzSzkGxC6ZJ1LcEHnrLkmZpOMyI7KLdADxqpp7UtJRv42LJ3pmWR4oDrI26/TLmzIK
         VRahQkytThVcpnlT7rvhRl+avoovB5HOea3C4d1lXrSUy4+Q1U2m+Y9GWR/rWoiByidW
         OFsg==
X-Forwarded-Encrypted: i=1; AJvYcCU+E5zsA7F4dZq7i78m8EzFiAli7EdB7VWIV0oVCBQPRiUyFjdxoJ9D8uRWWrshMVTYQySBmMPGxngjt70dkmw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eMbIEv2JYxMbgO7UsFV+7Vt05Ga8PXbFrMXScNOpkEWG3pkY
	mkYvejuRIBQ17ZAzDF4+G0VXUnyW2A49hcTkmeHPIkfW4m2O2KRa74vX6tvFwmg=
X-Gm-Gg: ASbGncvYsqwG7Mb6i7ljgIex4fGs3dBTzRQRxgiKqdiPxdTjVHSVme0llnQOZRjhZIr
	NHstKlPKV2CYE1zpIDYpn7wEBRwk9V4nSkY4pRyNUvnYUkPWTWpTbwzL4DWknc2XpErZB3VoE7d
	BrnitMaS3WCg2hRgrGDwK67xjyQ+GmraVldZgWmHDwzuNio9wAOTd0tO1RYOQCQbxSOY1/plD9e
	ywzaMmp804gYmhbgjQ+4kcSu0/xxr5J0Gizf1Bdn0NumtQaWsIm9OIXitjuxa0jFhlZvJx7SsVr
	l6FPiaVrwE1vEq6E9AgbQU7Y81WZhe/RVkZOn7fewzS0tzfZFTPtxo1Jn7L3
X-Google-Smtp-Source: AGHT+IGe3a17ib1rZeRVb9c77roGjaqcKEfvjE/17j/FdHz+4lRmpBlGIjmzzYo/ezgUaqKEpaF2wg==
X-Received: by 2002:a05:600c:3515:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43d1ec622ccmr51862355e9.1.1742033067870;
        Sat, 15 Mar 2025 03:04:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d1ffb6292sm45076095e9.1.2025.03.15.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:04:27 -0700 (PDT)
Date: Sat, 15 Mar 2025 13:04:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] firmware: thead,th1520-aon: Fix use after free in
 th1520_aon_init()
Message-ID: <f19be994-d355-48a6-ab45-d0f7e5955daf@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Record the error code before freeing "aon_chan" to avoid a
use after free.

Fixes: e4b3cbd840e5 ("firmware: thead: Add AON firmware protocol driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/thead,th1520-aon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
index 4416e9bbf854..38f812ac9920 100644
--- a/drivers/firmware/thead,th1520-aon.c
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -203,6 +203,7 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
 {
 	struct th1520_aon_chan *aon_chan;
 	struct mbox_client *cl;
+	int ret;
 
 	aon_chan = kzalloc(sizeof(*aon_chan), GFP_KERNEL);
 	if (!aon_chan)
@@ -217,8 +218,9 @@ struct th1520_aon_chan *th1520_aon_init(struct device *dev)
 	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
 	if (IS_ERR(aon_chan->ch)) {
 		dev_err(dev, "Failed to request aon mbox chan\n");
+		ret = PTR_ERR(aon_chan->ch);
 		kfree(aon_chan);
-		return ERR_CAST(aon_chan->ch);
+		return ERR_PTR(ret);
 	}
 
 	mutex_init(&aon_chan->transaction_lock);
-- 
2.47.2

