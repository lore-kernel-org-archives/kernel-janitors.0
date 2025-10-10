Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0251991D2
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084508; cv=none; b=WqgcDYsDNdioW5rJQuXz1FeWzvmlRDpKVqyQy1w+0E2S4arNCNNks5mATLjvrWZTNLtXUF5RAGhpiDGRJ6yYx61GOinOSx0RqnZ9y6VLC5XnUUkFOfV2onYJp8brY7ZXJGPewcbjjaYy6y4NaWtUsHCAJGp1leN/lw6vUHTupC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084508; c=relaxed/simple;
	bh=7n9x7QTrcndxlg+tUsPE5c3XWRfvOWdk/79MKsk4w/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6OUGrzF/1b39v/mvcl755hTcNP3BOqbb+YpTRzgXHsDcDO05DtaRU2Jj3L7Waeyrp8uTJGbaiic5OzDPVW30WwJV+KNC40cNTjwLIKPjoPOJKDoolDZg6wXRdXWfhQFC43EPao+oD+/cHbMoPSwxPj98Z8p4XgKltAkFf9sPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVllq2fh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVllq2fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760084505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
	b=SVllq2fhn2knZuaaxCLZFTc7DqBEUvo1P/1QWSUduK4mD5dkoJFkxoSpDoOnRnF++rnCyB
	3BKebTaPxJNfzJWpAIQfEG9+9fl6/eMQ4bxsEliT55i7pGVlUnJlKxK3Tl0wLqad73SCey
	RR4obRM2ESFEVZdqaGeuKJDueROL/8o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-a2uHbKtZMGGGEj5GS0JNmQ-1; Fri, 10 Oct 2025 04:21:44 -0400
X-MC-Unique: a2uHbKtZMGGGEj5GS0JNmQ-1
X-Mimecast-MFC-AGG-ID: a2uHbKtZMGGGEj5GS0JNmQ_1760084503
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3f93db57449so1115413f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Oct 2025 01:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084503; x=1760689303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
        b=hAotKBA7A8uMR9yG68Yij0elXJkqmMPNvXVY6DEvjPvAhPBQmqjA5EeBrDG7EddtbQ
         oEUJLGGd6lmLq9Ug4XL7/s+ZH/Zq/S+Y5Ttx5FyjgX4m7jGff9FmnLxFemLJ8Tqc6Nmk
         eZMpAmzvYl9lnQVg9f0v9GkrM7lthOwtbbAIxV5Zk5DlblmiimrgDe9DIccuLNx1Eznd
         bbhGmQB7Rdi/QqFfg04zmPmmv+19gyKjTsnbz6SGjY93A01Mk0VJadXm+gV/pPb2xU1q
         6HwOXv4lPCVkAHwq9raOgSscunEuvf7EEJlgMR9JrNEiZ/HuEHsxOJxgF45x3wFgw489
         XtwA==
X-Forwarded-Encrypted: i=1; AJvYcCUtfYbmP9MPTYf+bVZ9ti6p+b5aw5uxb8CE9GhpkX8G5nv6Vmxvt3AhaIwCMeoXm2Nko0d/9Hn+IuEc/3Mbwz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+sGQacvHE2VQq23+sBJGxoqRDcsQIZtgyAYOwHtKU8ytZVgE
	QfYSBkmSSAQIBSA6c2ja7IbHrcKcZPIG1/Pri143ICvw9EI2+7cklefd9tsB/wdhE/Iw8RuBmgw
	M+3T3v/40AUuJfcOlJRQ+65KpOJYRyLM4Oe5uN8KQPPFe2exbW3X7JI1ip+3fCLgJMoiDlA==
X-Gm-Gg: ASbGncuOsVceEELwG0/V6Iq+6xJI7uwnFTSWXZZSScOkuEli28M5HSS/43kgvQ+crkz
	wF6LEnt/Hp5q4DJWplNtPv9yi4Rsk85WL8kYiLCwII+zXEC9b0ikBtH0OAqLNXsabNWu8BbxxOE
	Kl3ydkUc+GK4ryCKPKNpZtjVh359xkc1R+j1isLXLdiHAb12t8hZ57pPUfBG0p+fN+i1TWAFVya
	EPljqHwdVbSMCu14MjqRDpF6cOjdJMkIBpqGtwKIwbkqhxpHyqHXitfuVkX4WcQ/Yi99YD7kKy+
	uacTil67L75zJ92ER6R5YCYm5+xG3ONmoue2+JV/S6Dk8btp0eWZNAZWrkjYuffeSeJvrlhot1x
	nLCgwShAcOiWTOw==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017884f8f.62.1760084502785;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtaiyaP4ciHOEVEUj0fw2KNuY3ZMQkjybKrv/92syV0a+JBFL/CPIzPSOnaTNXUhiK7HidDA==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017864f8f.62.1760084502351;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583424sm2946970f8f.21.2025.10.10.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 01:21:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] treewide: drop outdated compiler version remarks in Kconfig help texts
Date: Fri, 10 Oct 2025 10:21:38 +0200
Message-ID: <20251010082138.185752-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

As of writing, Documentation/Changes states the minimal versions of GNU C
being 8.1, Clang being 15.0.0 and binutils being 2.30. A few Kconfig help
texts are pointing out that specific GCC and Clang versions are needed, but
by now, those pointers to versions, such later than 4.0, later than 4.4, or
clang later than 5.0, are obsolete and unlikely to be found by users
configuring their kernel builds anyway.

Drop these outdated remarks in Kconfig help texts referring to older
compiler and binutils versions. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
Andrew, please pick this quick tree-wide help text clean-up patch.
Thanks.

 arch/Kconfig      | 19 ++++++++-----------
 arch/arm/Kconfig  |  2 --
 lib/Kconfig.debug |  3 +--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 74ff01133532..602ede49daf9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -232,17 +232,14 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 config ARCH_USE_BUILTIN_BSWAP
 	bool
 	help
-	  Modern versions of GCC (since 4.4) have builtin functions
-	  for handling byte-swapping. Using these, instead of the old
-	  inline assembler that the architecture code provides in the
-	  __arch_bswapXX() macros, allows the compiler to see what's
-	  happening and offers more opportunity for optimisation. In
-	  particular, the compiler will be able to combine the byteswap
-	  with a nearby load or store and use load-and-swap or
-	  store-and-swap instructions if the architecture has them. It
-	  should almost *never* result in code which is worse than the
-	  hand-coded assembler in <asm/swab.h>.  But just in case it
-	  does, the use of the builtins is optional.
+	  GCC and Clang have builtin functions for handling byte-swapping.
+	  Using these allows the compiler to see what's happening and
+	  offers more opportunity for optimisation. In particular, the
+	  compiler will be able to combine the byteswap with a nearby load
+	  or store and use load-and-swap or store-and-swap instructions if
+	  the architecture has them. It should almost *never* result in code
+	  which is worse than the hand-coded assembler in <asm/swab.h>.
+	  But just in case it does, the use of the builtins is optional.
 
 	  Any architecture with load-and-swap or store-and-swap
 	  instructions should set this. And it shouldn't hurt to set it
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e3f93b690f4..9b4024b277d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1159,8 +1159,6 @@ config AEABI
 	  disambiguate both ABIs and allow for backward compatibility support
 	  (selected with CONFIG_OABI_COMPAT).
 
-	  To use this you need GCC version 4.0.0 or later.
-
 config OABI_COMPAT
 	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
 	depends on AEABI && !THUMB2_KERNEL
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8aaaf72ec4f7..29e11893c873 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -342,8 +342,7 @@ config DEBUG_INFO_COMPRESSED_ZLIB
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
-	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
-	  5.0+, binutils 2.26+, and zlib.
+	  Compress the debug information using zlib.
 
 	  Users of dpkg-deb via debian/rules may find an increase in
 	  size of their debug .deb packages with this config set, due to the
-- 
2.51.0

