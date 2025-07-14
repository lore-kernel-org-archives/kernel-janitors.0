Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E0253F30
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507860; cv=none; b=jAi5tIJB/RczFj6XFvjE/bMRMrqVaOJbASJ+hn36L3LP1PCzDHt1vg5vLyk+mbL62p219IhoSzFG2UJzIxFQjrioTEl0JP8xGLyq+TW4IAyHJynBeLgSFx19IoSnEpOLz5GMT2D2PeFZIdo7WkM264GsXM/XnWqjKUMO/raJs5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507860; c=relaxed/simple;
	bh=MbEGKoXXMvcb8JlITesavw9wVQiwklgBT2LjVdJjsW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFsGDTqiY6WUWM54lhC3aQCVbotNAzasRyFQ7Kzzjn33YlcveJ/L2DuTFiRh34Zku8KgtTdUmAEXanb6rECFGxuDwFHvkjKUTiGa3tl/u/yAePGSw1cbfCDcSGpHpMjpRRI52wFuYmDYXXMpPn4UrLe9PzvGV4kIBIp92JXGp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfm87HWV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfm87HWV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3763506b3a.0
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Jul 2025 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752507858; x=1753112658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLC30LzgHl41yXkiZdifS2W/DNFff3VOEouB9613O/E=;
        b=lfm87HWV1oUKL4uGR8TgMcdFMojJFw4c6yguQYlO0SQd4V5zAUJqcWkdlJFL6Z2PnT
         nvQVngpwJcjKhNSUMXK3jpR7+3hLGsz0deeNSMf3776sSaGO+hIOAs41YkUGR35beZPJ
         MpTu2TKYNC5Z7FR2DDkadkUPcmJi8NvDC2UXzH/Zzc15C0WGReQR7H0FPHRcBL5WHADW
         Z2AlPGj+SgnBLraHLl3n9r5hvIYRGhCHwcdqBjSHxUeIVMCVm1d8LBpAcC9950lEbvvo
         6hIl9rOawfUkZAegw257VqMc0jKoIYYa0ODD2R1oNCKr1LMRcllR4rAALUOPt7QQ5WTO
         IzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752507858; x=1753112658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLC30LzgHl41yXkiZdifS2W/DNFff3VOEouB9613O/E=;
        b=SafoR2/lS3v0gDaIxpC1L0wPACgxwzqgjLH0BD3829CTi8BqPqz6NFEwDdVSRGl6KK
         5yM0LosDn0N/OLeaK1oIFLiRcyrBOpteUyOLD0UEiH46j88h5dafSdFIhFcXobNVkl71
         cwhyq9cS5Mu+X6thoC8D099h7MBASz6DoVw5aT9ODY/sKoUzLwdcFnooPKFB1PYlOOTI
         ClTeNnsn+bxO8XoazjulGk+tOQOv99ygWIxuquslyCaTyKl01hslM7uba+oQ6AkpF57C
         XvFsn87ynCgRmYIqrkyOs5M8I153x0DhwCsSBuUYPLiTXA8EH3vlDe5MFF80UoHGN7WK
         zgNQ==
X-Gm-Message-State: AOJu0YzuFvLRqZ02/MOmuVHTH/HhuPWxadg62zpzvwh9e0BMHyjWPPF2
	z3xpZrK5WFnygrnsIAjz184P170LyMWfp3XCGsGom8oxBjnsnbeAcMZW
X-Gm-Gg: ASbGncu/bEH183SsalVvrQ5NFumBjk50DdsJcwKpADmVGV/g5GCAccnP7S0GQu6xzIp
	skLDrqhVMH4WZMJBPRTBssiZ53jPLnX0KuSrlw2g3kUo11PKg+m9N4cLx+RYlpM22ndszPrs8vk
	fb0/f6Eqee/UZYc/CURJXWCzQTKXSPgxUmrNgvhfhg3+28AJuVqayNqLxCjFjA6TXR++bEC8+Rx
	qeEtPzFyuflIW/wlpzemKkjd24EMcS5P04sQ+aSLSQ9ll4n56EFcT9yv2GR6+2y+QEaCp0LjGxq
	jj5R4/dJAbRueozC2h0n1mezQRLvVNRrkT6HQXFAEeDzJTnAAhvv4odny4woxnltCSSzoSZ0GbR
	WwsxOmuV8iwtFJV+h9uhXGkpFyWfGIFJiuqD5RYh498wX/A==
X-Google-Smtp-Source: AGHT+IGcmPGJrhaRg4FZkSPFtmP7/c7bnhBvq/YncTXK4oeDGRi9dRjDpAFt2B0boYSd8fR7HifNNQ==
X-Received: by 2002:a05:6a21:118e:b0:215:e818:9fe3 with SMTP id adf61e73a8af0-23136956a02mr23605600637.27.1752507857736;
        Mon, 14 Jul 2025 08:44:17 -0700 (PDT)
Received: from localhost.localdomain ([223.185.134.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd8c2sm10386258a12.39.2025.07.14.08.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:44:17 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: dan.carpenter@linaro.org
Cc: kernel-janitors@vger.kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v3] i2c: Fix grammatical errors in i2c_msg documentation
Date: Mon, 14 Jul 2025 21:12:17 +0530
Message-ID: <20250714154339.4740-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714154339.4740-1-viswanathiyyappan@gmail.com>
References: <5034bf7a-e415-478d-912f-5442bdb28143@stanley.mountain>
 <20250714154339.4740-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following grammatical errors in i2c_msg documentation:
1. Makes only sense in → Makes sense only in
2. may have changed those standard protocol behaviors →
   may alter the standard protocol behavior

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
No changes since v2 but updated to v3 because of the time elapsed.

 include/uapi/linux/i2c.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..aa751389de07 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -24,7 +24,7 @@
  *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
  *
  *   Optional:
- *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
+ *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
  *     in kernelspace, because userspace buffers are copied anyway
  *
  *   Only if I2C_FUNC_10BIT_ADDR is set:
@@ -66,7 +66,7 @@
  * @i2c_msg transaction segment, beginning with a (repeated) START.
  *
  * Alternatively, when the adapter supports %I2C_FUNC_PROTOCOL_MANGLING then
- * passing certain @flags may have changed those standard protocol behaviors.
+ * passing certain @flags may alter the standard protocol behavior.
  * Those flags are only for use with broken/nonconforming slaves, and with
  * adapters which are known to support the specific mangling options they need.
  */
-- 
2.49.0

