Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76416154C05
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 20:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739739129; cv=none; b=SAYhZUthrVK29TyQZi/CuInjyFxwQThGzHtiae/ySvbPS3/kIliPc0CgeaBo3MT+TXe7bx9UPvQq2EN15XwVkYmzknikRtGRmRTrriBKE9X8dS4Ih0HJUaMvSS99sF7cDXY6tq1R4RM3+S/Yk6i/e19vd/ItX1gyglnZZSowOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739739129; c=relaxed/simple;
	bh=NtGbrjrmznu2NSRW7WDGTNFMx2/QQx6TquE+W2bapjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2zDOfTXOOs4OoKahASW+9dq6BqjZ6lml/5A1AhbJpzZkTjaDIzi+KZPz9LvWIaMYyo9in9+3jy1Jynysl2+/GZa4YGPLAjKJO7VfeLsEYYH0RYOqIx5GWas8UhXNgYU3kOYo/OJgR2geBLg+PWgWnffkS14GV+8VRMCAaxPSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nI7mxsWz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nI7mxsWz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso4519794a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 12:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739739125; x=1740343925; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwcNQNpK2HNYBvKAgWSMSPgBYr8v+ovYWYrUWEbnsrM=;
        b=nI7mxsWzPGhiccb5Cd/0VY8Datq0NhxNpLZ3//qyI+JIreWmibNQZQaBNbEkOB8sM7
         Jx6PBRZXAoRKL/rNHBZmnQBZMlXeruF66ANQu02F7LNSVzCzV4lz8MbTISordRSUYMgq
         6QhNiccQ5lwm9l1X2vZr2rnlw4w8gCa9GGkl02ok85PzubceBNQzwl1xoJHrZFkHJQJw
         +d5Bfx9T1/yctv0ohQnjXWbedCGJF/SJTexbdwoR0me5RsZk5SlgKmWw8GAFLns0l5uM
         iMijDDys465KmiUOhU4DaAth6wLnnGH20emi9sK/Xz+VhYDWbyUmclEJRNxPgRzXCAnI
         Uzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739739125; x=1740343925;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwcNQNpK2HNYBvKAgWSMSPgBYr8v+ovYWYrUWEbnsrM=;
        b=jMJMDa6MJgBi/3C2kOyktMFxzN2vBw85F74eRNHC7GoKcKxE41P/in0FRYgGCz+HQ3
         9xPlAFCSAJkUKHWFppBZq8pJSCYZU+QglPaV/GjMsdwwxZnxEprRGoLm+B5sBi+T8c9P
         pE/eK7fh6O4SCVjTM08Aqywdfxq7x5Lzfm2YoHQZnT8V0g7+l/E4ok/jPexyI9CtqMLR
         qG0WQaHdMAfKrWOCOuPDa9kdHEIcz+ZnZYGP953eGVui7TleMHH8TpVsIaVESYxwVLal
         gNiNNMrI09XmyrNOzZGd9nkAeCWDKbB1Xi/eVUysEprSaVnmMv6d3P6z3muLD9dUQluy
         f50A==
X-Forwarded-Encrypted: i=1; AJvYcCV5Q3NxnMxIcmpXmo++w9xpm+HQ8b48RMWanqFvTZptC0mf2It6wsJOfmAHgZZTcoGHeR7Oh7OAMTMXx1lvbTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrmrHK5QbcLrXhkg3bvrKSadHYDxRwNZIVD+NQYpBA9AK2SeZ
	AnqrXFomAu1tYbQfeNDn25foc7arT/5UMqCPb7Id3Pm8XLLLP7Ys07ZIFWz/fb8=
X-Gm-Gg: ASbGnctfPkfbW0BIXQ/jaSw5D8lPED+4jfdCAvXZAxfnYhp2fcBZhW+YaXW0AgFRa00
	dF/QXxpteiTAOsZOYcNfGQ26peg5SwKCcFXwHmQjkTyB+4pPVo4ulft6idY6q/JPudBV8YTQfeB
	chmLNttYpT2mEAmC2DuCwsgAP2mZ00oj9qVeOfKNhlqs3pa6IwA05jWhir5OBvuXMCFUKBkcZuf
	0qEiFnFP9xGUekSI5wUOlnBucfzzIboCv9OGEnQPrPH7CeQujhuNxMraAwITyzJPWLDtX8voBBw
	bndfz00IXNrKPIyXZhtb
X-Google-Smtp-Source: AGHT+IHgwYPj3iqat9vbldQSlkyDo1u1ykz7UQvzC8QUVDQndEh7Kshy5EEfZbLcYAkxQywWbeqVOA==
X-Received: by 2002:a17:907:1b0b:b0:ab7:ee47:9938 with SMTP id a640c23a62f3a-abb70dd9024mr765292366b.39.1739739124793;
        Sun, 16 Feb 2025 12:52:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb9b81aacdsm75610966b.104.2025.02.16.12.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 12:52:04 -0800 (PST)
Date: Sun, 16 Feb 2025 23:52:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix a couple integer overflows on 32bit systems
Message-ID: <3e34cf5a-e70c-4096-b516-661c2a836001@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems the "off + sizeof(struct NTFS_DE)" addition can
have an integer wrapping issue.  Fix it by using size_add().

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/index.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 7eb9fae22f8d..78d20e4baa2c 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -618,7 +618,7 @@ static bool index_hdr_check(const struct INDEX_HDR *hdr, u32 bytes)
 	u32 off = le32_to_cpu(hdr->de_off);
 
 	if (!IS_ALIGNED(off, 8) || tot > bytes || end > tot ||
-	    off + sizeof(struct NTFS_DE) > end) {
+	    size_add(off, sizeof(struct NTFS_DE)) > end) {
 		/* incorrect index buffer. */
 		return false;
 	}
@@ -736,7 +736,7 @@ static struct NTFS_DE *hdr_find_e(const struct ntfs_index *indx,
 	if (end > total)
 		return NULL;
 
-	if (off + sizeof(struct NTFS_DE) > end)
+	if (size_add(off, sizeof(struct NTFS_DE)) > end)
 		return NULL;
 
 	e = Add2Ptr(hdr, off);
-- 
2.47.2

