Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AA6350D43
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Jan 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815532; cv=none; b=VD9naDlaGIBp/9U+xLz9F33AY4RYmJ/TWEvMFcrIVbce3mPqUUDH1PfD9OKAuSX5r2asHXXx9ADNbuVUSHn0BcOeuLBrUZOQvrnNzYuKmu5CCvi+dh6QJckt5U4OMBaisAfBdZaQd0yPRedDnyYhWftAMZmGC9VcO4DvktMEcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815532; c=relaxed/simple;
	bh=tbqHe7nWTVVi+1lGzHiT6Rzn7QWsfhMb20Yt2chxOYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llebmrMEea/HAqR9UZj2yOB5olNsSAn0t0UHY392pMlO73eLD6g6W8Q8KYL7yN674jf3baXKI9gaYohWDUuIZ0thtv24IrbEKw8Mz4Eo+FE4Kw1zOdi69N6BD8eNvBrpCZIa17xjdPaPD6BZQmAm+MXygN1XycHjWxdJHElx4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SWQQhVXy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iobIMB+U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWQQhVXy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iobIMB+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768815523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3KLks8HumG/ct0j0oeu7oaK/KNIPQYniDI5G70s/ceM=;
	b=SWQQhVXy0IlmZEw9WMKv8lyANVVnbmSKlLW2ZOrauAUnBRdnazVCSRKxgHvADDDoI3hwI1
	FgEQZqfBbiPGSOfygYyCsxTlMfqf1kqLj38l9FGtn4yZp0uAKtNjGKTH89r1QLuK+BoKP5
	HpR7KwV5+YS83knaJe/WFSSXWlJBTpY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-Y-DGk38ZPOOEdvcWOTySrQ-1; Mon, 19 Jan 2026 04:38:42 -0500
X-MC-Unique: Y-DGk38ZPOOEdvcWOTySrQ-1
X-Mimecast-MFC-AGG-ID: Y-DGk38ZPOOEdvcWOTySrQ_1768815520
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4802bb29400so21355855e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 19 Jan 2026 01:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768815520; x=1769420320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLks8HumG/ct0j0oeu7oaK/KNIPQYniDI5G70s/ceM=;
        b=iobIMB+UQLAJTXyFWmy9YiMSxkrEoo1ObbydYdFS5qkL4ZwV8Sv8dqWmC6RFBcHoog
         L6JOAe2JS7OMNxXXBUGG/RLjI+J+lOYalhU9P5fl8v+AJbR541MrdIXQbdG4cG3IMjiE
         HVfhsEsf5wSAGFfZNuT7arnLl8TMqtXJA6VDdQtvgvNqRKexTwdD+NM9cAgc8tV10url
         tsXnYOVOuBjCv+XAnK31rJ5ASjZBFec2TL2ZM7/Be7xG0s5yP5v2J1b43kAh/6ATon9R
         G3f+AcxwaITTCfdWUFuP1cdyVtTi9r9tqshhhNm7orHrnpOl2AQ+fBp4HbA3QBf/99lh
         Gzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815520; x=1769420320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KLks8HumG/ct0j0oeu7oaK/KNIPQYniDI5G70s/ceM=;
        b=GZf76Z5equhm7vxEHw1G99AX4N41CDTE+6jTtIYGtL2/bxvg3qUAKobLxDGjzmqeGu
         mRLItdaPJRU09lbyAQJUa9anbDe2akHci6Q1r8M6I3uNtQnKM64Udjwcv0OiW6vUlGcp
         gOS9o0HLRW02LQYObdVJV6nAx/qJP3cm/bFGqfk/bV2LengNTDzs7ZfMbFrWRRmgGmLP
         mrcQZYW6ZEGqN9n3xwPSYOXVjp/sxkXrAcYr0K/kNRHvCF3okcguPyvic7/WXZU0w9EP
         s7SfcdQ6nK8tgey1RKgGK4eIRKZdNDIBcnqHBlx+tRdI3UbvBIt01yra/Si1weyG3TDW
         SUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgw1xWvP8q5pXvtg0jNhVbnwl2gBP6pLTZz0XTEijkGDuHBmbHGF1It8Ycw7T+dmhKSSTA+mfohIT8CmS5UYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHrILD5YJLTz74XF9zwJKtXI9CIIHzpPh4WKaSFdLLbbDO9e+Y
	73bIOq8/8y+J+BUXdvJmyVcjPCFjgIF8cUX0aFbCmKv+GE/5MAHb+MfGzRWRW2OTXGmF12cb480
	HQ5rgta5e+PLUbDltcfrHK2SVjy8uHspyn+9EwdhuhE4BXQH9U+iRzxhVNHgnz9kIibdIzw==
X-Gm-Gg: AY/fxX7L++jxYjcBPxpBbRQ/NCYlhIdUWu+64DP/dY4iWqya2tunH3TiFxLR8l0Naow
	oPJEB6C0XyZJrn2Dpu+4XK6fUD4dLktmLLyNDfKTTHMQ6sFZo/FuPGoh6M3IcY1tL1s/95AHbff
	/2PYiWtkW8Dw9lSnvNu6Cp9XVLlx8i9v03QwKqxzO3uLZ9lGMSeT8Y6bMjQ05JzSV3QOpcBJYqq
	czmLtDVJXhgm4JyqJ/xBVr9ThYyXIcZznIq1MC6QohvBtqwh0lTEEzc62hmGVxvehPbwRe8/kjt
	1ozkYDGKjFuCrcR3Fie13C6yPRoHKJcDlIxcLIGu93dBid2ShUv868HY/vpSECjG3287wPERZuD
	T78kWyqB9ObOY5cwYi22OtNoLgLZkTCsDUIuR90ALfSnJ+Ts+1DHs2gdE1UA=
X-Received: by 2002:a05:600c:4e43:b0:47e:d943:ec08 with SMTP id 5b1f17b1804b1-4801e33dc26mr124166325e9.28.1768815520298;
        Mon, 19 Jan 2026 01:38:40 -0800 (PST)
X-Received: by 2002:a05:600c:4e43:b0:47e:d943:ec08 with SMTP id 5b1f17b1804b1-4801e33dc26mr124166015e9.28.1768815519854;
        Mon, 19 Jan 2026 01:38:39 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf33sm22661810f8f.25.2026.01.19.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:38:39 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	linux-sgx@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL SGX
Date: Mon, 19 Jan 2026 10:38:35 +0100
Message-ID: <20260119093835.114554-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 693c819fedcd ("x86/entry/vdso: Refactor the vdso build") moves the
vdso sources into common, vdso32, and vdso64 subdirectories, but misses to
adjust the file entry in the INTEL SGX section of the MAINTAINERS file.

Adjust the file entry in accordance with the file movement of the commit
above.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14a06f856b81..68f5fec91f96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13105,7 +13105,7 @@ S:	Supported
 Q:	https://patchwork.kernel.org/project/intel-sgx/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sgx
 F:	Documentation/arch/x86/sgx.rst
-F:	arch/x86/entry/vdso/vsgx.S
+F:	arch/x86/entry/vdso/vdso64/vsgx.S
 F:	arch/x86/include/asm/sgx.h
 F:	arch/x86/include/uapi/asm/sgx.h
 F:	arch/x86/kernel/cpu/sgx/*
-- 
2.52.0

