Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBE428DF06
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713951; cv=none; b=ke2OERJdSIwta/1pOBW79vZgTw1zAvASV7Hr+GI/o6hqBNLASo9ykdujfa7h03TxYIHVESucQ/6saAZrHXfWxdUdRIxzQ+8dALTpeM5Ejuvt/oM/RPy2v9CNnR1jPWPoS+tnyxK6uTGv8y+/EJAuLMgXM1iqZ2BaT7ztBPsGN0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713951; c=relaxed/simple;
	bh=MkCBu/XB5S4UUYAmw3Gyngrhm/WGqXfyy/Hj2WV/rQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ0QE+ogYvST2oAZomfOwb2m5Ptrk9LIh+PLznUpeBfcZw6Wdouvu6gq3GPaWTkPN29Q3i4CV8qxlZDa+gYWdIn4EZhrVuFfxNeo6P7P09b/KKT7Xqa7fQ6Bdfm2tvhzq3DxFz97PhGeJFT9L2QcLFqO41zIaFVtupMCZcjzCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InTuCRu+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InTuCRu+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3220777f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713948; x=1745318748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=InTuCRu+3SX/lQAxKFv0mXZDuqoOH2r1OVTXc7UJn/DTOPEuFlDT28J9+hpgHOhYDv
         qcbI1LW7C6rtPWPqQGtaKMn2vlRSyLlmsIZFjUDI3uw/v6G6J5IQ3fCYyFyUfVAM6wOa
         QPYw4bCyMKkUySYLRISRq/9vPP1mqzYmvTR/k6kS4Uyt7LRuBuh7HxX4LIjbrolcAJCI
         VkHJKoRlxR49QYtNa/c38Zyk8szu7030Q1UgMmv0Mwn2n0axiXoV2DJo1KCN/ytQ/sO9
         KMYChaIObe2IArzW8/Cm2hYlZPqzLMeHYR/2suDXVzPPrq+wy/4EZPH2BFldhkbTJJp6
         vl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713948; x=1745318748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=cBzcvFFUYGS6SBCLHSvhmxdYrUkAibpgjHQ6d/HxgYr0cnbF6UAYwJX1+Er79kL54R
         U2Sw8YiQ+x9c6McOmYGD/aqDbN5LD1r1pD2VrsKKjXiH8/MLjR0ETHB3ZGdsMzbEWXnY
         EJSZxwWGKLM1zvD/6ehhm4AN3+TmLZmDfbjrDllpMjz6+KxloBlHYpkG9uh2rEVHBV41
         MHeG1JhH/RMGwZGiJutzETreKsMsSVJKCnv/WNA7U/9Qt7KJ4KRoGvdSTmclIMp0zkmb
         MzwaaDJKxnafd6pZCP8CL2t9WFMwi/1UK6u9YgOlTWKUGcjbuR3r46r50jWqsAItJB2f
         Qm5w==
X-Forwarded-Encrypted: i=1; AJvYcCWBN4s8BWCKt2NV5RWff9DtS4JiQHpIC2vaWIOZ4lEYgfwM+hM8fqQhy/oPv861aiuv7F1j4r4FhqB/hkMi9ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCPh24rGAZP51RgCW1Jl8LK4jS+M+wuvMrnBUixni9GeMDt7yo
	MH+eFt19sjEZrCXdpnxQWhke/gGpr8ktbG58lyecFi4flSN+5ssyLgxI02z3pHE=
X-Gm-Gg: ASbGncuFl2mu+1w5tnMTEHQJBm//JqalxSzDqxQo+5taYNUNs7WGZTASdPATeYZp6pB
	u2xvgTYwFAVxwbK7rDJLZZC7nsPLekr9QLx23rjLVWdwl4Zxh6q+XCeJgQZibWA6C774OsM25oL
	6GxCI94Sga74Ry/jklrJKObF9lSUo8u7nhKZ+D3deqHZP/W9mbyHhEf1xLR6b5Lc1YS8Gpuhyzg
	jGBojljWWndhTyMoYYI7NMgKmvtBKfasEj/prMFxXNvGlGHWGnBBuSEDuParjrXeIbC6TXqJ8q0
	8OPTT7mn+0uBdqpxegAdHjYb0SfoDfVSR0UIvVxb+wwTcg==
X-Google-Smtp-Source: AGHT+IGCbFvyMPpLY+0TGJvec6wuV9t2NMPKNxUjFnVVx7rsRSV6GaToQxyKYgw2SV0wouSpipDAuw==
X-Received: by 2002:a05:6000:210b:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-39ecbc8a256mr7695306f8f.25.1744713948166;
        Tue, 15 Apr 2025 03:45:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf447777sm13613520f8f.100.2025.04.15.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: qcom: qdsp6: Set error code in q6usb_hw_params()
Message-ID: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if q6afe_port_get_from_id() fails.  Don't
return success.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 274c251e84dd..adba0446f301 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -74,8 +74,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
-	if (IS_ERR(q6usb_afe))
+	if (IS_ERR(q6usb_afe)) {
+		ret = PTR_ERR(q6usb_afe);
 		goto out;
+	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
-- 
2.47.2

