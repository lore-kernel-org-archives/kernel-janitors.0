Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66647A29;
	Sat,  4 Jan 2025 18:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736016651; cv=none; b=G8heSf2fAXLmDa1VRqgYV66lVijbW3wDhcuaiEvETHMwREhrAdJxsDJ3N6wqe/IVr60LFkXIIw0YLYVv85i68tviG//x3hfwIV7zcuI3XXxHRElkF/C3wg19KKucGrRkL0apcmeYHjTTviYnBRUqFmIynCAME0QddsBxCqM30/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736016651; c=relaxed/simple;
	bh=PDv4GfT9htaoo/dVnXnLNDVEfVRO2ud3WWEE+TXfR4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KIxfLdlustuiAFFqQNqwhCxaJmQNblAATJdjwugoanGc1QVuFP1Tx+8s5sy4Tc9t6w0zMYmYAHlC9gH2g5uJmtGN0wh5iufvPrp1To354jo0qcNnnZJOsVTNqCANNeP9M0EsHEDgxF7JO5S0nqJXEpztQt/xK+hrSdyZtK2H1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiQzHdMZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiQzHdMZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216728b1836so166820965ad.0;
        Sat, 04 Jan 2025 10:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736016650; x=1736621450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTG79nL8NQo8aVgerNCdWBkI5u/Jw2Lke8vYbSuDz18=;
        b=KiQzHdMZe0kjtsz3jKLXMVg2ShHLLnQ/mpDySy+TYb2RX5yB6mcpwHv1bn9scXIULa
         egeGlZKJ2RS6WCCJcAk1Hg8HAkKM+/iFnKQBOYdxbmmNE/+E/MOnCFtEmPlbRMlmbrhO
         t+yN1uGmXfZEEd6eoLks1Tu9RPyYxLLS8iLAHOmT58LKWgz2ArNrJkQOybqMduo5HYiX
         kdqHU/Lz2hkEcBlKnAUnGRB6Db9k0UIWx+D6ixLeNzyAizjScVhLjjzhQrLcF0T4b9yO
         n3VVXYuEX59TSi4DzphWGR29SW8uL7TUE8KO+TpxYQTEBh8T3LoB9Eu3JfwVIlRvbrti
         /i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736016650; x=1736621450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTG79nL8NQo8aVgerNCdWBkI5u/Jw2Lke8vYbSuDz18=;
        b=wdHx7oP3KxK7YUMAEPzXxZ95zDrKCx/lUzMBW5DK4RpYVG3LS5zNwNoP7tV9KjYq3R
         +cyQAFiANLOefXNKLDqarP1Ef50fe9RZwYHtHPd1xZsu0UWe9imkNYRryXa25VqhG4P/
         S0VPIVzE3RxbRWGlnDlxCg5K/c9ouV6FTKPMDx+EJmASCDtXJcGd1vSdKhGWD2JQsluV
         YrO/0cIpLQNAZWNPeGjgwgZE/otJRIPtBSVjs5fodM3+/PoM1Mb0trC6tBqV0rE/pC+X
         v2/bA5RSVOfGfkagEOBrb8zIiCff1wCqiLIqO6oblFABUiJY7a4WawPtG4bDiwvJHJEJ
         i4MA==
X-Forwarded-Encrypted: i=1; AJvYcCX6GcUvSBvSSj+IhwwXLwGlODmhNL2TlvVCNGgTRuFgzlGhIrUM5EbzA7FybxdpTgVzxV+WCWk5X/ZFOZnNnY8=@vger.kernel.org, AJvYcCXE36XTN/zqAYuirzuQxIUhO0kR3++m5ZFvjASIw670V3GS4T5sXiXaAZNuoSrLLZoK4VBtSK3BfhTZEimF@vger.kernel.org
X-Gm-Message-State: AOJu0Yycc/TVzXyguGl6HAo36NSl6UCO6lDBL+3jnP+HD41mWi9DX0mZ
	5P9C8S82ANvWQrfK4SfsuKaGleYS1zgrtYQ8B3uMWMFi/dyCBegoyozG9/Lj7wI=
X-Gm-Gg: ASbGncu7UX/UYN2Xaplyl+eobgjvmLqDlHlQF/23AZ+KNmE/Optk6dbSz1tpORcR4t5
	1QGV/CSL1wRlX6iGJIWX5avMcFeK42+/odZWbBHnqLwn/BKav++MTwqyf6gEOV2FIvlpQIcp2QS
	+JR+bOqg8Iulmuh9BU7tilc/CNd3bFPvDJcT7Kc+ecqzigpJEyEZ9H0d86IW2D4nj0c4LHlkk4J
	fCMXNwa+2U2B55F7whmgywrtgHWJ2jOU50LJo4eSmY+4gVhROjdgZU=
X-Google-Smtp-Source: AGHT+IHyBVYbaqWPLNslt2s+abO/oBjMXqv5lGUywYnkzBgcnY0XjN3q+zezrFj+gkT0vV7sitm0Cg==
X-Received: by 2002:a05:6a00:124a:b0:725:f153:22d5 with SMTP id d2e1a72fcca58-72abde8285dmr74962392b3a.18.1736016649452;
        Sat, 04 Jan 2025 10:50:49 -0800 (PST)
Received: from localhost.localdomain ([223.230.110.17])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad8fb957sm29180049b3a.140.2025.01.04.10.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 10:50:48 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: haren@us.ibm.com
Cc: ddstreet@ieee.org,
	herbert@gondor.apana.org.au,
	Markus.Elfring@web.de,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	tanyaagarwal25699@gmail.com
Subject: [PATCH V3] lib: 842: Improve error handling in sw842_compress()
Date: Sun,  5 Jan 2025 00:19:54 +0530
Message-Id: <20250104184951.3481-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

The static code analysis tool "Coverity Scan" pointed the following
implementation details out for further development considerations:
CID 1309755: Unused value
In sw842_compress: A value assigned to a variable is never used. (CWE-563)
returned_value: Assigning value from add_repeat_template(p, repeat_count)
to ret here, but that stored value is overwritten before it can be used.

Conclusion:
Add error handling for the return value from an add_repeat_template()
call.

Fixes: 2da572c959dd ("lib: add software 842 compression/decompression")
Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
V3: update title and reorganize commit description
V2: add Fixes tag and reword commit description

Coverity Link:
https://scan5.scan.coverity.com/#/project-view/63683/10063?selectedIssue=1309755

 lib/842/842_compress.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/842/842_compress.c b/lib/842/842_compress.c
index c02baa4168e1..055356508d97 100644
--- a/lib/842/842_compress.c
+++ b/lib/842/842_compress.c
@@ -532,6 +532,8 @@ int sw842_compress(const u8 *in, unsigned int ilen,
 		}
 		if (repeat_count) {
 			ret = add_repeat_template(p, repeat_count);
+			if (ret)
+				return ret;
 			repeat_count = 0;
 			if (next == last) /* reached max repeat bits */
 				goto repeat;
-- 
2.39.5

