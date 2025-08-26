Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F4303CB2
	for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200562; cv=none; b=udZA9ejHovHLTWJN7d6GyODcFEAPA9KmFaaQSG1+v1kgqrincCJYajg7YG5/I/I0AxKX6IsKMaP2NbEWnK+8xPKFcYdRUj54uh8uEPd8soe5HIb1QB7Iqc7pyhYWxVkVu8tAt5fSBWHeY3ASqruyUFw0r+1wIV8fWzcftvTPrvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200562; c=relaxed/simple;
	bh=c8PjhPCCnTgJeUpJFTJS59xt6J9KPnPZPyUlPHKDLhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j10evk1kA0g4uB509+CoE7eje1Jy0PiLo5K9QWNE1IU2s24oKXY0R233lw4MvMjv6f0+GC5NH7jZ36nn0fqZ9X8/Hbr5gyuvLjc8kyZPSTy0AS26OpMlGcwjXpts3YUAE3kcfDpzBog9AHN0FRM/ADjOk+31/Fdwc2hAKVXpcEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ECKPrmze; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ECKPrmze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756200559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
	b=ECKPrmzedrycFpVZ9hnLls0RyDKbYgwiGwd2s6H9dO78YYK/hdPNj1nRywes5ojW/9RbBH
	NMkgkkmd3NJpq+ZDh+nkhOLUqmUQ/1b1Mg2tRcPuJ3BUXzAdokK2qqucwDl5vxVDgV6iQ2
	XcaW4HvgY8xMaDj6C/5n3qj+iUYGMPs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-QafqIXNxNSCMnT74CTjeQQ-1; Tue, 26 Aug 2025 05:29:13 -0400
X-MC-Unique: QafqIXNxNSCMnT74CTjeQQ-1
X-Mimecast-MFC-AGG-ID: QafqIXNxNSCMnT74CTjeQQ_1756200553
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e86f8f27e1so1391281385a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Aug 2025 02:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200548; x=1756805348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibjPTMAiwCSgwdvKGbpBfuqA/Z8D2h5jZa+FGc831mU=;
        b=bKUviBY4QKOTZEqDVUwLvvucjMhwoU0mrn8uy7uD0noMSMCalALBL0KHH/R5x7shsC
         SJ76QK3Npghv94DHWAqufPYttnrw1sPRGRFaDlLWHjZHMccEXmIXoTSMRTFFv2k6jduM
         3kZC6qguhDaFn/EDn+dKKmnIkFij22bB8rDxxCPo9OYEQaveZhxNl+Gwqcps8l4kM4lR
         YUtohiQ4VYiwElXS8jabQQUuzc2juHRHR81zlnGqT4lpnx3oaP/P+1KBwKkzv+2d8y3g
         dTR3SwKNm+0kJWLr3cwaSPG4EgrwAMa3T5kBssE3bthRKDK0mgZgKQSgds+wtSDPMcvM
         soTQ==
X-Gm-Message-State: AOJu0Yy8OwuXEQNyADibt1+kbCckCmy943lIUlcoiT1Z34/wEVzrMb41
	dCp4SgRlRlnjI7y36Rz559gHvVfRcuIoJ8jHJWf6yHlX5HObKNp40DJQTMr+ICFCu0hoKpHKhvn
	yS56gQzUYzXzjkXRDVaE/i2PQ/cIUSJMqePUd3Qe4XGMAnDMV905LIEhuBhFcsZ52anfD5g==
X-Gm-Gg: ASbGnct3wyEqkP/tU+BMXDuGEdxWcubaXH/lfGag/pwIeWRK7/qKMKQwm2wyzxSaR6Z
	w2/s+cqOpTf9o2JeQ9QzhtX46WvnyWdi0ph/WVuNpqzuOYgixMXq6nVoSgdL1/HFHZuNZpRUtwK
	ae+NrGmU5GIC0FFWbN0C5z4S48FAFHyexoyxdnlxUwvOfEzpq3fvsnNeTYv7priAqpKmk/CyUqx
	3tU6ioNhY5Unzgnv854e5YOP9+R6a0BMyMwNNsM8ZnrtnHXxIpPtPtfDpzWQX62mkbFFyAelgNx
	kvUW1VLl7MqhlikUu02qNKs2/LcbKwRsqcbseU2XYjg8oPPmJnlBIpnQw48CukP9yS35kK6mHz8
	fEFEFSl3Gpg==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57564885a.27.1756200548180;
        Tue, 26 Aug 2025 02:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpr7ArFXT7ZO1WWZDThLtmtRC02lQO9+8IZq21Q57x0kWr/JgXF3wJtr0chhDvtcW8744jFg==
X-Received: by 2002:a05:620a:471e:b0:7e7:f2a2:251 with SMTP id af79cd13be357-7f58d942015mr57563285a.27.1756200547767;
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebeca23e3csm660193285a.4.2025.08.26.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:29:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] ARM: imx: Kconfig: Adjust select after renamed config option
Date: Tue, 26 Aug 2025 11:29:01 +0200
Message-ID: <20250826092901.43141-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP
PIT") renames the config VF_PIT_TIMER to NXP_PIT_TIMER, but it misses
adjusting a reference to VF_PIT_TIMER in arch/arm/mach-imx/Kconfig.

Adjust the config reference to the new name.

Fixes: 3f490a74a8a1 ("clocksource/drivers/vf-pit: Rename the VF PIT to NXP PIT")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/arm/mach-imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index dc47b2312127..6ea1bd55acf8 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -242,7 +242,7 @@ choice
 
 	config VF_USE_PIT_TIMER
 		bool "Use PIT timer"
-		select VF_PIT_TIMER
+		select NXP_PIT_TIMER
 		help
 		  Use SoC Periodic Interrupt Timer (PIT) as clocksource
 
-- 
2.50.1

