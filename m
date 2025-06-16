Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D5B25E453
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068283; cv=none; b=BSbTlM8S16LF5wySOyYjGLl8yMGSkRguEpmzkNOOSrI/WKGPDPNRV/pNNnM4vFAyu1iFc2yJZXaRwVCVzwQMi3dvPeEJZ/L46E2qXD5PjIoPY6bIGBDCNL9mlthIglYS6D/yY+ehBVCWdWNn7tsFKWT8Vcj4RVkCT9aCS7hmh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068283; c=relaxed/simple;
	bh=uHrG9AeiPfO2ujCvATyl7C613FFrJeskk1YaGMKCsyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4Qizrbuxb3F0xJRWb083sngKpC4tYgflO1CRPrxvpXLCdkbkrhRGqSwaJkagZXeaoA1trnwIPgNuSvCrOJEaFsHhgMJmorDTeOcUlu6D4/NuMzxgKiBYRYQ7/JvOP/O0HGmtUF+Re/6sz7YvC3uB62EywHupcp1sJBrRnG2Osc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOV9yn8r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOV9yn8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750068280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cdzwj7ImrbS9o0Bom5tv9zCMbeN8T26Ybl8KaA09pw8=;
	b=OOV9yn8rMlmB4/sBKDYF/3MwacCUvowJy1dso4R3oEncuoN+EYKQU/2rlIhc2Woz/Zi97A
	POZYXctP75IdhHC30A22gw034dggKjrWnxSIJw/treCl//PyRlXPYMqKR/RBywyA6M07CQ
	fbAqPQIM4H8MurMbtL9lzr4CmI76JuU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-vciEKkCfOQOrgnqEeUq_CQ-1; Mon, 16 Jun 2025 06:04:39 -0400
X-MC-Unique: vciEKkCfOQOrgnqEeUq_CQ-1
X-Mimecast-MFC-AGG-ID: vciEKkCfOQOrgnqEeUq_CQ_1750068278
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb94dbd01fso407843466b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 03:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068278; x=1750673078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdzwj7ImrbS9o0Bom5tv9zCMbeN8T26Ybl8KaA09pw8=;
        b=lVwuyFsk15dUtIdiVSIRejySlVvTyWE835p+jyHjFTRS1ac0FjqGe8+mHBwRKHhLZw
         vHIlnM/Y4RpuERHD5hBjy1/cAskzc4Jyiln/m8hmdFUAyCxx6rMkPMk/NOFEX8r3KpKA
         /JMMkyB+i/00Rz7OLTHlXdcp2OES5LZHL3xMqaZOIabQnng7XpuXsohXcvfgioDgIIyi
         OqiNVcpJsjEk3wVSRD1pHPe2OMsBEvXBZZy6CkJtBD0rOSwRlU7porN8Zr6wam4a6bsg
         f6BYrdpiHr/8wF85wPxWkKm/n1VwzBOfDF21LG63383MDHwLa93c/bVLAQ2hDIe6L5/O
         W1Yw==
X-Gm-Message-State: AOJu0Ywo6fdWbBs8Ybbqdpka8Aim6KWFhivot49DKMh73Q5KsS1e/nG3
	dTb/jPlD7YLi3n5JrXiHvnqA4i4RsSQr3llcsHmkYXYjitRxpjmb9Sjp/thq6yhDrd06DKo2vEm
	xhpRbSKS2FUAWZnosMDSVN68FiG0xrAe6DCy8NuM0XKLGgznHqu7eUOcll7tN/pG9qtILiQ==
X-Gm-Gg: ASbGncv+YWW48nL6Dc+XMNrrQozRE7BjwGCxfjhqKzVksUdlxdzlv4YhKe5NUOOksWS
	BWGsAHy66Zq8pAhpY14DueBtOdWw8fN6/9xLrn+xYEgfhFssEeuB+DoYmQ8DIT4GM+kH+LWA8Qr
	15G26SkJkxpFSA88T9s+pslvTDFTJjmrR6Og0eO24s9Pz/RrBcn2PcGO/bhht/dC9p9Y9foJTmN
	qXxG0FpmEKVHFYNzthpwR1DagsZsEcvqhKQLF1u5KZZdgEP0Evh7ozB+eVLa5B9z79YMWbPmI0e
	XvxUvl7IQKs0NVtE8+rvFdmasK0i4+LlQfGt1yccZu1IgZ8RULIzaC1f76+E+fhG9WVp
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-adfad686483mr812056166b.55.1750068278291;
        Mon, 16 Jun 2025 03:04:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmpyH9jeg0f77jDm3nySdq6N+wtnB02XFddQoRJxIvvAvLfKSuRlmjGjjHEdBqpoEQMLrfPA==
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id a640c23a62f3a-adfad686483mr812054466b.55.1750068277873;
        Mon, 16 Jun 2025 03:04:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec815992bsm633223566b.13.2025.06.16.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:04:37 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/its: fix an ifdef typo in its_alloc()
Date: Mon, 16 Jun 2025 12:04:32 +0200
Message-ID: <20250616100432.22941-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a82b26451de1 ("x86/its: explicitly manage permissions for ITS
pages") reworks its_alloc() and introduces a typo in an ifdef
conditional, referring to CONFIG_MODULE instead of CONFIG_MODULES.

Fix this typo in its_alloc().

Fixes: a82b26451de1 ("x86/its: explicitly manage permissions for ITS pages")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6455f7f751b3..9ae80fa904a2 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -228,7 +228,7 @@ static void *its_alloc(void)
 	struct its_array *pages = &its_pages;
 	void *page;
 
-#ifdef CONFIG_MODULE
+#ifdef CONFIG_MODULES
 	if (its_mod)
 		pages = &its_mod->arch.its_pages;
 #endif
-- 
2.49.0

