Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B529DB9A
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743601; cv=none; b=RMSsmsMW08wBjnOumjVLrcQAmgYScLeKzuTqOLzef2uXOlf02gjtTcPbHunDeA9Itv5XQdGYZJQU3PiAI4HdDXivW//i1Uq+OV6GFuA6gzkPH4Vg9HStPCYO9v22GkuDd3Qw62U1e71TGkIr6lCLwKTl5+fJc+1FHgPHtFT/2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743601; c=relaxed/simple;
	bh=gKP7Hj4PgjLdlCElLMQoEHfgYE8vw4zIpqeIgVCFNzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWNBAdxM4GbjVgGU4gch4Le+jBhfeupiBtMJ5XVCOpwYvVUFG3u2DgTwHlpviuWSg1XXd31V0ivFqEN68idzSnZkgug9t5+I7lSft4RYQ+dotaITIBYW6hPisjL8hfb1KcNry4l2hVuysc8sBFqJJdk5I4Vnjag/MOA+L/KrDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zRq4ZVv3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRq4ZVv3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso6489730f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743597; x=1762348397; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=zRq4ZVv3ZfmNe56SwASuyxsdNsJWgIA2rm0czxuAwnoQ/oa0ozvwewyxCewZ4XySnm
         t0s7+jAMeV3rRuSvvDBkVYO4isGWsoTD4ZU1V/n0T/XJdbQr7DgMpq+DAiSDCpQzD7Bc
         iRIpd1PEzDsY2HP9JwTZROtwOma3levQKCxvrTAyes/0l+Uo6Ogxkj194Ffxn9Fb+0Ie
         knFN/sw2b/21qgWW3wNxbNcPgE8rz12hA2/JdSV9cKbNsp9zCtrjL/9fOkBfWLYUDy6+
         hMZfGe2TDxwQtHRsAKLzZWEHMhLTRDSZvrkhIjCR/J34TBB3VfBtWKnJmhULiDGkRtaZ
         gQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743597; x=1762348397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuIsZJAikyEekZcQ72lnOaH5lxPiOYkA7xu56IYCNWg=;
        b=Q6L8l9iMlrjmfu8q1u1lK6bfRJGli/GoGkuohm4diOpMekf23lG4CrhUNV+ZNwHFLF
         hIS4zw4oVAySBEMYGK2cBNSl/B8h0poi2XHMpD+cT2v+BITMXaK7kBTTpOR+gHweHRfk
         88desSb622jUatSlyPz8haIWUwiGsD7MAvde7XtG8mEXcv9ZKABb9bWvvAKAcCClsAnZ
         wR6u/RlMtb9f+m8BE7yMve1sbVhvG4jRog1RJYVmGFVtl/tXFSMv2IC0SxDIFBtTKGZI
         pSKKnLe6whueaealG4VuzM0TFuIsfWBmgbdb2axcXFw07RI7O9xIVSuLqUjyzcBq9I/L
         DWGA==
X-Forwarded-Encrypted: i=1; AJvYcCUxNmYPZyiwFf35BMK7d7RDYm34F0w8bk1rl93HvIDLKgIY7CxLqE34MV5cOCgcu+wIeVVI8h6XcrdUYMCNMz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxIe8XbTiXE3HEIY6fE/3ufUJKf/yZ3DApBf4klLgIssyATxp
	/ib1EvoeHYQZQIGOqkQsPGg2/E7QDhPFx1ECpBdIYg2XHgIzYUVwMnWXVtlPmCfVcG4=
X-Gm-Gg: ASbGncvyvc3Veh8ZY4vl64OSNoVZaUh4391w0y2fZp61PY8gOwGNCKoHVRmlFDkS9x4
	8GXgTiHflVCUn8vhYSRnnMc8N9PtnIaI5TqR/stfLs9tA8MoLcCd2MOaH9jhkLN6uG1p9D3pPRy
	iHL/RfcatbuugPJNzfThOdwTtL6oKkFUwVzFTsqMzLkphBoEj0l0oLGRnKSaREo872NwXBwMy7Z
	0j1QSMxHwcF3cDU88U/rh9LVDN5CLv1iyDVTfaS38Lb3ualsP0KCgCHD5f5gTl8uTne2d15zt0k
	K290Vy1uaOAE7TQ3ztCP8Gxp2autj54Y/KQC3ZBPIjFux6nhs5AkEpMVysIOsuqjvz1sue4s1RV
	2VvC1MVuFqMqXB5sKrGlAg9PO+a2RVXy0YdXegUiyEQRT/fH7ZUSALtmy2PdFP6Oe6HZEcO7PGg
	zj8k4xLgzU70wOXmUR
X-Google-Smtp-Source: AGHT+IHWVrau2m4RaNjTyO72rP9dhKVo76M6sAXBvO9VLZ1VFeKc3lw8F8BaYPpaPHfy3t8Vo31Ixw==
X-Received: by 2002:a05:6000:238a:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-429aef795fcmr2632000f8f.17.1761743597111;
        Wed, 29 Oct 2025 06:13:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df5c9sm26362401f8f.41.2025.10.29.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:13:16 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:13:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <uajain@igalia.com>, Stefan Wahren <wahrenst@gmx.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vchiq_arm: delete unnecessary check
Message-ID: <aQIS6Q73Ss8xyJTD@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Both sides of this if else statement print exactly the same thing.
Delete the unnecessary if statement.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c   | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e2cac0898b8f..130be2f58342 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -4001,10 +4001,7 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		}
 		*s++ = '\0';
 
-		if (label && (*label != '\0'))
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
-		else
-			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
+		dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
-- 
2.51.0

