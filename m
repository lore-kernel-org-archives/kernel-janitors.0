Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FA014F90
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624652; cv=none; b=HJKe59YL+l2eTAYRMbKY70Dzro0Hc00Puqep9qX1V7iL9naq2hz4xwpZCCxeDvlcCWuI6xwXSmBFqv1PaepUVFTB3gMjTVfb14RvFCEKBbr2ePpzTzmxbYO84rLrrjQegBqYbBLjhop0aghIf9Aodsub6c+vCVqWjieEZ57mA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624652; c=relaxed/simple;
	bh=GFJNcdBk5bf2L0Vt3Vbfq5iymsDl4I5onmf7LWk6zC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tne4k+Iec+ainK7UivkrkDNIEcaEQkumLuUZzItk2R09eSVRcYkddepsgbNjxKjmeE5cvU7ETRtNLHyISxYTxgvVDKIpcb9fACYDjzjbELBz5zhU/j1iD083fSkl2MwJQSjoPoyqFXvUbUhjx08oisW+zO8ziH+RtGTSveQKRJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1ETEKHI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1ETEKHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746624650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
	b=B1ETEKHI6OqEEbIDKg/EcDffPZFrIB3oK8Z1jAVo1Kbqej2gIg5MmK4STW1wF3aE5+PH+S
	EBnCQKCjoTL/7zBSBl2Rgu/xaiFuFF1/UIj8PJKjBdDwfElurkr4M7toPIP6UYGtsuZX2z
	9MvxsyNfDUmxS6qWmPb3BljV6biNU6g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-YC9Ri3fcO5idLcA1LGzLhw-1; Wed, 07 May 2025 09:30:49 -0400
X-MC-Unique: YC9Ri3fcO5idLcA1LGzLhw-1
X-Mimecast-MFC-AGG-ID: YC9Ri3fcO5idLcA1LGzLhw_1746624648
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f405810b4so35843995e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 06:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624648; x=1747229448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
        b=XYvh3y2NrojGcupBfL5T7v9SP7ubQ/kcm61kuYYs6F3ENcpU5Jy86/+ysv+JCy7qKG
         n4Cv0JQ73Um9YzQdjwW71TaH/G/qH+QJAH70uNPxq9s3whWhYq6hUk4f+ub7NICPbyjs
         fPr0+ZhALWAXGMARRsIZ9Y4QrSyqdV22XrQ4UYwPbhYzL57mLVzmyRfxehXFQr3Z/Jbm
         hO8R45Q0u06wgi1El2ugrftORCZ9eMTRgCxhFy33ROBHqYBJTzKQXWtxpodSia8S+FLr
         hPUq5lGqw6o5tQ+R5Je6f8DN8MIFfgrACOmciqZhDT74Vu81Sk9kkYsJFyu95dpgvjgf
         H5TA==
X-Gm-Message-State: AOJu0YwwXJ3ifjeS+rVvJn6/Tm6iZ93Ea46EKcX8qq/uFiAB6KMCFPdz
	fQdvUALwdXsuRRm/U9sc/LoHTYbVzxO1puG0S/Cz2/+tqV4NxcNbGujI31KrCBp/EnQnZAkPyEl
	wsobSJV4OHTQKUTkMjyVP/FnOK3qlqlRIY/g2t8ZuC/KnWtIfEexdmGEvLz3fVS3Dgw==
X-Gm-Gg: ASbGncu/B0uTiVrLfU/OQMDt7VczYJ33SW9JiuuoJi4AOUf2pgps+1lqeThn+1uEqWO
	TiuMrT9A4v6P3O7/Qx5CTlBj8YP50cqfsbfLH5UlKca9rPpthUEJY6SItflhZDJlsJ4uSBunE3D
	wCJBytqQuiyagm9ZgduvG46NPMBByGUs9hJdC2lf+NVM4/bHEQTVEjvroYQWlIFK25tFAdMjFDZ
	Fl8UcaeHeBoWfg/0xmBaoj0oauAkQCEZxmVJxaJaWh5juXFFnTCcHjHb6YGfsCtTExsI6KzAZWp
	p+YSkmh0oXbKAcQmyMfhMb0jUsjpLh4bX1qVlj4RySK+hl+lAU4VIFL1/Q==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433711f8f.21.1746624647389;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+xkN4CteQe3W7JG964awZX/kgvVxlMBDW+iUZi+kxW1uqeTmzxYgAsX7awL9bnRSjkrOf1A==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433678f8f.21.1746624647048;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm17111024f8f.38.2025.05.07.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:30:46 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Makefile.kcov: apply needed compiler option unconditionally in CFLAGS_KCOV
Date: Wed,  7 May 2025 15:30:43 +0200
Message-ID: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes the
config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
compiler option '-fsanitize-coverage=trace-pc' by now.

The commit however misses the important use of this config option in
Makefile.kcov to add '-fsanitize-coverage=trace-pc' to CFLAGS_KCOV.
Include the compiler option '-fsanitize-coverage=trace-pc' unconditionally
to CFLAGS_KCOV, as all compilers provide that option now.

Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 scripts/Makefile.kcov | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67de7942b3e7..01616472f43e 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
+kcov-flags-y					+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 
 export CFLAGS_KCOV := $(kcov-flags-y)
-- 
2.49.0

