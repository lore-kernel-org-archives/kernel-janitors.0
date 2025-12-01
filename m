Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE803309EFE
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Dec 2025 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592171; cv=none; b=q5oVNnCju23STax1PEcxPov3d1d80g2BHEZzVmTh6T5BNOHya7wq8t62xAAI/urH5QMxjPVfnz4bnYfnFxznv6rvKJC6RtJLUdvfWcgGQDv9I1MK1yV/aHKNVOCsXNmhhm8U1JlwF7drgQ2vvvbN3lk0Mi/vjIb2duGiWhQovL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592171; c=relaxed/simple;
	bh=1LfAXaHtvpn2Tq25e1MGVNQtEllCKk2aqTGoO9A9esM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sa+m31b32HhwvMtZvSjpavnI9nCDJRo15bJr0fGvv1I431329CAI4Idl+BY3LuO23264WNP6ifN7wyjf1SX8p71WdlWUZkRE7lqYuKb8h4QBNaJ2c+vFc7ydxbzWHM5s8kV2o7Qr89sjVIjphXkpkv7q82LKSbmGTssabHmuLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z1EL8Tq0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qyDqD9vq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1EL8Tq0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qyDqD9vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764592168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ca8yK1wS3qH2YmoRxhlaDFY2F5cnDgLmksqHhgU1/EU=;
	b=Z1EL8Tq0XfJ4Jvbi/QLYSBXK6kjs6/7B6mBcb0ymxRd5UjVCfZJxeVfjiC4Bd/dIHYv/Qa
	+GBItHdABsckxOI5LYNOvV33J3IIeHlffqE0EnftEf5pDBh1kOv3tKlcSjYlWK5Z4rKDRc
	R2vzjjIGi0Pa5Z84NJGalFyMnA9WCFc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-zfxOZ0xdOuO7aEphrbpXwA-1; Mon, 01 Dec 2025 07:29:27 -0500
X-MC-Unique: zfxOZ0xdOuO7aEphrbpXwA-1
X-Mimecast-MFC-AGG-ID: zfxOZ0xdOuO7aEphrbpXwA_1764592166
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so32220225e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Dec 2025 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764592166; x=1765196966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ca8yK1wS3qH2YmoRxhlaDFY2F5cnDgLmksqHhgU1/EU=;
        b=qyDqD9vqqWeuhdP0nB2PGesuP4xgfQIpZqMecJazqHBkzcjbl9AqaWNi4Cr6+vGmbI
         P1IryiT94KoXW72e9xpB/bXpoeNFFd+CgrUiZnp15uo/aXdLsHsI1hmjvtl2JeaX1siY
         2lsNjnFnNRhuIrVt1GW+UR1/G5+ZkFkn+H9cCV2acEMssOobBRaBkWRArTU3gPdrDlw1
         LeIDNTGGD0o/T+ZeWuHJbFu/CtzxMJcZisxq4iw3OnIXtJ2VeYD5n4Pw7xxZvuEY8lHg
         vWS0aA4Kim1EElwdYlMdnQdOPCK4qcnj/1nFfo1tfKTspsD1VfP1CUt68W2GiXTfxf1H
         tzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592166; x=1765196966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca8yK1wS3qH2YmoRxhlaDFY2F5cnDgLmksqHhgU1/EU=;
        b=LeSaWsWCZUE+nNwaGmjYpmNgHWjZTGE80UCGXAa6tj/Nj/NRZkNM1X827FXvsbP7FD
         02on+87K84OVOaqhi5oaBzkTwIEEbwkVgbhhYiMhCZqbZg3WBL82u/RKC09SrYOxZNRx
         7HYfmATxe+VHDeaE1K7rtBOQuIChW8YK4IBqnmyS/44tt/xq77uMowwkU3oKdnpCbIfL
         PEvW21bh2hGlNv/02wN3qyr+ma1wSO7UUcR2ql18QvE4oTS0hYqGiWxAhRXJPwZCylas
         wibSQT2KTFhul16943+VbOxZpBvTtDH0hGjVrGSvXc62+33F7gB6eSZrBVye9P1/8DGK
         EUxA==
X-Gm-Message-State: AOJu0YyQijTo6g8yY12Q6dh41Qvbj4ukDbOajrY8zBSX2Pifkkz+tvE9
	0JYwPDbbdfuFyDrCLd4rBMWmuorrVUI38OQFW84vWmTLrHlq7glvHXvQxRs8ZGeV1D0qRId/uxx
	rZ1m7ZzkRHqcIeNCVUxSAp09ZKUXguT+r/p8KEB97Q3B6SVG59LE7a+OxOqlG41Qtnn+g8g==
X-Gm-Gg: ASbGnctbu7ouzYuOtWDlmnFpNltoynuBIKeZaCxQdNee9P8btkVNN6ex80YsWcXDSZQ
	jZdGDJUzc0wy+KRBmYyY9E8oHE7Gq1KcvhFxdSp6+zGd6Qg1huHAX32FFK2vWAFN9zCtIxZo0mx
	JMYgmJMWeyFhXktX+R//iMmIAbco6CmwgB4QYP54lqLv2HiYwQIVJTFZjPyHufOFm8BinCkoqsC
	ncdQaFQbC3wz2wd3V1PtzUgkX4j6JPUx3GGBy/dYKVthezKqBH4/HS2FSe1DNtAcT90GMcTbU97
	K+ZgOivDUFsHqv+A0tm9HbgsW2Q2nfaz48xImbrB3CgDzo2F497axyJ6g8exOJkW1ZVZItG3e1s
	bteSdZdfqTNccA/f1fXu4IDFgoLtIjiqzA0wB7ST8U6KFeHBAjBEMHDnpmx4=
X-Received: by 2002:a05:600c:35d1:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-477c10d6e76mr438528455e9.8.1764592166412;
        Mon, 01 Dec 2025 04:29:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHHKHctxlRfqZ9WkPraYQ3bIJJ+WctP0gnjsdA4rTh8AqmKuDWYVCveAkjDx7E7cjJwY7WCg==
X-Received: by 2002:a05:600c:35d1:b0:477:fcb:2267 with SMTP id 5b1f17b1804b1-477c10d6e76mr438527865e9.8.1764592166016;
        Mon, 01 Dec 2025 04:29:26 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791163e3cbsm243345255e9.10.2025.12.01.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:29:25 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] mm: fix config option typo in header file
Date: Mon,  1 Dec 2025 13:29:22 +0100
Message-ID: <20251201122922.352480-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") significantly
refactors the header file include/linux/mm.h. In that step, it introduces
a typo in an ifdef, referring to a non-existing config option
STACK_GROWS_UP, whereas the actual config option is called STACK_GROWSUP.

Fix this typo in the mm header file.

Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 96acf31268ac..394126bf637a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -443,7 +443,7 @@ enum {
 #define VM_NOHUGEPAGE	INIT_VM_FLAG(NOHUGEPAGE)
 #define VM_MERGEABLE	INIT_VM_FLAG(MERGEABLE)
 #define VM_STACK	INIT_VM_FLAG(STACK)
-#ifdef CONFIG_STACK_GROWS_UP
+#ifdef CONFIG_STACK_GROWSUP
 #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
 #else
 #define VM_STACK_EARLY	VM_NONE
-- 
2.51.1

