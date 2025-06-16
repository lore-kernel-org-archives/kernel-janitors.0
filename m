Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF42D023
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082850; cv=none; b=mLvvZ7XLezLsho+qGJrUNEBcK5NvfFLPJ1zp6SWRpJ0ZnxyuCy0OORD4IWVvWNIPRabuT61WGJVAjDqG/ZV85QpBX2nGbv7Iy4/t4llwDb0tHJ4xB1PVzLoRAsXg68fOTXJygtThNm06TiU1c5Yjn4U0CiX7KvmWu5/p2HiKUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082850; c=relaxed/simple;
	bh=P+zPwJ+MHYBw3JSkhg0euCx0pEPKmCfHyo9z2ynCm3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fq+VXypi1YBdFVYv1KELj8AFaE8UydoqFpOvJZePGgM+nZYB5A3yBjQUg0mSI41sEmFTSDe9C0EwaQ7bzLnlXfyQz6pHUh6iG4v6FSfIl9HNP4hfcdKuYYo7iU1jKI3XeRV4D5xHPqFoAQVvy9AouvmYQwUf/QERofpJFrdaUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5XChylb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5XChylb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750082847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yCjumndBh/FcztSBAz8+g2GXo44t1fb+ZLhKBRZrEb0=;
	b=K5XChylbNMyCIFVmvdRYXJk4vFMHEKwwEbMdK3T23LuB9UKOLAiTq9OFyysFsimVLVa3Ne
	ugvUNjOZB8ZQKnSBEEvo5d9RfaGw5vGOvg1u5qPnCct8GcidYpYoo04VN8TO9iC/lOa59n
	FUHnwcAOXuNqd95Lh5L/TlnnBvVbSh0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-VBTc23_4PxWC7IPu3hiVaw-1; Mon, 16 Jun 2025 10:07:26 -0400
X-MC-Unique: VBTc23_4PxWC7IPu3hiVaw-1
X-Mimecast-MFC-AGG-ID: VBTc23_4PxWC7IPu3hiVaw_1750082845
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d57a0641so32416205e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Jun 2025 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082844; x=1750687644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCjumndBh/FcztSBAz8+g2GXo44t1fb+ZLhKBRZrEb0=;
        b=UBDbzG83SRnU99UL9wwlVMxS2onoaungyK6rXawPHSe4PdQYKJ+lVLLOEXOGCKiV2m
         hgWwUs2LFgQWqMCsxju7AHPiPf87LudmfnDn5XHle2TCkGxnVXIzBwzAX/Brcyn1sugS
         nIqr2eZYhUP32/hFMWAq1aidmN1sZtEVuZm3IVL96X96SHzvcsp1LmWGlcZ9Qa9O4H8a
         PeuFmgX7gDHsGC64GcARadjdic5INvJwfMBQvfwvrul90xQ5+IZqfJnA4DgOg/YkrrWL
         KN/o+IXLXQjeUDVT63aBBQqKbDqG4OVSnIpMrWjEild0OJBlKiatB39GzwzatVhrRUwY
         x/WA==
X-Gm-Message-State: AOJu0YwnGYPLnCFLkZxonzOwZd5w2VVd7dAs49Pt5j46EOANfga0zin/
	jsp1FBHBVMAfjXNlUPwnLdO7HMogmOYBvxd67BIGdTY48gj+TDGs9kYZUTQry89irgALamXytu6
	fE7y+l6dLS3rh6UJQ7wEZiYTzN4k4XDLiyEa0IHq11H+Zg4OkpNcjit0tSRkT61m6cWBzmZjsAL
	JkBQ==
X-Gm-Gg: ASbGnctINKys2XiUzbn9QPqcEAB0n3l86KpJjTMBuBvSl3fyVwEhMPDibha86LCs+7t
	cQ6dERerNijaTEQXHeEr3c4iB/hlnKyKhyssTS3LDQvoslJEjY+rbH/pD5L6mIRPPfNFbL1hknk
	zqDJMjjnylx7Z/EmuFmD5DtN05naHw8sZKEfOZrmih52R5U1cHRxHgw994m7F7E26KsUgTKVUBy
	VEUK0DYawZCd84V33p+A7R+h5ivGDHLkhwiuPtLgwHDjpT1C7FBy468eQVg1oR2NRqggbCyNhxE
	HGHx5BlOmwa/B+odVvQwfqIqPTI05K4+n4KyGaUBwRpFypt3xK1NlPerrVRzneEIuHZ11w==
X-Received: by 2002:a05:600c:500d:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-4533cabfffamr72330915e9.25.1750082844367;
        Mon, 16 Jun 2025 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELrHqsFCSRF5sOJVf+SwmO3E4ppjKiAUPCBq6zAgvHq6fLkivA9kdCEj31kWz9k6xL7u5IUQ==
X-Received: by 2002:a05:600c:6208:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-4533cac2cdfmr71712865e9.26.1750082474384;
        Mon, 16 Jun 2025 07:01:14 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:bf5b:f273:a506:f71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a60f5asm11071883f8f.25.2025.06.16.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:13 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in CPU HOTPLUG
Date: Mon, 16 Jun 2025 16:01:08 +0200
Message-ID: <20250616140108.39335-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current
CPU ID") adds the file rust/helpers/cpu.c, and intends to add a file entry
for that file in the MAINTAINERS section CPU HOTPLUG. However, the added
file entry is rust/helper/cpu.c; note the subtle difference between the two
file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
complains about a broken reference.

Adjust the file entry to the intended file.

Fixes: c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec49e1973425..c23665ac3b3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6263,7 +6263,7 @@ F:	include/linux/cpuhotplug.h
 F:	include/linux/smpboot.h
 F:	kernel/cpu.c
 F:	kernel/smpboot.*
-F:	rust/helper/cpu.c
+F:	rust/helpers/cpu.c
 F:	rust/kernel/cpu.rs
 
 CPU IDLE TIME MANAGEMENT FRAMEWORK
-- 
2.49.0

