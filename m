Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699FC1DFE8
	for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386501; cv=none; b=uUQV3su4W2XjxNdAShz5+LLc5XLQiVuZC7GmtfCFKerNgCmihGD+GZsD4LStKcD3RFW/gwIJ8HUqc/O341mLR0l/gqIdl5591j22W3oQ8Cs9hSsgMcuHHbNnrrGDAjWwb41b/CgzcpWPIpVL5Ei5VowqopqTk8DGBegrxzFdTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386501; c=relaxed/simple;
	bh=smaGGleEejxjqfAldEWMMPvLoqda4k+KzyETRx4MUAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdBc31igVNCg/r1swVp6RKyfmR9VV72sVgLbZZt2ZL4OOa30Y9CGqvUmQ6W4VIv4OH9S6UTq4V31M689oyoqS5LVn71rVZ+ubXUbB6iMseMwrgbNYP8M0aD9EUMkW1ZamrWejpakcRJttuUprygWePBS91/HeVSX0ls9Pg6zQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZZgXL2P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZZgXL2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747386498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AYzkMJfY9KpEMNakQSNDEXTnh5wG0ilXzHjXBYUiPEQ=;
	b=PZZgXL2Pe+lSfqfTHISK0rvx898aJiU0hMhxss4PHVI+JHZQZC11Uv2m7wronosTr1BCrD
	1nvPGpRMHz5rPGPTngXciKrIncOVMFRm8jT4HSA0z/zbZIwWUy/0CTWUycyS3Ckf3I4mlV
	XfLAF8+9VblS1AqchUb/uOZDuWckpZs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-anTbUOMcNfy0SRlriodk9w-1; Fri, 16 May 2025 05:08:16 -0400
X-MC-Unique: anTbUOMcNfy0SRlriodk9w-1
X-Mimecast-MFC-AGG-ID: anTbUOMcNfy0SRlriodk9w_1747386496
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a1c86b62a8so1263942f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 16 May 2025 02:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386495; x=1747991295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYzkMJfY9KpEMNakQSNDEXTnh5wG0ilXzHjXBYUiPEQ=;
        b=Pl/tlkhslrUyrHl/aBFYwwEJsrDOio+yU2bAIHonqfxY1UuhHqRWJc55kT7gGFw86J
         vqATMQTXu+748ybZCGDww5U9UvhkkI/vb7R7TEvpMaHeJ6bg6I0nruI2AiTUCWgIm+Al
         31mxk6asLpsQRJlj5Yk64FHBmnTqNkTqJ4LWyIINGHFn4sI0MOVoR/5mfCCcu2YT4cSs
         HsaTrC0y8a0TTAnbxnaYbxQG61NLob8zXTEJNG70LMwYDXNLuC9LXwN6IH5jpebPwI2j
         I/HbBNWDrOYt7Brr/nhL8IB3T+cfb6cg/1eW/UOLtSWjHrQm65bvwYTDBXtaRq8Vx4K0
         AKFQ==
X-Gm-Message-State: AOJu0YwGcE9/qldhnhV5zJ3bKagIIcw6PGX+J46/J948a9yA0/9l3qzv
	QQRjFTzaDV+SzL04WDmV/Zbiw6teyxyRWQNVmi+lJX+bDfZfvbZekXIHkpC3UJFJfLEerdnLqNT
	+1AL+8xPQg05830SiES5ioqg3ezZFRay0gocsx82RN6zciIVLuUfqhNGY8TfWme6G8rC2PA==
X-Gm-Gg: ASbGnctibhRJBTXDAQiFp3F+Pieu/9p/0Jq/QNC7PSw5bvAT7CWQKHkJNhesIfmkpyC
	HyHN3/3dMLZ+q+VD2GHd2ONSP08X8jPz2s+8sI7c1AokHjOwoPmo4UkYLAGSvMEHIkxl07PwW+T
	femIhJf5FN33c4pa9ed9F7NnlUG/3SFhh8TEwpFBf0LBq6N0UllYcXwPkoHiW45Ck+sIHK6CjUS
	xW6cGz7PqQvRJc2l/yWM9bfkdL9JbnuyMdEoUNmMxlQLDpWtKTqbP+KeIudJQAvtoH0cz0niSKZ
	xkTmfi/Atnozb7btONKXZW+xkKSaqkpl0oOcsEc3cXUdtvWedsQ8tP2igA==
X-Received: by 2002:a05:6000:381:b0:3a2:416:5bee with SMTP id ffacd0b85a97d-3a35c84eb50mr2432479f8f.58.1747386495659;
        Fri, 16 May 2025 02:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEb12haYUakG/IdY2quJ/QV1V8uY/qi3mojQAr4ZbQvCmery+tNhbOyH5M+cPqRCFYDl6TMw==
X-Received: by 2002:a05:6000:381:b0:3a2:416:5bee with SMTP id ffacd0b85a97d-3a35c84eb50mr2432453f8f.58.1747386495280;
        Fri, 16 May 2025 02:08:15 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583ff7sm25907005e9.26.2025.05.16.02.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:08:14 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/mm: Remove duplicated word in warning message
Date: Fri, 16 May 2025 11:08:10 +0200
Message-ID: <20250516090810.556623-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit bbeb69ce3013 ("x86/mm: Remove CONFIG_HIGHMEM64G support") introduces
a new warning message MSG_HIGHMEM_TRIMMED, which accidentally introduces a
duplicated 'for for' in the warning message.

Remove this duplicated word.

This was noticed while reviewing for references to obsolete kernel build
config options.

Fixes: bbeb69ce3013 ("x86/mm: Remove CONFIG_HIGHMEM64G support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/mm/init_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index bf5f68b49405..607d6a2e66e2 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -566,7 +566,7 @@ static void __init lowmem_pfn_init(void)
 	"only %luMB highmem pages available, ignoring highmem size of %luMB!\n"
 
 #define MSG_HIGHMEM_TRIMMED \
-	"Warning: only 4GB will be used. Support for for CONFIG_HIGHMEM64G was removed!\n"
+	"Warning: only 4GB will be used. Support for CONFIG_HIGHMEM64G was removed!\n"
 /*
  * We have more RAM than fits into lowmem - we try to put it into
  * highmem, also taking the highmem=x boot parameter into account:
-- 
2.49.0

