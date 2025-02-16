Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37DE1A238D
	for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 20:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739739139; cv=none; b=qBis8gz+XaqFdPbBNXbaJws51y7BMW57IGfSPHfwFGeHjbtyGNPxEgdfLgJD0iTtRYRYNnND2cPLz/G7Ep9E5LRySWqUmfZxz7RTVr7sYMqTMcsWF8j1h4L6EQhpuL+E3xUpV2cQc21xuxd+OMPJMkLE7CWb9HS9IwndrjW6lmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739739139; c=relaxed/simple;
	bh=aXs0vWAmuS0U8j3KJYwst5oPNJcMtkOfy6vx1+vPaD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxAFcRQqC8DFxTodviBLTHTQs7OgTam/KQs6DK8Cj7vlh/D5xcOX39UFvbQZ6LQHH2K2exPv2A22X6NRjwhV4/js+gaz1eGYZBOEJx7CV092o4QFpiXfesgLYmKgwAQpbGH4tc5tbOi6Bwq7oujHDPeT+NUCJihkLOKB0torKLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qTo1zww6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qTo1zww6"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so5427466a12.1
        for <kernel-janitors@vger.kernel.org>; Sun, 16 Feb 2025 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739739136; x=1740343936; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkyPg/crIfWv0Cn6JEGTdKe/XqmIlkAQmtesjInAumU=;
        b=qTo1zww6FSZbLTcAJMRuG3KZoIcSmR5WH6W9vordHWTFHoWehPOLkQ6/jxP+0GW0hH
         HPaAPtW1dQNIkEZ2gy2FB0Ued6oj+lV61JRAhp1lDxL3xgRpybLt9h54PwoJsukbZG6a
         RR2lYJcMG7kBsaUQmVKKWuqaeGWwAbKnenX750NMB2jVfOCvOaRcWnFszYzQ/vI9tsRG
         XlQPrLASnGRD9ATkG0H8zgOil/E9BovNA/w5MdDlwD6TtryJwE15m4nFy2rEyh23bXLa
         7wolUuyaFLlFiwn7R2z5u6AWR8+M1MeQk7Ll1L8rzzrOhxAunt39iK9i8XJnafcoGFfm
         VJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739739136; x=1740343936;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkyPg/crIfWv0Cn6JEGTdKe/XqmIlkAQmtesjInAumU=;
        b=cYVQ4yPrTsHUZ0YD74cK2I2t6q0ApP36Wy2pYas2fSXxgFh3KjEs99Qea8r2LEvUwC
         fzS29YEyKtu/+p9tB7r5e367tXHOpB54HKXfjBDGW1bfO8uPhWM/uhQPuOtpQSC+Irg0
         VGcX979ljP03UO5ZH6oY8qAd2PmjWjok3Vhwfc5995RCWJQoY/AhBXqR08xNJxHFvBVn
         leBhb5M9OjknrR4eLtyTLM76Gv/VhQ4CQbg7TB9V0/Qr7ICmS91+ijDVhYxzWMW2yFEL
         RK96M2eEuiZ1J/7CfRCaVb4638j/Ago9scxh8GOJE2JL3buLb4mmebsrhglbU6AITBRT
         hwUw==
X-Forwarded-Encrypted: i=1; AJvYcCVCplVyQcjZDfl3BEcA6cflnWgmgtGnJgTtkOkrD56n66KC5kMrmRhkayIpgPpgghUU4uXSz8QmAdG67mn0+Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuSrIdJO86+qNG304ybV+XI0MuCt2n9Xw4HUEaMi3Oe0EIdLb0
	9g2BNk9ZpFdyFatyw/21wZTV+qaDZU+J44jQZpxKtx0nTiVxk+CJtHCS/c1jZfw=
X-Gm-Gg: ASbGncvUh3EfQ8BqmzYwjFYXcyzYYdxeeakwaUGiSLpbGkwzTJcqLr7M5EaGfr761Cf
	X0gBVlE+8DkoB5p2uowhOhzotS3ExaaJh1BLJITj4DJqOfWu3jRRs/3MuMT55Mda0UOC0HYuB0x
	ZtFdFnhW8eLXmzl1pRC/WYzVQQe42yuXSrcAYY7VnlSCeNshlwMYCt0DROtYZXdPegVa8c1LpO4
	LuCN4a0Fm/Pv4Bf9uynJ+nDS3JOQodci0FP4t4p0KwPb0PCCmlSi3hqdYO17mA/qc/w98MDrsJQ
	06uujjeoIX5ubljFnlU9
X-Google-Smtp-Source: AGHT+IEMU++D2lnTLgi14JzxAcN1KpQU2iWjj9Zk4bircM7Q9WHx1vcmQHv39BJ+Q3JC4O7xeGXx3w==
X-Received: by 2002:a05:6402:42d2:b0:5e0:2996:72ff with SMTP id 4fb4d7f45d1cf-5e0360bdf15mr7424447a12.19.1739739136154;
        Sun, 16 Feb 2025 12:52:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1b4e99sm6273670a12.16.2025.02.16.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 12:52:15 -0800 (PST)
Date: Sun, 16 Feb 2025 23:52:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Prevent integer overflow in hdr_first_de()
Message-ID: <b78ff7ff-f260-4499-beaa-169f725abff9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "de_off" and "used" variables come from the disk so they both need to
check.  The problem is that on 32bit systems if they're both greater than
UINT_MAX - 16 then the check does work as intended because of an integer
overflow.

Fixes: 60ce8dfde035 ("fs/ntfs3: Fix wrong if in hdr_first_de")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ntfs3/ntfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/ntfs.h b/fs/ntfs3/ntfs.h
index 241f2ffdd920..44c99d35a59c 100644
--- a/fs/ntfs3/ntfs.h
+++ b/fs/ntfs3/ntfs.h
@@ -717,7 +717,7 @@ static inline struct NTFS_DE *hdr_first_de(const struct INDEX_HDR *hdr)
 	struct NTFS_DE *e;
 	u16 esize;
 
-	if (de_off >= used || de_off + sizeof(struct NTFS_DE) > used )
+	if (de_off >= used || size_add(de_off, sizeof(struct NTFS_DE)) > used)
 		return NULL;
 
 	e = Add2Ptr(hdr, de_off);
-- 
2.47.2

