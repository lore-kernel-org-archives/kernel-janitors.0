Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54784261567
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883434; cv=none; b=bYhhX84MmSeVXN1GZ4Z5w9vYDRQuP0+3zrmFg8rpB/GOavMuBG5coBIZyy0AvSJJwuR2cQn7bx0RtOxgoaHlnRpx+c2895vbGpWkXTdAmKh7Txx5pls+hCPRUMx0x+8RP9joYF7Uv4OxP/KAxIYy9Av5qq+k6/PYElh0DSunwVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883434; c=relaxed/simple;
	bh=xdhY4i/4GmBeAEvuN5cExv1PDZ7T1+ihe9YtRMBSKkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jwU1Xddjhwet84wVQ6TsTguKPeSe+pxeWtUs5wlvaz6mi4Lf53dEzb71NS/BfYDV45mq9v/Eh6llJw2TlDMaCC9QT48RzArFUqTgVKBxswtudPYfpoZGqpsJP9LPbYHexm8nYAogj86W3xa7Ya9F5TqLarqDayCSnWbqqE/zw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU380tx1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU380tx1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220bfdfb3f4so110050175ad.2
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 04:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739883432; x=1740488232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZcqyjOBWZ8dnPCASAUZdDln2E30z/xY6mpPONMi8rQ=;
        b=UU380tx1IsekklDl1cIEwGS1RP4SvOWuAdlv4ik4KtS/G+dt6Ctr2zfmKzV+asOxRg
         flJR+8i7ABPdNi55q2qrYHrjIXoMP2uAsnhp8ZKk8/M4jhTRB0ZHvPdsm0PCtOiFLHuK
         2m4ofiTD2Q1mUqiNCwsGM9yvedwAMEGNnJodaVhGGaCaMBog0F83ElcR1NnJzwLGYEWr
         b7SCoh1V3BxpyK7AS1tMbgWq2EKPVziQ8o1Y3nRfmBRKnJNptUdDKA8LrTRoEKxyeqMK
         ZraaufNlvLNojNWUL7mjBdfSiRyNR1Mb6UVKBFSmA5VczW7+AuIDu+gxbIJS2/+TgAfP
         4Mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883432; x=1740488232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZcqyjOBWZ8dnPCASAUZdDln2E30z/xY6mpPONMi8rQ=;
        b=i7s0OUoBZIGm0ItDDjM+dSSr0Ci/U5L9hsxT1Qsm7oxMuBodc0EuX6glrS0L1ulPy2
         gX4uVhtXqTn/VmH86+MNvxdfTOUZqWT/h8RiJUG4lM12vOF6hildcdU7DV2Dt6+CurC9
         t36HicfwJbYf4QsYOBh2Sf5jLpRVC5f4U4jWZHiW8Fr0zPTpzAscNjm5BvvPAftlHEjF
         CCBlOhG6F/IoKs/piBVeeKxwZF1AGz0D1ileQZQSaqzI8IPKH2NtwBXl7c1BcyXJPXcf
         ygQ+9iauwe9JlasKMr10do+cCEznh/3jvxovlbiIr8o6Eq1c4g7q5p/qiY5CL9HRXRPl
         1yrA==
X-Gm-Message-State: AOJu0Yw/zYueELnNArBDTBWZpIWBZRHFbwtU/ve7TgKJQ2lw9mp5R+i2
	+/hBbSVQ5AGY0QWkyw/7TMvqv1ts/OJbZ8yOPRD1BvUQS+Ju+dMbG+/Nr28P
X-Gm-Gg: ASbGnctLKm0sUpPaLPJyUdhowHMTKK32VIe78gluY3XVDXM4VpPRMgdu2sgHq/61FBk
	Fso3EM0Y38Rzy/h/8F8O8PMLsw7O3CbbUR++2jYYUjLEE/DSXugGZgjnpsYRFohI/Bd8JhIxeTQ
	HhY0/epIa2gNk0Lo26e9fc3/xdYRPg/nkiDbc7XiWc3QhzHMfqb3odV1+u31mP3HoSaO6qk0nTp
	Mxrgz3PrITbVrOreHT31ZzcVnUTYyOkJtJvpKjs2uQO5xxXYYz2Ffv/ghY4Q0Pt7puvqax2zezf
	C7T1sOEc/iNa1eAFQzWBj7ocDpJbmnxey57FsJRC/jJ8St0=
X-Google-Smtp-Source: AGHT+IHtwA5ZF7Y6H3kb4RFL9nkIATSnuEeVjUZlaScIOU6x02hJa+Tcjvm2mOmCTIAUP8rhKSFz4Q==
X-Received: by 2002:a05:6a20:748c:b0:1ee:d1f8:4ff7 with SMTP id adf61e73a8af0-1eed1f8987dmr266742637.1.1739883431925;
        Tue, 18 Feb 2025 04:57:11 -0800 (PST)
Received: from LAPTOP-HLGLEP2K.domain.name ([223.185.131.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324275bbb0sm9997996b3a.121.2025.02.18.04.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:57:11 -0800 (PST)
From: Viswanath <viswanathiyyappan@gmail.com>
To: kernel-janitors@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] i2c: Fix grammatical errors in i2c_msg documentation
Date: Tue, 18 Feb 2025 12:57:05 +0000
Message-ID: <20250218125705.1050-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following grammar mistakes:
Makes only sense in -> Makes sense only in
may have changed those standard protocol behaviors ->
may alter the standard protocol behavior
No functional changes.

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
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
2.43.0

