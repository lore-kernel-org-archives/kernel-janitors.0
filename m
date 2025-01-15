Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607A22DC30
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924039; cv=none; b=M0Avn09X6in+Hw5F7/Y6T8xYqJ4UFtXPPrUCIorrSbpQsSTvwKATIHOVcAwJrHSfFSol6HYg1UD5ZKQUjQ052BxlZwNsdqNp1bh7/Z6DVCXF0aHzZeZiVxj+UzDyNqCmA8fs2nA7XpNsjmrGyhEsOb9wR065hbRUxc8Cxvl6MGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924039; c=relaxed/simple;
	bh=KFp3jdXWgMaBUXdQHCLFP0wUMgB2SIATpb93CgoUtDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N/xUg+7ny7CP1mDFLPzm+CM25QyQjsRJ7HjE8EN7qWdAf4QjYSXWPGM/ZnJ+3ItXjsxDme20B/GKcE6hklMdP6e5iKXzgIFMRlATuI6jAAOB+I1NEGGKvTr/1MLwsjlKiUOgs/r43/C1xTnNZ2z8LI6w1NLXp3xOSvSYx3uhQuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZxGvw48; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZxGvw48"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so10651878a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 22:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924036; x=1737528836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKPKC6VCuB1agu4M92Pt0Cj7EiQedFYv4oj19q1B6lE=;
        b=mZxGvw48X2M5Z3PBIxQtbFz741kjqRkxPiGypncHr/Q6S87yciiMbYw/YUis1rBrAq
         +h0WhcAlmwFyTxBtuv+WfdFk2W/+sdE2JcF649DWYq+3XDcDoh3959Etw68bgbTEX6fN
         hDCssWTqJrpFovWkzrqM585lhFb35zbfNene6cOwHcdJ/xTL3rqTYAgI8sC7U1I7xl68
         4blHojoLRQ8DfhYBGXLMIZc/poe0CUdYXT6XCehOmFXB+Q0I88X4a05fEhAL+2f/kiwA
         64sB3lOtWQKQ4Rf3NThNTZRzOn4gEBJOaomR/R7ouHJPspjhcobUJQm7ttm+KVAsdeb8
         LcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924036; x=1737528836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKPKC6VCuB1agu4M92Pt0Cj7EiQedFYv4oj19q1B6lE=;
        b=dDEyHgLfngNF6TXPfDUujxkgBjbbm457BTGlaltWA+YIaXXl6BBzG7FwJryjKjGX1f
         lCmo65j8FKIcUUpMyj53YVHgmxADNSURNXVnXjSOR3noFv/Wg4+mcGcsyUofgXVTUEHy
         yafRI6M8EeNG6KsRvYE2c3A9JRwoKei+Mr7/pRIBKSBPuH5MdOBMhNAYsD8fI54Cxhij
         A0LM4O1esd7GxJo7Y8ebLkf6mPMkIUIHrCZ4GXGUgXOwfMooJ3qP6OZu2bH30gGyAQRb
         n8AdbDk+fHVaQfYlwWA6JMQBKZouptSF81QcaakPMsBeYB+5pb9j/zsGc+mK4ZS4qcB5
         9vHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4E2zwWx2Dmpx3gvZZ+q8H1CiDSPVdjIZN0+/8/YFPR0BSpnghls5VyQ25op7G6Xa+UQPCMbFts3Se3VjNY9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6jvYvRyUH7WpykyQ2Jhvj5dv1Ro4ZLR8ZkuAYgn/bjJuThnS
	v9tVlBxhM6T6g4ujHzTWfdmwtc9/9+2P4R3YHOSbWz/op9JRm4hoj6cTP7W2fHM=
X-Gm-Gg: ASbGncsfKPDnKaxLCp+mEVlAUo3dXD8UDWvDCx0PSehGhcjhlisDF8NVX7N8m/9i+yv
	F761HauaBW9F5AlHFRLp9zmBzzZxepzzAh7IX3HH3bAVOO36zy/S5/d+EpJaYUYw5TA6BZj9KuS
	QxxfPUKIrFaeH7RQwqZa6JtvSQ7fekQPHIf06lqn1eVsmEfkm4V9o/CCzvcjdXQKA0LBSiqfFpj
	oOUsiLZBIrHZaKY47ffx+6pjqo6v3uZmTuAE8mY/syqlXY5DsbbVKD+4WuuVw==
X-Google-Smtp-Source: AGHT+IGY+XCJvxMBIZ+HThERjNXncTtFcruCLfZ72BdFMv3vmRIgxjd7ygYKOJiD0ORhulrxl1l94w==
X-Received: by 2002:a05:6402:27cb:b0:5d9:f362:1686 with SMTP id 4fb4d7f45d1cf-5d9f3621959mr5507086a12.21.1736924036001;
        Tue, 14 Jan 2025 22:53:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c440bsm6865481a12.26.2025.01.14.22.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:53:55 -0800 (PST)
Date: Wed, 15 Jan 2025 09:53:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Kuai <yukuai3@huawei.com>
Cc: Song Liu <song@kernel.org>, Coly Li <colyli@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] md/md-linear: Fix a NULL vs IS_ERR() bug in linear_add()
Message-ID: <add654be-759f-4b2d-93ba-a3726dae380c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The linear_conf() returns error pointers, it doesn't return NULL.  Update
the error checking to match.

Fixes: 127186cfb184 ("md: reintroduce md-linear")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/md/md-linear.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 53bc3fda9edb..a382929ce7ba 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -204,8 +204,8 @@ static int linear_add(struct mddev *mddev, struct md_rdev *rdev)
 	rdev->saved_raid_disk = -1;
 
 	newconf = linear_conf(mddev, mddev->raid_disks + 1);
-	if (!newconf)
-		return -ENOMEM;
+	if (IS_ERR(newconf))
+		return PTR_ERR(newconf);
 
 	/* newconf->raid_disks already keeps a copy of * the increased
 	 * value of mddev->raid_disks, WARN_ONCE() is just used to make
-- 
2.45.2

