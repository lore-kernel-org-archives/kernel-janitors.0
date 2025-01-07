Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C3198E78
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246868; cv=none; b=Kh08jyEr7TprxCqb6AXVFxgkX2CxQoWzsK/vKb8ZIEJ6rivlghEo/S8PnhY1Zhi8+I/Mk2el6/C6TCsSDxivANp2nfnONYog94eOf82f1n22iZOOCfb5bZMsdpa0lnUgfGp2jl4ra6+6+5ixCB5MJNim2PcY4WFlU4aah7pVrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246868; c=relaxed/simple;
	bh=4DxIWS4UxbWb/GxgImQ2LJd+yXKvqJI5SXd4jfKZslM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXsf0HECjX0Py0EbGWEuy4lI4xq6ijYSZlHzYpyImhRluS6TPUNmHAsaf8D6RJBzv9gjtG7re7ToUPNNZT0SR7pHFxIrWECsGv8uIEcnTypOAFlduaMnzil89c/Yn0CPXzS3HZ7NFyzerTwYB8fNN948aJXwmSiMNeGIxlyGoeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3IlgDGP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3IlgDGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736246864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xxf3smob+6l57OQXLoAdYMn9bpXPBaTQlMB2diZdpmc=;
	b=a3IlgDGPwktYC7Bgs2PuilGSvMWjcvm7cjq6x0o7NCAQvGIWG5Q1dl2WXJtco87mpCc+gX
	aF7N3T6BvVnIQ9ya+LpO8znKpHI/p6UPRBp3/90cnETUzF9LZYcAdCpVnlaCgh6pVSyFA3
	7P1u9piuHtm5mWV/1DCgKJsSpXK//C0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-XC5OSGgmOPO4m0kDjaVZxA-1; Tue, 07 Jan 2025 05:47:43 -0500
X-MC-Unique: XC5OSGgmOPO4m0kDjaVZxA-1
X-Mimecast-MFC-AGG-ID: XC5OSGgmOPO4m0kDjaVZxA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46799aa9755so462434961cf.0
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 02:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246863; x=1736851663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxf3smob+6l57OQXLoAdYMn9bpXPBaTQlMB2diZdpmc=;
        b=ZNkCNNDxdg8nFab9Zah9WJWcy+osa69yADMutDCJPM5p4UKsiOH/suuoJzy2qPAn0/
         W3sA7qioiB7fFr0H6BajKHBd/CUOkGPkAa3WJ2jmqQRp9wjfJxMCfMlbjHxmWrzJFor/
         p2D3/SY17KXaw6cPACVKkbZ3R3UvB/y89F8LF1aAdts3jDfpf8jCSHzyeq1Es7lrkhtw
         s5kG7KmOY7rQ12UXqES8AN4JCsmsUYK11guu5YZaFtacZjGfNeeQCL7XeT1vg37Kv1gQ
         2wYcOEtUejl26lzvlTrmtcJY48/79ksH4yEDrPhdN56UDNL6+KUI2kIJk2tUgCck3sFq
         P+kg==
X-Gm-Message-State: AOJu0Ywxf723BtwUFWKaqiqwDhJmKcmOUWaqAg18+ndaIA3oJ4xJfwKd
	Gw/8CdymhnVsPZofNj6mpO8bdZSCS+yXsoJdGH3UzaxkteShfeeiPPHk6IUPA16q1iknn0DZeTZ
	+kY/t8KzEOgRC8r0IOeO5EZg8a8WRCCJt9Es3i2myF0DAEgt/zfbVu/L0Ja8sRSuVaA==
X-Gm-Gg: ASbGncsbfpYJiLEjFEO8YxEHatw4mm+ohUT1Yihml/iTiMlkmUtU0ReD04LrYoqB8rr
	i3l1hwx7kICRmCjfqrIdc+/l3ckA3Rsb9MlMQA7zXBONDcMHQ8THS5vdb3u+Oswsmc3oyii2Vzb
	EhwcR8RjuzgbF2KJ8ear86YViNo3VcSpi3Igpe0Pc90XplTvn0a4WTfFlP9o2m4vtuLKBICy46O
	cHprBvbCI0tci4syyZyDg9Bx1L5BQesqIeI0/QWP39DjTddP3jYspKKER0LtGVPnnnri894V9aW
	I72MFNsh1d6y0fgi+FQvF77H49XH
X-Received: by 2002:ac8:5fcc:0:b0:461:313e:8865 with SMTP id d75a77b69052e-46a4a8cca9dmr937479981cf.21.1736246862796;
        Tue, 07 Jan 2025 02:47:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCN1wrufu76U/PyJOp8iP1dgVNtmKaWBLmDGU07zHb7TNTTnchQao00F/SfyXcsqdNs1HzrA==
X-Received: by 2002:ac8:5fcc:0:b0:461:313e:8865 with SMTP id d75a77b69052e-46a4a8cca9dmr937479761cf.21.1736246862555;
        Tue, 07 Jan 2025 02:47:42 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb3403fsm184169821cf.88.2025.01.07.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:47:41 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC
Date: Tue,  7 Jan 2025 11:47:28 +0100
Message-ID: <20250107104728.23098-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 99c21c7ca642 ("clk: qcom: Add X1P42100 GPUCC driver") adds the
config definition CLK_X1P42100_GPUCC. This config definition selects the
non-existing config CLK_X1E8010_GCC. Note that the config for the X1E80100
Global Clock Controller is CLK_X1E80100_GCC.

Assuming this was just a minor typo in the number, i.e., 8010 instead of
80100, change the definition to select the existing config
CLK_X1E80100_GCC, similarly to the definitions for three configs
CLK_X1E80100_{CAMCC,DISPCC,GPUCC}.

Fixes: 99c21c7ca642 ("clk: qcom: Add X1P42100 GPUCC driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 42c257e4c433..ecba763a1a59 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -67,7 +67,7 @@ config CLK_X1E80100_TCSRCC
 config CLK_X1P42100_GPUCC
 	tristate "X1P42100 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select CLK_X1E8010_GCC
+	select CLK_X1E80100_GCC
 	help
 	  Support for the graphics clock controller on X1P42100 devices.
 	  Say Y if you want to support graphics controller devices and
-- 
2.47.1

