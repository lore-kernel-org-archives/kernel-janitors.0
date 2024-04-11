Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100F13D62A
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Apr 2024 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818046; cv=none; b=YHv9VeeFOsRPhY0WnlAcBM6DVoPMRLvvFstwssaJah3i4BZJTNV6JID/9fLXAsdEnxyf87f6JPLTfp2Qsc4aNvFLcGjMxjWgIZ9UpupZmSjz64LShFue7GkEw3EJN6+8JpPRHKZouTJKPTCW3baN4mmxCNEPekTicYESOMUb/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818046; c=relaxed/simple;
	bh=iPcZnylWBDvRsCE2L2tauJ8vojH2Mnl9xe6UlPGUsUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUqLFKi/gfZGYKg8qvmTQ8f8LtyJKr9oPNILPiE7paTfQjwyI46EK6xuP6OWYo/OuYQcshTZZKuPSks630BazE5WzMq7t3uVoZCfh2EEcSULPmSJib5AZou2pOg1NW8fliZNzPqlCaE1YjCD/NKQtjahlTns91Y9ZJZkYaYXouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KmIFOq7x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KmIFOq7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712818043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vn3kbYVAUInyEJqyRV4/bjgt4/apuVePLjXauHm/Jbw=;
	b=KmIFOq7xHMwCibzcObwZ00ToXlHPYN+xKiWGXVKfYVY2kwQy1w4DN7PU3i/J6YwGcC/R5q
	Uxkh9j4U8kAkkkqAE/WNBXvZy+HNMGEDftb17qHi7K5sNfd6RdC1U8TozNKrJ1rctsEJcn
	hJCRS+BRWVRig0r0pU7YiUd2WBUTLfQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-PxqvrIYoOhWWB85jGfT4oQ-1; Thu, 11 Apr 2024 02:47:22 -0400
X-MC-Unique: PxqvrIYoOhWWB85jGfT4oQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5685d83ec51so3610927a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 23:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712818041; x=1713422841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn3kbYVAUInyEJqyRV4/bjgt4/apuVePLjXauHm/Jbw=;
        b=WM2h4SeLXqtDSgPOBHHJa5EVUzmqZgur6tmXg7fsaDlPvTypC/4ocrbLvuju3V9aeF
         FRtLuW/VTBKcbNWQk4d4xN6fwy3Ao/2z6LVr8So7gXbiy6eB42iM3aWvfMNkRA07WJu6
         NMeUi9LPBYdGUSibDUUbDoMkFmQZNA3iDXm9eDGA8ZoGE8j5hj/6rLwO0pC/cbNDjt6P
         gWaebsF6pmTeVGKIQQN86yV3Mgw5kDbn1T4A2psiCK4oDhOK5PClySAItQCIM90GYRgn
         gNJW34MDrgQMdq6nFXLsqqNsOsquUSg8TZECYJ93tmgejZuC/z2w9IO/urAsAar7FsXH
         1zUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqDG9MuoK8QzTu9VOrTM+mEBgesUsTRL4ldQlFL0D1HLJGb/bqzdo8qxtY1+5nOgP6R0RJnBTm4d78qbqhlq39+viR5jVTFAKmV7o1KlZn
X-Gm-Message-State: AOJu0YyYUn9a7R/MymizMkkQ8qLsB91L9ZG/JHGKlKI1YndsJJ3ND19j
	1NQq/jBO/LdHAMg55OqaNYeag5sHn/XjaP6LTbHyvnLiOUnSTiF+bUl/qcCMF030JKHmDcnq/cl
	S/dH0j8E8n36p8k2cqkWeXWzEThdQ5yNLhrzvqMA8BA69OKS9IptpvFHcpvxD8dlZGbdVOX8lkA
	==
X-Received: by 2002:a50:a6c3:0:b0:56e:249c:397b with SMTP id f3-20020a50a6c3000000b0056e249c397bmr3161077edc.28.1712818041134;
        Wed, 10 Apr 2024 23:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKs4J/uM57MehjBI+61lKXrwLiEZhGYSLsU1b+KUKxKXHJKqWun01zhOxsd8/TdjYqEwnc2A==
X-Received: by 2002:a50:a6c3:0:b0:56e:249c:397b with SMTP id f3-20020a50a6c3000000b0056e249c397bmr3161056edc.28.1712818040746;
        Wed, 10 Apr 2024 23:47:20 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id s24-20020a056402037800b0056e44b681a6sm397057edw.57.2024.04.10.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 23:47:20 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Kent Overstreet <kent.overstreet@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: improve entries in CODE TAGGING and MEMORY ALLOCATION PROFILING
Date: Thu, 11 Apr 2024 08:47:17 +0200
Message-ID: <20240411064717.51140-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5acf2502db99 ("MAINTAINERS: add entries for code tagging and memory
allocation profiling") adds the two new sections CODE TAGGING and MEMORY
ALLOCATION PROFILING. The files in these sections however do not match
with the files added in the corresponding patch series.

Improve the two entries to refer to all files added with that series and
drop the entries to non-existing files.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2d913c64704..e5431f06ab55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5332,6 +5332,7 @@ CODE TAGGING
 M:	Suren Baghdasaryan <surenb@google.com>
 M:	Kent Overstreet <kent.overstreet@linux.dev>
 S:	Maintained
+F:	include/asm-generic/codetag.lds.h
 F:	include/linux/codetag.h
 F:	lib/codetag.c
 
@@ -14241,10 +14242,10 @@ M:	Suren Baghdasaryan <surenb@google.com>
 M:	Kent Overstreet <kent.overstreet@linux.dev>
 L:	linux-mm@kvack.org
 S:	Maintained
+F:	Documentation/mm/allocation-profiling.rst
 F:	include/linux/alloc_tag.h
-F:	include/linux/codetag_ctx.h
+F:	include/linux/pgalloc_tag.h
 F:	lib/alloc_tag.c
-F:	lib/pgalloc_tag.c
 
 MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-- 
2.44.0

