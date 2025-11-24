Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533A2727E2
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Nov 2025 06:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763964304; cv=none; b=fpFR0uXomE4uy4wwtVh3mORp5UQ1HccF3+I/BadR5LE6l59D0rrHTf4BswVNt93yV1mu9dzNVwFe7ho6XM+RzLVkZ5yI+kyDe7C2BEM83FYY+sU38xSXIbLJa98lmM78FGosU1KPK7ULffAT1t5VGT6pkdQF+7Jk4ca23f5OOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763964304; c=relaxed/simple;
	bh=uwW5/7qGULapL1sVMLPb1Xc+6mdWxww9p7V7V1LV88Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcF72KLY/0BlS4xjQOgj54r+Z+vBJ9HGuqOm0zCpRBfl9FjQW1xyGJp18OlZaMemfTzyOrp2wWa7mzLoGjwvhQVn9WBrhtb+QI/UUlXWkdHmb0dFaBYTl7lU0w6RSe7ubCoNq0mIU6L6L0ODYvIZ4l0h7osRmjNlnNdCWGT24H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qx9Oav8k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qx9Oav8k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so32921645e9.1
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Nov 2025 22:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763964301; x=1764569101; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uH1o7GeIwYc1DYoErssPphWFX52WlisMeq9xtONgZz8=;
        b=qx9Oav8kq/eUyg4PMAyVbAa9TYkOJfPG4CLU41YDrLYNTTZrseRzKIOrjCWVHsooYj
         xENKfb1e8hKuWxpQmiipL1jeehc9rqnWL9prnV2IHHbyyIuByKyEmQZ8rqqzqcHs32mj
         47/OBWOk5QONOwVeLgnnx6lSCme3Y5OhQOYlLjPC3/ROwUfloPLPSua9FhnNSAU0MIKL
         2dcdWC72e1eEsrFc4iMtuAjM53rxbp3f/G126AE8RO9nq96S8ZYgg4w+uYYvmARlD0Gi
         tCoF7sl2WZmKrkBSZZcx8/dVY3mzT0ih6L/1MnV+6DB9Qc+CFI7E1Q7g3NbaqBFvDVta
         LzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763964301; x=1764569101;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uH1o7GeIwYc1DYoErssPphWFX52WlisMeq9xtONgZz8=;
        b=b0XwL8Z7q4189G/BdBXfKmFBnlZpR7Dl0AlZQZM+5rCMrMx5rBnMe8UidmPEZyQwqg
         /6UCgGBJEjCa305HxGObwcq/4MBMdv5xvczrn77LQTd/fc9UNfeDw+sygx4Xc1toewcs
         3LoTvDuq0EdVc9/KsyKYRhm8+0lj0b/VwEEfkgwYbe6N7TuXnKO6jFVgWEF4maxt/c/6
         GEvHcCzaR7MCn+scPyQ1xNo1YlrA07gHTMfGZUWdr4HQu8EUpnUh4NSaPPdrmaAap3GE
         JdKvkPnPA/upfJaJJN3VfW9E2JuMMQM5vDeU1xFhNA9fxbMZBPg+x9l8vw/AOwakAr3n
         vH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZq9d4RcW9dhaxOhcIyfdsJGoQpWcDF+YLgr6jdjk6lT+GbbJSISwJ2PLE56piyaAE8/z5SX3v+Rp/dkfHCm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzfonoD3d2XInbings+2lN5b+6Lh6sjhogpJRpsS9d/bGsyuA1
	2rI5tWxdKzAvg1cCdy69SJaSspiG8WCrUVfhauTm2yVduHhUmnwQw/Xdlxr6T1nxJXo=
X-Gm-Gg: ASbGnctoeXoo0rcGMGccspwCTGQnUv3DeM8zKyiiq76Ypq1f71IWVaoKHlR4zkwzFBn
	DGe4N/sb5O0iO3Wy/EmIOLYc+6SZ+FMt9kDR8BDb4zxflCC3exfofNIpJoSCbX6ew4I5fMK3noh
	VFR118pr1s52OYKo13ZKv7UrV265qI4TmRiNuKA4wJoRkqos02Lx6dZs5tb2Q5K9u3jkngs0Wqd
	X4bDDqZZspisI9dl3SW2GIefGpXOlgLIfh5vWzDJ5G1h8Qwifjn5ffXC/2nzqLJ9pK3u7IDD6hc
	vcZEEtrYYYOA5mLRBGihiifGi3bki00wb7TkY/ZGbCblfiHhR2Cq3/cJEOtb1WgphyHGnwGy2VO
	0OmjLA13JRq9B9TcRQ05Lv8SQkSg945/wPxaYTyit/sHR7IFroauujdz55U31ajoggf63KKFlsi
	yhjbEJ28tDRJ9aAMLm3VRnWYs4Ayg=
X-Google-Smtp-Source: AGHT+IE/1JX/nps0nusBrJi7ArbL72409Zg8vYjuZAApbr5lk5tocgbNd/CCB5XgbxxXSuP2QUkiXg==
X-Received: by 2002:a05:600c:1c98:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-477c01bcf3cmr104847785e9.18.1763964300525;
        Sun, 23 Nov 2025 22:05:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7ec454csm25365196f8f.0.2025.11.23.22.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:05:00 -0800 (PST)
Date: Mon, 24 Nov 2025 09:04:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] fuse: Uninitialized variable in fuse_epoch_work()
Message-ID: <aSP1iMPil7wTnboD@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The fuse_ilookup() function only sets *fm on the success path so this
"if (fm) {" NULL check doesn't work.  The "fm" pointer is either
uninitialized or valid.  Check the "inode" pointer instead.

Also, while it's not necessary, it is cleaner to move the iput(inode)
under the NULL check as well.

Fixes: 64becd224ff9 ("fuse: new work queue to invalidate dentries from old epochs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Luis Henriques <luis@igalia.com>
---
v2: Move the iput(inode) and re-word the commit message

 fs/fuse/dir.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 761f4a14dc95..73a46b0be09d 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -199,9 +199,8 @@ void fuse_epoch_work(struct work_struct *work)
 	down_read(&fc->killsb);
 
 	inode = fuse_ilookup(fc, FUSE_ROOT_ID, &fm);
-	iput(inode);
-
-	if (fm) {
+	if (inode) {
+		iput(inode);
 		/* Remove all possible active references to cached inodes */
 		shrink_dcache_sb(fm->sb);
 	} else
-- 
2.51.0

