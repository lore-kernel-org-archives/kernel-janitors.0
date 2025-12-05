Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B91F326D5F
	for <kernel-janitors@vger.kernel.org>; Fri,  5 Dec 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934753; cv=none; b=X9QFo0T2uovRGc1qEKHKvLeccfdl8ki8+xTvKKZn75FiG5fQkdFbhvmT71fIQfmbam9VjK6eba0NDa2f4TL5TTTjNhOvLI1uEbTIHEcndby3+qAJ5bVbpVj51uZHMYiX5aCPC7yX9BjMPk7UUkXejxZxrX0fRkPmen2HKrSv1jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934753; c=relaxed/simple;
	bh=TVVtGnBO/kgt+MW43a4WOfzk9YnJRjsgyZDeLmIwQUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Puku15TjVNjPotLSEIFcNTlo/PYFBIgyzlhOk9l7/96lxAfXoX4QQP82EizkzIRzZG9jFXHXtiOnSDE8dtlwzU9SgcX0yjpJf4cR8C9ZRXBD7PwmUl1/UvGpLCEA+F1GTdR4Vd6Z2jTrLAyFKeB5KbxSOOvd7TWCSQBvoVPoS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3QBIYmS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3QBIYmS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a1c28778so27782145e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 05 Dec 2025 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764934747; x=1765539547; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8aX+EX0NpaccXweXp78xCHa7QYL2+QD6+NVQreKl8cY=;
        b=d3QBIYmSN37tc31xE3YCK4tMVilfQQUiOPnkcvanqKSw4mCnNTIuNxQgQRf+jEBOHM
         LqZU98xvdWE7V4Y5SgNB0zbMxk3UK8L4KplJbZkBpFpDXXumMZTWu/u8avM/UpIdiTJJ
         GKaiRiB74Odu7iWWB0RW06Ix7evS6B9RNi8QvG8lTNuKmGU5yxb1Ur4rPT5cTEP3bahj
         1fu5UxotxPwZ992HGoZNE2N9Juo8ZD9xzvnCys1hiVxivBojeVo6S2aVj8uo6h3xa1T1
         P8lefDST7YfAJcj1QdIaOwXOaMgs5ocIncYq9HVIm6afIhWJb+/agHFX94WmBx7l/7sr
         a9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934747; x=1765539547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aX+EX0NpaccXweXp78xCHa7QYL2+QD6+NVQreKl8cY=;
        b=K+tvBJ+frWRqYnvdtt7vljmouAS8MxeKbyH4kv/fS1XFFi/Qc7UOe64HFvdC0NdBBt
         9aatr7dQEm3J4G0HIzKG74C168OMzy+cD0rwsojM7mzWFPrvxhnDCNDmf+ITEjd1d3jb
         xZ7BzdrLOwz6Riwqoq1DVvO2DbQSJqXpiiUwSD+nQ3zbghy2g62wc2+G/AaMnNj2Tw7d
         3qnfQTWKqg+Bv1+Mda7dktTEjwGy0fgpstRcfVmdDAurOFmZkarQJk6pfjv/0z7M9/bV
         Qv3yQzuwPaTSLV7kXvDotcIDDbMgxGIaq0tYH/al1SMuf9mSdE87RLgFecH9i/fKHrg9
         gFsw==
X-Forwarded-Encrypted: i=1; AJvYcCUcDzdo5ay8mouZPDLCBdhOArAaVT533McDEVNJyZ1Bw3JXqsGY4PxgbnDVISTgFISdt8GvRjuelFR0N1YDmCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtisbCIbo1cVrJVp3ha1ThkzGqO+eiKhag53/RT/rR/kr4yCN9
	5k5l4p8QM6GNn0Q/Vfc/E3ifB0Wxkr+cWIOxcsZy+sy84+ygZwLkbssJeCP0eIQiuhQ=
X-Gm-Gg: ASbGncsYIyL6kxJcGFvypsxNUr+UAPXUs1Gd9SB1RYxJysVx7TItUM9oKqdBS47k/Ri
	215uaJjjHXpxLkRXxAwbU82wxDtXZHYrwKR/GYT5nAg7ODjLrIb7LMMwrwPl6A7dzn/MQkhKKZo
	2D9cQ9FhT4EuRnlIWy5eEjThTlSxQYZjM3jn2AodGHZcR3hP/9qvJB80hFsCA3umX11c+Ub0YT7
	boQXvZ6NhnJ4+dRIDzuisTcj2uXaTV8IJiCcMxJ2EJxj5WvP7W6ibe62mlehIxLM3TSxq2BI9uv
	nV/x9EYDQ2taqQYeI44IrfSrGL0jUkc3/u9uLOuLpvyb3G+E3K9TjQioGQE3JhSHMYc3IBnSUZC
	XvRnlDJ1dVFxuQfrecfL2x/adc6O1J7YWODUCIHqV6N9I+wi7g5Tjz2Xxg9nEGvv1TTjbU66FXD
	YcbpnfJMueVOYoizYk
X-Google-Smtp-Source: AGHT+IETbivJfBcDFqX/qYauRBKsQ++55ebaSqc3KEhL3Ernui7SaVmRbHIyHQmMXTPmCfMZXsNxvw==
X-Received: by 2002:a05:600c:4584:b0:475:dd89:abc with SMTP id 5b1f17b1804b1-4792f25b843mr62826545e9.11.1764934746896;
        Fri, 05 Dec 2025 03:39:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47935fce542sm23520885e9.0.2025.12.05.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:39:05 -0800 (PST)
Date: Fri, 5 Dec 2025 14:39:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] crypto/ccp: sev-dev-tsm: fix use after free in
 sev_tsm_init_locked()
Message-ID: <aTLEVmFVGWn-Czkc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code frees "t" and then dereferences it on the next line to
print the error code.  Re-order the code to avoid the use after
free.

Fixes: 3532f6154971 ("crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/crypto/ccp/sev-dev-tsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/sev-dev-tsm.c b/drivers/crypto/ccp/sev-dev-tsm.c
index ea29cd5d0ff9..06e9f0bc153e 100644
--- a/drivers/crypto/ccp/sev-dev-tsm.c
+++ b/drivers/crypto/ccp/sev-dev-tsm.c
@@ -391,9 +391,9 @@ void sev_tsm_init_locked(struct sev_device *sev, void *tio_status_page)
 	return;
 
 error_exit:
-	kfree(t);
 	pr_err("Failed to enable SEV-TIO: ret=%d en=%d initdone=%d SEV=%d\n",
 	       ret, t->tio_en, t->tio_init_done, boot_cpu_has(X86_FEATURE_SEV));
+	kfree(t);
 }
 
 void sev_tsm_uninit(struct sev_device *sev)
-- 
2.51.0

