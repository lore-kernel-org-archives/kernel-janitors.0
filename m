Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198E31E822
	for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792621; cv=none; b=lcaY24EI33zNoy1Dcg2BnZahlWOtO6Jq6EHgNsmZsYwnbFCWpbI8lHhH7YfhwtiG/UQX3bxF+MuifMa5ZpN25GqcEFjCVZfPsjDFSAdDu8QXnm/93Ly8tBnH48LU+Rxe2R0qb9r7SQfvHorwjFMwAa2ltRUlv/3QJp0zwBwHVqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792621; c=relaxed/simple;
	bh=dspuxqTe419FD+lEMwkgisODXMHd/wKMI0WUc//Nifk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQ9K+i2F9Ih+sj7PbAw40YyemoIHeBmuZqopAyYI9cL1wee8lyujSXtiDO+VV0olJJwDsjRs/anLCPBfhmEaOuD9t71NicHyJo3Yv9uScLc7bItosRvt1IOZGYJIbhRp70YEUnRqsmJ7CDIe8zx2AAl8i65OMJS0KtYZLWzfHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBT2W46A; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBT2W46A"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so5690679a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Apr 2026 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776792619; x=1777397419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWn0gXFXwrRfN5iJsoKTIypDbNwmF/nvBWNaZZ5XE+I=;
        b=gBT2W46AV1I1wRnab/Rqz9IFNLyUeVAKx58wXTbQR/Tb2/PEjVkQK61TqEb6Rtgka9
         SkAfwEiPFT96cRQWE9wLVRTH+3p29cMLaw9PhwwyTlby2yMNn8sbm3UrTsHjI4r22DZe
         7SeaINNJfSuOnGwtrYreR+84s7proueTFk1qvgPVUG21khYd0FWPns+poUWroJbYJ0uh
         dXsPoqir3uMzWFdITMWysl1g4YeZWXjc8QqyJiF83vYhRdIfgvC36cIftBmHiOR+ajZT
         yjixrZmh1nKXpzEpjXG2ALOJV2+h+jQI/BU20RjTdarfKuU6OEFTFJ9lytbqa/i+pnnP
         kUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792619; x=1777397419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWn0gXFXwrRfN5iJsoKTIypDbNwmF/nvBWNaZZ5XE+I=;
        b=DZ2CgPP2AIo3vMFjEmFzstwKyUyiy3vCYyJprXOO2xmVb8YuH1wrgHp99Q4gq4f66p
         0bZG+GME6YtpMSXJo23WuPVce83whMutTLTn302drPBxiW+S+wJrHC2OHTJIeQnpcCnH
         H0l/Uskapwz+X3uyT2NATIitfktDwvGzep3R3bRhm3C8G3WQbLlJJhhL5jbNpAxR/gRT
         nNtOBXjCGupQFRkXl5EK5QXiIntuQoVuj3kQvBtthXDGXMknZtjLa9JMSFay8ZYiX/m8
         5HS1QW3r8jH5ULTBGESmT1KUGnT8viDHgJ8U99c3GXT29EOkl0tEcjoKY3i/zyGpEsK5
         TdJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ErDhzjI642EuQVTJT6Zb2agro24opcuvVZ9D78uQIDDlp4o4pu8Dl8b0SvvNKn45OmponSzfq757g9thC8qI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FhiqvrjDzvGCg5Em4vim9kajHIZjQuN2x+dmIAe5EWRcyj2t
	2d8afRxSUlig+bR95+BuLfc1yKPP2yYMUGJngPptFcjYxfNl/gsAtsFT
X-Gm-Gg: AeBDiesZg+JdSNhs8hjCKoFZLGBMhMz3LzwjqO0sA3DgeU/8l89ewRsquX6v/T+Fz9i
	rUuGIPwiO2BrGY4n2iNqZVlofm3XlhdEqLRE6Etn4jTnM1cStKwMHY3zrmFtNUIYnYpRFmBdEmF
	CYYUKG3TIYHoJZZw8+6V2zB5eGnA8JrbEr3vR+bYNDJWzHQzA8v5Xv7hrWlBFxtPNPsgC2NywnF
	YQy7L+cIu0qVpXMIHpdE9hft3GqSPTUvlxyF8UE8fyn0qj1e6QgG+s1eDLvLMOLPxeQVwwqFVWB
	5Ib+soR8ReMS3x+y2Z0FU5jnXBpYnPs33N11AkOfngGIcXyvksW6kz9Loelzf1Idih0y1ppwJLm
	lz6OZuKcSmQovwQ0SBexmZxHkw1gMfWIzHsVWgmdQ08MFRMfGlZzcjTBma9FH+wAzyoxyyyFcWV
	irhUHRBaeNKevDJuxw/NkAEShzJ0D6e2hEdpLE331Likb5qQeu+GrUU7OBaeaUhGxrzq1H/ZdfO
	IMU8Dc/jbz5x4HifYhpD+ATAzQ2xrpbkovwWw==
X-Received: by 2002:a17:907:9629:b0:ba4:94f8:4df with SMTP id a640c23a62f3a-ba494f82009mr829389966b.17.1776792618257;
        Tue, 21 Apr 2026 10:30:18 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ec776sm475683266b.16.2026.04.21.10.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:30:17 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: kvm@vger.kernel.org
Cc: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	vkuznets@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: hyperv_tlb_flush: replace NOP loop with udelay()
Date: Tue, 21 Apr 2026 19:29:53 +0200
Message-ID: <20260421172953.191345-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded NOP loop with udelay() which was added to KVM
selftests in commit 6b878cbb87bf ("KVM: selftests: Add guest udelay()
utility for x86"). The NOP loop is CPU speed dependent while udelay()
provides a deterministic delay regardless of host CPU frequency.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index c542cc4762b1..68ebd790ff41 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -141,15 +141,9 @@ static void swap_two_test_pages(vm_paddr_t pte_gva1, vm_paddr_t pte_gva2)
 	*(uint64_t *)pte_gva2 = tmp;
 }
 
-/*
- * TODO: replace the silly NOP loop with a proper udelay() implementation.
- */
 static inline void do_delay(void)
 {
-	int i;
-
-	for (i = 0; i < 1000000; i++)
-		asm volatile("nop");
+	udelay(100);
 }
 
 /*
-- 
2.53.0

