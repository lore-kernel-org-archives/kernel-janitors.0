Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4F211473
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373722; cv=none; b=QXisLqB4bo8+JEvuAOS3ubYDE1vuadDa13eHSKkEneXYsy/GbUtxCP6JA3CG5H6Uke9HhC9JFqr2Pr7OU3drt4ZmiWknVTH9pYsc2ZItOZ732q0zJqn2kyInzyTUNbw/WFRaubk/kmZKWtWTVmHUEZKYDZ6U3eHa+HogX3+YIso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373722; c=relaxed/simple;
	bh=+vis7gN36TN4bXpmmqFmcfJP/4FjM9SrG05t3JKRUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgOoXvbLFe8okm5AffJcWATltvTHprZ2bx42qOwIftKKGxBqEd7W1hZGGWsdLcEBBl1uiDIMoX1Cey/25wnUQKR5WGfiWnNd4GN1Bzo47V8QO8UI4CGAvhGh10Iz/Rvwid7o8qa2tTgGNbOTHYWs7JyPLT7ebqGDdYGOqjU6AyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPEfQ04X; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPEfQ04X"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so9001669a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739373718; x=1739978518; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwGlsFsWUPCNdb5OIVhsjIxoKbJw6k+Z7M2gkvn8C+8=;
        b=vPEfQ04XOzZt+HWY7f+A0E0Ek1Bhumv5FOOlwVq8EZMwqq/O3SdOdDeBNhfxmykB+n
         I2t2fM3TNdyQg7+rHNSfVjzXvJvUeKVyya03xAn4l0KAg0VzwMZbYg+9UOmXa6Zh0Ehw
         M+x5TDdsIg+5hnCK1RNuvWWeaowAdbbf7GHzgYy5EyJlsyBiCARM19J8CT45x3cVAcRb
         Dza16wfoDKTjUjWGAsN88p0rrRMpy796tO1fb3GuvSe9Bfo+LBMomvDK4NWD2R//vey8
         cY1RO2osvhL7e6iMokBGrGKkoRtvipU4KAl2gEMKJXjIv1eN1coJpHtOg2xNQRLeah87
         JQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373718; x=1739978518;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwGlsFsWUPCNdb5OIVhsjIxoKbJw6k+Z7M2gkvn8C+8=;
        b=Y7Alv58Ax++Zk/fUcAfWSnJLVfgOVo9pVo/YYC1r8fPbQOXQGW1P1mbAyjc0Fv0i+o
         1g1OjfXmQ5oNJuj4kkjkmIAEMi+pLP3sR6ymXvSAFUi8VLd/DxsIGi2SOvM6yHHxPpHf
         cUOmmNzLBAh9or04O6UFOCyl2CI61lLbww1ASJiWXJ7lBI74Ua1Gc0dhmY19fl+3I3Pu
         sM+duw2YJjL/Xjrg4zwQLPoJH4cX0+X8F1ISXdkYiZX4lLEmEkP77Gsoeg+WpETbFIi0
         tczgoalOgMGQQQw+ixPv10sWP8VlVi11+XSzlcKwKaQZNFzILk7cTIYRcn2qvgAM4I/w
         lqhw==
X-Forwarded-Encrypted: i=1; AJvYcCVDoXC1Nu06PLt3nRquf6Vkbx5DG622sc0MdEyBcIK9E6oHgPK9mesI9iTus/uJyExbK6/IMWDtDA7eFw59qk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxoCZBW8dOnCg9XXxqncBQ7eV0RkCWD9Vdwefsa5Qi2y4WBMCG
	DoVf4Pn6ftVuyu55kWpj1ZEe3MhPjA8y4r829qVfI7kRocw4B34y4alw7UtPReY=
X-Gm-Gg: ASbGncu+oLRiFbvBnvC2F2XrpzSGr12eXgUuQV7Q92dYCNrBb6dMiIma/5d7p0ufOMY
	nUFkBTcrbbTBKQn1KFAX2s/EJVz1xH8B2tWeg1p5Ht3qXZSlIxj04jXz6ixIIAWlqa+Fn6Hx26X
	5Z+BShQxdCSU9xwMCh7Ra+jWHAUliigbPb1eXCKrxKW/jYVkEP+oPZ3sOLG4cnL1xnlfxQaPTV6
	LqftiwlR9uluPgUc6xwg+mJXoTVxLlTbj+yQiDkSmK5rK0svVzyDlPOeBcvMiHhKVqLongZ7TVZ
	F9KRp0nIfoncYYyhsbk7
X-Google-Smtp-Source: AGHT+IGrvoP4bSDwTvQHGL/gEOxz7a6wXG7ax2H/r1PattdgMpthlmvIy2+tyJ3Lf5q4y3T8TLELBw==
X-Received: by 2002:a17:907:3f0e:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-ab7f347db7cmr349736966b.44.1739373717663;
        Wed, 12 Feb 2025 07:21:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7dd77c151sm374431966b.57.2025.02.12.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:21:57 -0800 (PST)
Date: Wed, 12 Feb 2025 18:21:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank van der Linden <fvdl@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] x86/mm: Fix uninitialized variable in
 register_page_bootmem_memmap()
Message-ID: <1aa70a33-2acd-49fb-8049-a20dae40ecba@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that "next" could be uninitialized.  The "next"
assignment was accidentally left out when we moved these lines to earlier
in the function.

Fixes: bdadaec1526d ("x86/mm: make register_page_bootmem_memmap handle PTE mappings")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This goes through the -mm tree.

 arch/x86/mm/init_64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index e7572af639a4..6e8e4ef5312a 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1600,8 +1600,10 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 		get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
 
 		pmd = pmd_offset(pud, addr);
-		if (pmd_none(*pmd))
+		if (pmd_none(*pmd)) {
+			next = (addr + PAGE_SIZE) & PAGE_MASK;
 			continue;
+		}
 
 		if (!boot_cpu_has(X86_FEATURE_PSE) || !pmd_leaf(*pmd)) {
 			next = (addr + PAGE_SIZE) & PAGE_MASK;
-- 
2.47.2

