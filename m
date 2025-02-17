Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E0217704
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786817; cv=none; b=NHI1NRjnokCfgBC703UTDBJx80vc7mRTQpjNtzOrWFvvXdiq2Q4ALCxfDcS8jEnHfjFb9uQG0ysdboG4KgAXGKBi/cdk8JqDifjGjtPS1W5pN1PtOrM7ap1HW3Kr5Rby/oNR22ewROGVVir8ho6p8tTE3iBkEfHQVw3GrUxJB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786817; c=relaxed/simple;
	bh=Biw6DUxzk939fJknAJPcsYdiS9No9FiyXZeyYUMpkmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8EKYoVTHkebZcQ9OPEbEoI35OjdTeSkJIenf+6afGPQz6ccPodGjKwtzsZFf/SejDFFWhXrGP57fRv/UYnadz/bnjt6CGFPQQHiZMMnH6+IbudS8XZUoQdzI6crwd98/9bjMVL8M9lKdplknPyjkhiX09wte8RnhOXhe04sz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h4m/m3Jo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4m/m3Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739786814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7uYWhEd1/c+mNMCq30U6Kc7sDjWCoVhIrgohc+6hGoc=;
	b=h4m/m3JoN2xyGHnRe1A9ALAknlzG27l6VBEY4o8x0879npUo3HHmPBPZNRub3yGM7JP9tb
	2SEHw9o3rT5xpGsVQHL8xEvibIvWMlOSbGzfV457AfS5D9QoyLIMPD7NyEx5CLIjNi1YjG
	RLDb470JYul/ahWBZdOHkiebwjcYnZk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-nHzptqcnNTSgndog9D1FmQ-1; Mon, 17 Feb 2025 05:06:52 -0500
X-MC-Unique: nHzptqcnNTSgndog9D1FmQ-1
X-Mimecast-MFC-AGG-ID: nHzptqcnNTSgndog9D1FmQ_1739786811
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dfede57feso2325237f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 02:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786811; x=1740391611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uYWhEd1/c+mNMCq30U6Kc7sDjWCoVhIrgohc+6hGoc=;
        b=u+YHMgG8Xi94Kb6IKj1mE+0vYbmP/Qf0ODQPNLRWkZJ00v/SrkbTVq5WaMAh4u+2rw
         WA1u6ewgjWNhB7bZOUvBpcrZ04n1dNAi4v+1ZsCF4T0ii3OMvhTu0iT6kj1wfasqN+5E
         4I2rjF04HVb86cgyLo2/4qQEt51DlLfbwFEfhetuwyxpiRvyNwYspyHs8Ib6oBrB9vT8
         SXFpRxEyAoSW65tjOTfkGYB8HNKEHxvyvlPq/S+eZjpcdbz/CDB4hgSHvC3hBcR2UE6r
         hAEFYGn4SGeVLHPa0sObDJ90rZMCZdVwubeMP0iNaKva+jqb+VdH4qQKIqZexnL/oD2q
         KAVg==
X-Gm-Message-State: AOJu0YxT2RWvuxIefhCQfrABn9CbDWpye6ctNdLhd/K9daSYVqpKK+mS
	yHz1hJB+26GdvW3vyzBYY6qQ0oe5l5s56qmiaQYAZKm+OERhjWwd6V/XI1Rry0BVxjIk902Oz9O
	D2fvbmUcbpHv0A1vjZvptKr6aLR/VP+TYiryuzk/pFnAbmigObPngYAJ8aE59g33AAA==
X-Gm-Gg: ASbGncv+KUvv2yEk0aeNRhCvefsGMAgAzlx5VaaZ0RKkeAwuVUV4T93e1m1XHvdL2u6
	h/svdJl3bv26b0kZjmqZSJ2YF/7zxPs7pkY5sHz8YGdIwj+9A2k8KIdXw8zyS9JOkwz9nUljct5
	iIeTgji8JsdthkCxj9ZdrNMugmoAVl+qeKInmczRU981mVUVxdScPHXgZ8/Q05lzJoQdHb98kPN
	dvvlcX+7MPX+de/pJruHmncbT3ApWVlJhX5qFwCsX+uVYaoJribGASel7zgutE5B3TTl7NMnJRL
	ErYgLgaNe8kvh6jzDFlU/Rnrl3NABHoxRR+wgy8ZtTqth614o1dp
X-Received: by 2002:a05:6000:4025:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f41768063mr2940022f8f.2.1739786810971;
        Mon, 17 Feb 2025 02:06:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF17aX5wN9RpvCFSTEz6ASI7aS8LQfB/Yvz3pfn6bQCqV1ymw293EC3qwrkdzNkvfNshhjdBA==
X-Received: by 2002:a05:6000:4025:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f41768063mr2939994f8f.2.1739786810613;
        Mon, 17 Feb 2025 02:06:50 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcc50sm12020780f8f.34.2025.02.17.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:06:49 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust entries in FORTIFY_SOURCE and KERNEL HARDENING
Date: Mon, 17 Feb 2025 11:06:43 +0100
Message-ID: <20250217100643.20182-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory") adds
a file entry to the non-existing file scripts/test_fortify.sh. Probably,
this entry intends to refer to ./lib/test_fortify/test_fortify.sh, though.
As that file is already covered by the entry lib/test_fortify/*, there is
no need for a separate file entry. So, drop the unnecessary file entry to
the test_fortify script.

Further, this commit misses to adjust the entry referring to
lib/usercopy_kunit.c, which is moved to lib/tests. So, also adjust that
file entry.

Fixes: db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 53cf3cbf33c9..15632a34b740 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9070,7 +9070,6 @@ F:	include/linux/fortify-string.h
 F:	lib/test_fortify/*
 F:	lib/tests/fortify_kunit.c
 F:	lib/tests/memcpy_kunit.c
-F:	scripts/test_fortify.sh
 K:	\bunsafe_memcpy\b
 K:	\b__NO_FORTIFY\b
 
@@ -12613,7 +12612,7 @@ F:	arch/*/configs/hardening.config
 F:	include/linux/overflow.h
 F:	include/linux/randomize_kstack.h
 F:	kernel/configs/hardening.config
-F:	lib/usercopy_kunit.c
+F:	lib/tests/usercopy_kunit.c
 F:	mm/usercopy.c
 F:	security/Kconfig.hardening
 K:	\b(add|choose)_random_kstack_offset\b
-- 
2.48.1

