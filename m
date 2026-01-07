Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA42E54B3
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Jan 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767776694; cv=none; b=N4S7VDw+4jZJdgfyz/arNRbeFZ+4+nd+RPX8OxhjKZ5ubXfkgt1iF1o8UYjSGwC6xSQAAzL1+jKwva6LftncbGLyWxVIl5cT2JqtSw4TIfS7qZBhMSvipGKI38HmoNTTxxFbiRkxJTUL+/dj3BlOaAIhICLmItbZ1axDcG1wc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767776694; c=relaxed/simple;
	bh=zKsd5LIF0e7TazCmj33gVfI/geeFEEoO4EW0Y0DLAGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RHpwj8//UutwXoOFZCuzSz4gZrBpO9EF0ATYOjK1WYRrjruXGMWNH6MPG0Fu/JMiiJCRrZfpqYxotu3TMG9RH+m3dNSKHj8XlncEaKHX96vhN2cgcGEDB/UItDr6P/5GKWuZDkgU/PFLm7xJs/ilKqwjmmuTanI96dfNg9eVs4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zf9cFXCy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gcQBMFNo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zf9cFXCy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcQBMFNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767776692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w7aIEirXSlFElRo5Y92xYAouNeJKNZztucm0IeXzII0=;
	b=Zf9cFXCy0ZEEz5X4pLvPtTMeeZVKtvVbGnQXjnadK4vVVlQ+X/Gl2A5xYuqENQjgysJWdw
	4BDLNHZid7ffdsrqCb2Yj2YbRu33k5zLvlkCN6bXV5R3165gniydhsphXa8OA0bCs5iid4
	0+JdUOy0OSneH4xQw4xLHoAEEg/jXJI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-22crSdrgNUu3XmzBZNFl4w-1; Wed, 07 Jan 2026 04:04:50 -0500
X-MC-Unique: 22crSdrgNUu3XmzBZNFl4w-1
X-Mimecast-MFC-AGG-ID: 22crSdrgNUu3XmzBZNFl4w_1767776689
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47a83800743so2778225e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jan 2026 01:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767776689; x=1768381489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w7aIEirXSlFElRo5Y92xYAouNeJKNZztucm0IeXzII0=;
        b=gcQBMFNoajZQ27gJeaxrcB2ngJtkVQCHGES9ATN8XnCuSrsH12rDAn7pdPMfvycWcE
         k+VPGQ+7Wv5K+9tNQUnqCbN/39t/3BFqaZiB0t/Wlu0bLNHOiBQoeAcQPK2/jaGJWNpM
         oHkjKt9FwjCdxuHGeSc7f2vuM5IkV8yYxc5ASTObvu5tIwj9LB85Z+V0iIxex5macxCk
         p69ymIulQFF4YokjlSOKWsviCQSqwZIHJKlLtTvQg3Q0weUGIobqgwdgA8rgW8MXvk+h
         lpfDrSNP5UFqu3mtrhT1P3zX5fsBxNAAOeyKo3yHWKVom/Dgp66B2E+q4iufBngF4kKU
         wBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767776689; x=1768381489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7aIEirXSlFElRo5Y92xYAouNeJKNZztucm0IeXzII0=;
        b=duInkoFaQ5E/1LHLwFQsuH1eYu9v3dD68lshZXXH9fIFJGLwMW5c2/Vgfxt+3LSpHW
         HM5pC4/pQImMMwaUWwQYUT0tVXiUV3NN2V40CKUQUH1NBWlfISsjkmhpxuf1D/R4/zi0
         idUPR4PZqdkc6PgToLxP3dydyKEWlSiR3EQoySmqx9IAxD9fp/96e4l/rppn0Vcq39u2
         Uh4t+tMjQFSDbkxIGwjkL9PTB3kngSSY21uIVItXnHJwPw3RXOn93Q3GlP0JcJNYjEuL
         Mnk1bpwV2X2ciMyfeoLrw2AJ49PY2S5pZ2GydJyF/yXNwTaF4qkaLDpAF9Y1tUcmaGCZ
         l3Mg==
X-Gm-Message-State: AOJu0Ywo68/nEkXC20909tpp8So80fvQnXK578Qdf4vBAGl1TLHJpn/p
	nOJwJcR9JY4IzS1OFP5OTZrRjc+7ooy5OA8i5vRgxd85qW30juwzJyhIpyqrsD+WpT0OqB1vR8K
	zk2VsI0/MTBSE6baSG2WyJHH2Ms1W5tUW/rlkIkYlSXsihMDUU2c8JTstn4mcEWbwHceXyg==
X-Gm-Gg: AY/fxX41/fSgnhDKxwNWLQCTwNq18LYKi1H1jxqmb3nAGKgcxUIeRsXuUmD0weemDp0
	HViXNHfgxgQiGBPSAG/TzvUN8kTh59uvkspzie75a5Hw5i+Fu6gCqfpWt2pd6hkxy34sq2f243G
	L6entmXx822B+R1rqfUiR9RQpEwkEjQKvFtCjIurdycwjxjWXUJQZe5hEYPuITvVYLPFaZqf+Sa
	g8g1fbfYI0dECGMgysHv5QvUc0kPRK3T0R9fXzoDkZ3wWsFJXBDKRJEhhsCcG9HE888xHyPL0Zm
	CxHhBWX8QlwQirZEJHuKlvLujBbgSCGJfH/RXLqAPwcN5i3wV6ZmJqZe+83eORM8I9sCYPcYVCI
	9/VYTWmaztQ3dWS9l5aERvIpZId3q9Y9+/42JnvEqDnEIQCHinudcF0Ztanw=
X-Received: by 2002:a05:600c:4685:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d848787d4mr19066365e9.16.1767776689290;
        Wed, 07 Jan 2026 01:04:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBxZvbctLk8Kb75sAgCNKupX5//pUrqHmf5E4ojGAgMRxBeSVD8oZNwP8f79+dr08mpm67VA==
X-Received: by 2002:a05:600c:4685:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-47d848787d4mr19066075e9.16.1767776688814;
        Wed, 07 Jan 2026 01:04:48 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm88569055e9.1.2026.01.07.01.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:04:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Mike Rapoport <rppt@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
Date: Wed,  7 Jan 2026 10:04:38 +0100
Message-ID: <20260107090438.22901-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit e8d87911a204 ("kho/abi: add memblock ABI header") removes the files
in Documentation/core-api/kho/bindings/memblock/ and adds the corresponding
content in include/linux/kho/abi/memblock.h, but misses to adjust the file
entry in the MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION section of the
MAINTAINERS file.

Adjust the file entry in accordance with the changes of the commit above.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b28650893f2b..1ec85c68dd4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16454,7 +16454,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
 F:	Documentation/core-api/boot-time-mm.rst
-F:	Documentation/core-api/kho/bindings/memblock/*
+F:	include/linux/kho/abi/memblock.h
 F:	include/linux/memblock.h
 F:	mm/bootmem_info.c
 F:	mm/memblock.c
-- 
2.52.0

