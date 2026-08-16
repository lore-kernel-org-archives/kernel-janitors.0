Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0D230C16F
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Aug 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786890133; cv=none; b=nirgjuIlngfSEL3XLeIwnMb2t3VJgkn41rItW5STnzthrXWQ+tmM6nnDcLnHqn7qCKSD4195ZJtVTc6ZS76unjq3vuDiAgx8gs6sqzbM6l9pfL+WKWAvi77S6X7uBd4TfScVwnu9cG0PdphviGzkESy+RkZtw7dTmymfhJhaHA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786890133; c=relaxed/simple;
	bh=1Ph5XERqjFKzXkoQR6r6KNSKv6cQd5RDKP+6XgufBcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdUoE0MfG8LKbw+TOBaWNDJJirvfTSc6Sj0ZpDL3NcfgqaX/DsWHy/1v60aXapQqTbduKfeUIaNdAIDD7P8t1Sdd1nCFF1jQBWIVy+UoqUsmkPCkx73GbaJKAd1jJ7EHPkPwkqqQOXK5/x6ExWOvbcSrpDCfGsWipurdbvBbrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYeljua+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYeljua+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so20417135e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Aug 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786890130; x=1787494930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KMlwaAd8I5gc71MX6N5TV2im3iyNimd7J8XIlb6Aas=;
        b=XYeljua+YqAmxMUqu7NV+jHaYaekk7rLC1iDIhL17HbO6dkhx4dzYUm8cVVVX2Qb/D
         LSYIhBsXknXRr7UtMQc8tTDfMdtZ2gn0Jv9Ifk8YjtKGHf2dqSLZrFMEa9kwS8wfoUEw
         eLlFmb5N+WxZRN58QcEuHTcbIK1bg2jeAkXiooyR6TCQvqCPZxOVVgPqzjPybsbUr9a8
         SSWSo3G+xuALJsuRLAjR2AbgEcQA7KfqH5rLtKZuKlmcZkcchxC5DZEYRoG4g46RiVl8
         EQbM9qDK0GkkYmZFTVDEIdRPHTHUw/M6f6Lrt+7a2K450Nmo8ziSlUEvCN1m+BH8/KgH
         u2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786890130; x=1787494930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KMlwaAd8I5gc71MX6N5TV2im3iyNimd7J8XIlb6Aas=;
        b=C72LwaP4YR+e4mWuU30jbvrlETiDoPGDz5KC/Uhsd7+UxD0lRR+CTUueWJdfOTs1ZS
         AoSg1mY/NndjYTQezXgKXrTj3Ln43SdNalSaBGDxqjElpe0Gr+DmdEw8cAJJdzAx9lI4
         Nc/dI+MLJpyKeSdmCQ4FsmV3qM32k3f49n+Wm+/s72Aj2YiqEYbBMcnvRfAoeQJj/sdJ
         AGby3TCDYKnEeNQyG4yx+Dm8QL9NI68rpI/pSBiL+KuHMjAMD3J9b7VRkHVfqAu2d6V6
         VML3J/+pI/+vuujuQ8pESo2MugLjAp1okvhT0MfpraRnOHTvB0Wcj3FtbzB6gk2eV1Zu
         MPZw==
X-Forwarded-Encrypted: i=1; AHgh+RqW3uwkTcuc5Tu6/2bZzMNZdQtQkDntISLwc4sFavixPNMKsfkhgI50tGzfeX2Q6etdBJu4OtcdBgIsZQGg5Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgRDGJAhDLlYeFvdJvCl5bxF2P30+grgQdGm2iHJh2Df2+00U
	YHyzty6wUUICtTmHAoq2Jddt5jRbMugmw/BR0zp/JjmJomIZM60RmxbJ
X-Gm-Gg: AR+sD12rRZZq2fEE1rWGZhB1Ck3ZfRxjmLUrUfXCFecf0TgKDvyFcLiIOCQdjDH6Gpa
	KxOedwZFXw7WBniAeN/y5s+7YSZ4S6dXxKMnzmURJO3VWVzr7Zpt6+LOckVMI0Swskh+BlLmnub
	HRFEgXck8SoMAk59s5G30cpwi6Mzj+xSZjZWvwoujVbYZAqBbuXPwrQC1g5H/0NHXyfcwAULyqV
	lczSBL76uTv4LmKGNNSHb1SZt4k04i1DpZESEse0LBUiBzwRYyppKvSr1BHDXeCYhuJFyQqdkFQ
	bWVOPvazdSMDYnex5E+I7X+WZINXBSrf035ouo9MbvGX6/uCG9H+XnvcTDaA/d8aLSh8brgk86D
	dUbJPIHPk0/0bz3ZoVX+0Z/I5ZrBBWLH8sM6TBZA41IgBlDhn2b92RQQAeObIBhQQPD62jQZ/sa
	HVfM2QlwkI/gD0Il0DpYt30cdoRsRI5fJgr2sBJd0RAUQDvKsXBriFLcI3BG6zauMO/kW/Y0ti7
	hvJB3imZT/AeXg4D1RzFLJsRpXmNuGr8fwYWZzHnPoAgfZB7vxCQkNEfDb9XDo=
X-Received: by 2002:a05:600c:3145:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49987ab45famr258199375e9.6.1786890129769;
        Sun, 16 Aug 2026 07:22:09 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm39575365e9.10.2026.08.16.07.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:22:09 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: vgupta@kernel.org
Cc: joao@joaoff.com,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] ARC: cleanup dead ARC_CANT_LLSC option in Kconfig
Date: Sun, 16 Aug 2026 15:22:07 +0100
Message-ID: <20260816142207.1034329-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the ARC_CANT_LLSC config option can never be enabled.
It is also not referenced anywhere else. So let's remove this dead code.

Note that I have only compile-tested these changes, because I do not have
the hardware to runtime test.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arc/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 2ed7186c81c5..80e61175bf52 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -331,13 +331,9 @@ config ARC_FPU_SAVE_RESTORE
 	  for floating point exceptions and rounding modes. These are
 	  preserved across task context switch when enabled.
 
-config ARC_CANT_LLSC
-	def_bool n
-
 config ARC_HAS_LLSC
 	bool "Insn: LLOCK/SCOND (efficient atomic ops)"
 	default y
-	depends on !ARC_CANT_LLSC
 
 if ISA_ARCV2
 
-- 
2.55.0

