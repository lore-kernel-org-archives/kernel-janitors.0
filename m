Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6905A29D275
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 17:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764352343; cv=none; b=FlByW9/LC+YU8HfCAkRlB72n8hwQxMWjS5t0PkVkrPZoBVXMpNWwBxkdiShShDmfKfXTq0DvDUTcDyuR+FrP2U6qDFl8wC8KP8suc1f4ZJxG4G+oXyag7kjwdVVAV3vlmZ/xX334BGm+phSopv0+GFab00nwXQVVH6IDx58ch20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764352343; c=relaxed/simple;
	bh=GkebHRZ4hW0W7hKq0Uj4FDaIkukgfjcfiLZIR/1thWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pWqH9+AXkOgwIDlQkANI3zLxEpK1D8iX8t8XlZnmjbgtR1DSj7HhPBzv6uCLnqhTOoawHFdd4lDAnvCsBsKW54RUwKQx9dL28JRBI9xp7GT+/Gg6l8QI4sAykq8kzQV/NRuNqKtRRnI5k77ZYNRappjWRIFq3nUjwCQ6ergFiOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKXKYfTL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKXKYfTL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so16768855e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764352339; x=1764957139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAfyF823/XbGGGKg2P6nxUijTsKpVqaSaPrfyNHwf9s=;
        b=BKXKYfTLWed173LFLR9je6NtxzsImQGF4s9UD0lAxP50BiSrS/pAFPpoFakpJy2Nc6
         cMHxJZwD/MuBGz4awUmZLNZOSZ8+6d5jymZBV1WPpQpaHW4j3s7DYMFpjmIi/UKicP5V
         YP107sQNpznju3d4xVo/kmrr+HZOsm9Q9LcRDMEJck9/PDy5ch01nSS8GCnrECwpigtf
         lElzEcQXctdaxFaOq8GKSLQskgTxtRDE+2Lbu8fmBKy+0rP5Gv1d36V95SiH1kADJ/st
         bLuLWrpIcwwM3wBZxTRzrRFOoIo00DlaqY9DP0edUD8zNRl6sePhFajKRi/zg21pONtm
         /kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764352339; x=1764957139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfyF823/XbGGGKg2P6nxUijTsKpVqaSaPrfyNHwf9s=;
        b=W6o9za4+nmlT6micCzza6ECwev4Q8fqyq+4ruDoy1Ck5Kj7XHtUHT+lT3Rqm/PrVBe
         dokuNwz5hjDkA4jnZhbegjZUSURRerILWYGyYIOEzTprwKy7GG10HYCpua8PpEjUHTlm
         ObG23u/yUKP4Rb5N1Om25MYerbUdpfMtdkiIceWnW71vP2G/j12amMjQeVSAo3Rx/94o
         lq2dloIjZfkeDGXvEhr9craVblo9hEZshohBs6bBMjeO7ixRzRSER32pecoBLK9WUvLt
         ZIjUCax8Lzkq7VMYB8WdB0p+X5hlJQXFvycmLDoYgJTRF/nZs299KPztJNG9XwyVyzp/
         lFPQ==
X-Gm-Message-State: AOJu0YwwbvC5hcq+m2EH6spBhEt5jEj8EdUNqZAVRdfkmOBmHJzY0pQ7
	SFHy71C2zcQ/xmewxARM0j+vR0kByEX2RvyGPYzoNaGpKtqPyNF6xVnAijD7GdVQ
X-Gm-Gg: ASbGnctfAW4goGKwgdj/QbPLMKenkLx2axMWq5dapeWaunIChrSM1qb7tDGLGyp5btf
	2ugSK3ywdFWLc/msCpISdh6gfLYKpEk1O2HbS80Rb8vpUZ3hPJrug34CBZUJ2YvWwEtWoBCOuv6
	GytZ1xM5drOYb8g0g+uDMQePH20UcVVAaYMPDsMnRyriZXnemmI3G3zlOqJvsiwrltH1kJRY7St
	mP3TiRLybZPwlzywe8BYPZpZt/T0LJPS4tgkgPP/xF+h+ShbEl05RD7RGFO7IgdyJE069VMr3rx
	tKo122YrMXFtEaoFq9nu/MY9pKAb8+4KubVjGN13upurDudjuctrKWf4jjTG8eXNb40elSkgEKh
	LzzEQqN9k/sa41/dYXyhvabgQ1CDL4E7OdY70y/uWtizIXp2VirK/KR2VhYkno/2WhY3pTixZgz
	TzP8Day89tOQ==
X-Google-Smtp-Source: AGHT+IFNrav6emQa7eo4LXuc9QahSL2PszCgaxJFgT0UH28eKJZFTLEzFFZCoVSa6zVdulqINe9u9g==
X-Received: by 2002:a05:600c:4e8c:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-47904af05b5mr178200545e9.15.1764352338440;
        Fri, 28 Nov 2025 09:52:18 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47913870b38sm33438875e9.15.2025.11.28.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:52:18 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] KVM: arm64: Fix spelling mistake "Unexpeced" -> "Unexpected"
Date: Fri, 28 Nov 2025 17:51:24 +0000
Message-ID: <20251128175124.319094-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a TEST_FAIL message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/kvm/arm64/at.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/at.c b/tools/testing/selftests/kvm/arm64/at.c
index acecb6ab5071..c8ee6f520734 100644
--- a/tools/testing/selftests/kvm/arm64/at.c
+++ b/tools/testing/selftests/kvm/arm64/at.c
@@ -137,7 +137,7 @@ static void run_test(struct kvm_vcpu *vcpu)
 			REPORT_GUEST_ASSERT(uc);
 			return;
 		default:
-			TEST_FAIL("Unexpeced ucall: %lu", uc.cmd);
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
 		}
 	}
 }
-- 
2.51.0

