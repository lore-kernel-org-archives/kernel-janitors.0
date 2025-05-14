Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FF156C69
	for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206851; cv=none; b=le0Ri8EgUVCJoXy77HOgf0snPwjGHcMgizEITMo8mnWrj5bx9JWFZAh5FoFTw4xwiuzxJUcGbv4C+O/7n7SKCUh5q5gygQoexzZMRd4W8ZtoUiaeDDLkNrki5FI8HOXV6llTuh7mQn9CrNwbpM3IOFkiE0H3eyWaKJkj7T/b8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206851; c=relaxed/simple;
	bh=OHBXANHyL8wcBVrw1yfldbqVN6opWC3OshMz6uT15OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oWBvxAnvbIm1mnO3ujXgjTfvWi1h4UBWzn8w8QOCJZDDQ9n6SVVMSBLo+P8ogArm5cKg3bZM1CqWuqBVnsvaRX5XTrASEGukj2NMKTt34ZChARBj2JiXpbHjkSr96LLeQ/n2MPRtVk+/HSzMkd8d09WwHvMuGAU45gLPWfAR1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIGSYB5R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIGSYB5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747206847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RhtvBP/MCitR1ftSZRMeSHLdRQ2xIQHL23q4ybZlF48=;
	b=OIGSYB5R+2FUkRJavxF2wWiLeUHet+LNm6U3j0NoVHi6vJfYtl6tX/0CPieJDe61qLgTfA
	OZOODWsa0tf9fyXxOnSefgOfIHQr5S5XnskE+cEPdHmqdjugHuuAkO5bF2IsoqRs3Caj+2
	tJFalRS+0Cjgfp8sdwsoOiAp8nJxTlA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-gXeVJZjPN-iU1K8xm6XTxA-1; Wed, 14 May 2025 03:14:06 -0400
X-MC-Unique: gXeVJZjPN-iU1K8xm6XTxA-1
X-Mimecast-MFC-AGG-ID: gXeVJZjPN-iU1K8xm6XTxA_1747206845
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acf16746a74so723241366b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 14 May 2025 00:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206845; x=1747811645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhtvBP/MCitR1ftSZRMeSHLdRQ2xIQHL23q4ybZlF48=;
        b=XvwFLhIvPVfO72dzY6QcGrJ5fKsD80gFMnR7g6ss890DITx/hxH9tgk+z4uXD6q3yD
         vjb8wv9L48IrS2W/5MQnzPN+S5p9m/toUybNvNvscg2HUbJ/h3YNJ+wrA7j7quI7TGYk
         Nr66JHKGMVoE1SFAi6KOgNUA21RM3TYoa8RIEytsUBt5btBgAZ1o9RIVm3dxO00E3RlW
         LKbLjqn9k3LkjTt1V4WzqwD9J0b0PBV3ouyZFlbFyYZssJnhnDb6VTKZKcaobAdu+Scd
         oQRkW03nEXFvIK6+nqj5hV+tE9N8MJTRGbDUPFinkKknev4vJwY+zKWe+dq+qOYKzzX2
         WGQQ==
X-Gm-Message-State: AOJu0YzilT1/ye9Egf/Gma9IhJH/DaCOtOed6mr1zpV8zxsKUSe5I7ju
	fEpmSYQAPMS/8BBBRVvk0EdTjnYYa5RzhlAVcBf3eV7hmE8vr3mIHKm9i5Z6stiRY97WAYDKJ6g
	MhZclsLiV+J7WeCV0HergYBGgCDTVJHDfH4VApWTORa7unL6HY079qkSQm2eDW5PLDg==
X-Gm-Gg: ASbGncvT71OM11MTeYTx9LFWY7dJTnB1N1u7HMPlJf+sQTs/DqsqiSennEyY5+CTdGY
	Y19Bm9ob6G+ihQVcWzLL4l4MVpIlge5SvbJsTjVE6BNh+z9FadVO2CgImOzj/atCqZyn1ByZoaT
	ch/7X0dT5RgFeX1FfJ+GH26lFWLO5TTxysnmppPJjtxi+1pbqZZ4ReqFw8c2z58KbmjQ7n8TZrg
	aN9rhzTmc/3eHNeDzjpNlNSQlUOVq36fWMTdninV/ZRY4Z/vs1KVJXI8EpOZvOyfStx+TBW34EY
	bFKizP72J1U/Dr6qwwbskk+tPkg1OKV6/1Zu1KxTyukI1LHrecua+5JdCA==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id a640c23a62f3a-ad4f74c9000mr222005466b.49.1747206845221;
        Wed, 14 May 2025 00:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxaAR2Q+5d92tWC9EC6K77qjGuYdoWqzESwAbtU31oqD51mMNX4L5oV+Owa01qzyfNoY/kiQ==
X-Received: by 2002:a17:907:1908:b0:ace:d986:d7d2 with SMTP id a640c23a62f3a-ad4f74c9000mr222003266b.49.1747206844830;
        Wed, 14 May 2025 00:14:04 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23f5f6fddsm653162866b.93.2025.05.14.00.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:14:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] apparmor: Remove obsolete config SECURITY_APPARMOR_DEBUG_MESSAGES
Date: Wed, 14 May 2025 09:14:00 +0200
Message-ID: <20250514071400.465055-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 71e6cff3e0dd ("apparmor: Improve debug print infrastructure") makes
the config option SECURITY_APPARMOR_DEBUG_MESSAGES have no remaining
effect.

Remove the obsolete config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 security/apparmor/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
index 64cc3044a42c..3cdea783b6df 100644
--- a/security/apparmor/Kconfig
+++ b/security/apparmor/Kconfig
@@ -35,15 +35,6 @@ config SECURITY_APPARMOR_DEBUG_ASSERTS
 	  points. If the assert is triggered it will trigger a WARN
 	  message.
 
-config SECURITY_APPARMOR_DEBUG_MESSAGES
-	bool "Debug messages enabled by default"
-	depends on SECURITY_APPARMOR_DEBUG
-	default n
-	help
-	  Set the default value of the apparmor.debug kernel parameter.
-	  When enabled, various debug messages will be logged to
-	  the kernel message buffer.
-
 config SECURITY_APPARMOR_INTROSPECT_POLICY
 	bool "Allow loaded policy to be introspected"
 	depends on SECURITY_APPARMOR
-- 
2.49.0

