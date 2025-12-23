Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D945324B24
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Dec 2025 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488062; cv=none; b=oKtUTl7g0hMx1BqfU51oREYC0weuE19c3qQR5TMq/2YOAg4wj4G+nmq9UzeSB1ebWckuNKHnB/RkvuAb1mYYKLC9KIfYYv07i/JqxTc9KKVe5i9Trk4BUW5vR0KUsWa3YKUa3PaB7O+b1IypPmerDK3S0iKVsfMY2IFZCV4gslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488062; c=relaxed/simple;
	bh=ZSyke85YPxTSIfFJuV2SGg90/yVv72oYZRxGZyVemXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0EVU2ip8GwCrj/P5CZVQ6ALi0ckYFCiIC8m99ZoZ5u1ZhN5oDlCpNMPLqPLQq6fV/JNJalCD53J3OwPJ6sfGFI8Hh3odk3xp2CW85ACMmuMovMdu12Us+avvXxJ95xyD94NPVtqI0EIiNam0WbQgjeE585+JBBQDNsbKXPJOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W9CmilXz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OcLcswP5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W9CmilXz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OcLcswP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766488058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
	b=W9CmilXzRN8UOXKOYUmy4hYxQPvTgh4WzUzwEk+lt+B1fS4Ti+Bh7KyZGuC088loBjqGhy
	4dj2Nzoql55B1kfpffeKR+y2BT2Gs0eBwp/F2zuE374wlL9W9QSw5R6zQyP7zuj9IRQubM
	9RDIRJl1onvCV9pEErw71Si8W2U1rP8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-rJvzoQBbNvy1PGxYPyQ4Tg-1; Tue, 23 Dec 2025 06:07:37 -0500
X-MC-Unique: rJvzoQBbNvy1PGxYPyQ4Tg-1
X-Mimecast-MFC-AGG-ID: rJvzoQBbNvy1PGxYPyQ4Tg_1766488056
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477cabba65dso28304435e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Dec 2025 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766488056; x=1767092856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
        b=OcLcswP5w++dzl4QsJM2WixOs991U0kJo3cLQxqldlhNcg8Y1lvRD0myLcZnhK+EMY
         XMs4OjFCCxwgxR3p7UggebKIuyDdHYXI/C8ZilCq22JSzwF6119AEFsw2j6UoLsVZKFO
         +cy4ubiIiU/E0NmSKOqMCsaXvJKzBC3Eq75Dc/zjDEZ0p9p5Gi7013fxwP4Wx9M1P2K0
         0etAYd7RnBuYPkeTrHLJOW2OO2bgNQEAT7pT+6KzQEnISNW0CpeYALbTpPPk7sDqoq69
         KNF6Nr0wWQ2gU5O9nbGmf+IhpNizQ/6I293gk699yJjvgb02vly+m9hN5NeyEQcoj/S7
         cetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766488056; x=1767092856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MueTHjJz1MUqVwC1Z42zQoG8AmO3MZUaIIU3E1xfDt4=;
        b=fDyqsenClxlMhs6GYlXcmdo9NRhOvgeSEDmzAoR91rXsBsu+h4U4+TZ590U0gPSeOW
         +9W/a41dSSFr8zkY7W6cGDh6aJ0ZqcA5MZvytjbvAZjbdiduTVvPX9cdGiLT9EVIBxJh
         wu0QOWYUhLgOcGUPYhXffh1/w2FwYMRxvWqYqYivMJYyqmQyCFrwz2iOb1eEijj8HqOh
         I4sIhFswsuJGri/Dh9VlSZvhDHdatF1I3w3QUHDj6Q3XfS35rQ4cbm1xlI0gJMvei2DN
         bowEzbvXwBsoNNUhStSTMJXb3YWgOCBPhWLH6x4X+SAjIsox4iRittIY5wIYEOQKouZQ
         zx5w==
X-Forwarded-Encrypted: i=1; AJvYcCUsuGs6GDe1Ai+Qtt/SjP/rM00YKFT4qElNcNYP2dDSbbrUtwniJeb0sKG1+rWnnRvX+CBO1JlgYrzcQnMUeLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBke0GWanpmA+tOMfF0zcNhgEnZfRirBFePY3pHcPrf2+n+1is
	gDivwlZZ5nGdpL2Zt7AjZiY/lDFJTPtovShS6XprsZ5SPWw6ObbSijF+HD2/gbyDKHOfMvTeoyk
	hIZL/3IUqG4P9U8cqV4R1MEHYD+TTpFsDNOCDIffxblAd6u5u/yWYV4UEgHIb+RHyOBnP4g==
X-Gm-Gg: AY/fxX7Az9WLtLxLW0HubSNTqnzMOpwukRmFUvJ0MWHBDa1mQ684oTMlQuggNWghlVJ
	8GCeR/VVQSCA0xPmWs+E6X/FT+eeGnbUIQsbspdoPddR/XS551Pod/ukAtWeduKZDYyD+UzNxrE
	Cf3Seu7b3t/wDfTTDjWzs3Ujk8P0g0raLh7O3O0liiCbsqDm3lqvLlXIHwzCyQs9ioVr2ZtnDZ8
	d/epoOMsR0x008xIaENYuq7gLf2poDmXY0XZg9DAHY6O5egUuypGgSuzVNDVGRngOzFZGCBHM1T
	zJWLoyj+wq7/TulzSosUZwTZ64K7rUUBLab1el4UNT4SXaFXRN2nnjKNdoM/Amj/QeK5Q/kUmXE
	J9yaKh+2DqOCwSUwRaKwVWUjF6dzWyI3oCyjHR5rakg0GIjO7dJ7pQZzM6F0=
X-Received: by 2002:a05:600c:6388:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47d1953345cmr125349825e9.6.1766488056280;
        Tue, 23 Dec 2025 03:07:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdGGtBa3hQA5jZUcQ3Uf3/GwrAQNNoAzyxpHojdJYdt3xnSt88zf6PWkdODE0mU8D/O2ZGoQ==
X-Received: by 2002:a05:600c:6388:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47d1953345cmr125349485e9.6.1766488055878;
        Tue, 23 Dec 2025 03:07:35 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a33c1csm125461535e9.1.2025.12.23.03.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 03:07:35 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Date: Tue, 23 Dec 2025 12:07:30 +0100
Message-ID: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Currently, the config options ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS
are equivalent, i.e., ARM64_LSE_ATOMICS is true if and only if
ARM64_USE_LSE_ATOMICS is true.

Prior to commit 395af861377d ("arm64: Move the LSE gas support detection to
Kconfig")---included in v5.6-rc1---only the config option ARM64_LSE_ATOMICS
was defined, and the check for gas support was done in the Makefile. This
mentioned commit then introduces the config option ARM64_USE_LSE_ATOMICS to
be the promptable option, and changes the semantics of ARM64_LSE_ATOMICS to
check for the gas support.

Note that there is then some minor refactoring in commit 2decad92f473
("arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically"), putting this
gas support check into its own config option AS_HAS_LSE_ATOMICS, but the
logic remains the same. Since every binutils version defined suitable for
kernel compilation then eventually included the required support, the
config option AS_HAS_LSE_ATOMICS and the dependency was dropped with
commit 2555d4c68720 ("arm64: drop binutils version checks"). This then
makes ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS equivalent. Hence, one
of the two config options can be dropped now.

Considerations for the decision which config option to drop:

  - ARM64_USE_LSE_ATOMICS is promptable by the user since its introduction
    in 2020. So there might be some Kconfig fragments that define this
    config option and expect that this then implies ARM64_LSE_ATOMICS to be
    set. However, within the kernel tree, there is no existing config file
    referring to that option. So, it is unlikely to be widely used.
  - ARM64_LSE_ATOMICS is used in nine places within the arm64 directory in
    the current kernel tree.
  - ARM64_USE_LSE_ATOMICS is the only config option that contains the infix
    string _USE_ to enable support and use of an arm64 architectural
    feature. However, there is not a very stringent and consistent naming
    convention for Kconfig options throughout the kernel tree anyway.
  - The use of the transitional attribute allows to simplify transitioning
    to a different Kconfig symbol name, but also adds some intermediate
    definition to be removed later eventually.

After thoughtful consideration, keep ARM_LSE_ATOMICS and remove
ARM64_USE_LSE_ATOMICS in a two-step approach, first deprecate
ARM64_USE_LSE_ATOMICS with the transitional attribute here and then plan
to completely remove it in two or three years with a further dedicated
commit then.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
CC-ing Vegard and Kees to check that the use of the transitional attribute
is done as it is intended.
 
Note I have set myself a reminder in my personal calendar for three years
in the future from now to remove the transitional Kconfig definition,
assuming by then all users that maintain their Kconfig fragments with
ARM64_USE_LSE_ATOMICS included have transitioned (if such users exist at
all).

 arch/arm64/Kconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3fb4603c0e16..e113555ef6cd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1875,11 +1875,8 @@ config ARM64_PAN
 	  instruction if the cpu does not implement the feature.
 
 config ARM64_LSE_ATOMICS
-	bool
-	default ARM64_USE_LSE_ATOMICS
-
-config ARM64_USE_LSE_ATOMICS
 	bool "Atomic instructions"
+	default ARM64_USE_LSE_ATOMICS
 	default y
 	help
 	  As part of the Large System Extensions, ARMv8.1 introduces new
@@ -1890,6 +1887,13 @@ config ARM64_USE_LSE_ATOMICS
 	  atomic routines. This incurs a small overhead on CPUs that do
 	  not support these instructions.
 
+config ARM64_USE_LSE_ATOMICS
+	bool
+	transitional
+	help
+	  Transitional config for ARM64_USE_LSE_ATOMICS to ARM64_LSE_ATOMICS
+	  migration.
+
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
-- 
2.52.0

