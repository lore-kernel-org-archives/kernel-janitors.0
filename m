Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90C2D5A13
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314413; cv=none; b=CUEeHCCLLaNSvRHb2jxX+qaSCmziU6Or9mEEDp0tG5Jd/W069kJ/tboQE7Gkiz+mqVv/pISUgj1qfEu1lcsn+rLS5k0IpQ+ELBPba3l/hFSirNmP1nsbTyevKxX2eXMJarjsQDBAGzOBrFOie/KWe+dBIYZyrLFcgADtZn3AgdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314413; c=relaxed/simple;
	bh=GSqGL+2jwOxTnifIayZVPqqUAUSQExhlX0Bt1L0LdMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uawtq7yMwiCj8dx5kg4nXuelP18c9G+PCNXkNbFIBWkkxiOXl47L/cgs4F+9h7PLl+BWwI7KFVbRhGalTHOpAwdi3Nn2yLI/1V+T0W4SGrHax6ovQE7BPeegAgNWaFjzf5AQqq/I+b7yPsAPI64SWgch48oFC2UaCotA5ClWMTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpACocc3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpACocc3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b47f662a0so1324368f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314409; x=1764919209; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLx66B48vruwXq/LvVUt0v7+uKP7BZ7gFpdnpilBlW0=;
        b=dpACocc3maUeW6wNjTFjGesbfreOW2DkL51ii0/hgRj6fcrtmaozInQF1Ft4ehqDPU
         U9eTs4If6xEB+aLRFanAsQSUTwf1v6CoTTGhpUlMX+YBSqGJkbL136KnowOmKwkKpalE
         wy5oc+KsnN8dr/2EJIhRkB/Yeo6EZAmBGghRZKAcbdGxb7BE/rFnXlhN8wxFMpGrbIwr
         sT59eOdiyBw5K1kK++zlLfw+/gwdrzz0fAX+9M8iUhRgl3ODOP+79S7g0o63IIHZJEa0
         W11icxWm75nJxoCRo6SCyq7DUWoOp1T0Wy5aSc9F/InYD6/4wj8F+b0KCjew6jUKn2xA
         x2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314409; x=1764919209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLx66B48vruwXq/LvVUt0v7+uKP7BZ7gFpdnpilBlW0=;
        b=Mv6bsPzIw8zaxGWWJ4eJIWNoD4ossN7R9BvX27KVpYguKWwhys0vzBJjMDMlXHKZYI
         EKgrqsC2e+EVDjKwU0XkqzaMqNDSwFUG5BqeaA7U+XwkTJWgbEXCYbzP2U0ZgqCizru1
         8SN5935JBkAgn60ljbwrsxh505659z0dKx5dUhLvcQ/bOATzTc+o/y2XH6KSbwRohQGy
         vI7GJv6ChleTb6uqbCfBnOblzvw7pNP6qM1DJZvdMS4DIZp60ilCdiPAdF3UqCa+HzRb
         nmdZr4tT8tuWkJyqRNZTjsdZclcv5P0jCyZH9FaxELUCuTy2qKR11JzcWzAxddHWgd86
         IECQ==
X-Forwarded-Encrypted: i=1; AJvYcCW24GGPQ4WRJtG0EkXIkgpNTpANUl3VcJUf/8qp2rfphFYd74DxdjPppGW4YVkN/dGhZY9iYzZqSlxUBWskKOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HC4ysA6A7FXX3SczP+yrAX1wrdGiWXZuWFPtOKFjlDt2TYcP
	G69noVGO4ECqZnMave6kNUvfhgWGlL2bDGQlDhDxh4KZ5c3EEm+faCsRC6zwFrVkqAo=
X-Gm-Gg: ASbGncupytu/Oam6XGs3CvSwBEXNuqru/jCgR3qj25hkLQM6nj5c9Z6vVODexE9y9M+
	haP8dtsSEt5VDBzSHkcoDkHQd08kNqwNOkZtTi3pJjnruwmAffW9BfZQC3Q4FhumHoRzylWWn3x
	KsPPvqxzuh9zXcZ/AF4rcSHhAEYDe4zRTZSzFuwXWLZl3QK5eZsvLqo1FGPZYoucMAEzk5uCryW
	tVIlSC6g62q02Pbj6ADakjGr0GhHDS7rINhgmXFQMFFj9ZPAjPp43aUg9zT5gunUqDQR7gQXD62
	u34XmAtkKS0MhThJMUDznaFCWe5YhbaPlvmhVxknJBjftfT380EN2UkHSR5VESBHyYbsPpfj1XE
	wDWYbex46anIqS1+B9A5mi7UHVGjvD3LIRFlHyzoovieazD2ThmXcggZWI/Rw4jl17qFN/pmgio
	kTtJ5+dHA7gy7qZygN
X-Google-Smtp-Source: AGHT+IESk0sJzgjz3Kc7l7TOO0CeDy5XVUSh/HagNXMNXKBENOnL+tQgU1CJrI65eDMKQmftuWUGIw==
X-Received: by 2002:a05:6000:2689:b0:42b:2eb3:c92a with SMTP id ffacd0b85a97d-42cc13021fbmr32625656f8f.12.1764314408929;
        Thu, 27 Nov 2025 23:20:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca9aea3sm7775019f8f.35.2025.11.27.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:20:06 -0800 (PST)
Date: Fri, 28 Nov 2025 10:20:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nfs/localio: add a tab in nfs_local_call_write()
Message-ID: <aSlNIsLAEsV923i9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There was an issue with the merge and this line wasn't indented far
enough.  Add a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/nfs/localio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/localio.c b/fs/nfs/localio.c
index af3a09eace77..47ec3437fbd3 100644
--- a/fs/nfs/localio.c
+++ b/fs/nfs/localio.c
@@ -830,7 +830,7 @@ static void nfs_local_call_write(struct work_struct *work)
 	current->flags |= PF_LOCAL_THROTTLE | PF_MEMALLOC_NOIO;
 
 	scoped_with_creds(filp->f_cred) {
-	file_start_write(filp);
+		file_start_write(filp);
 		n_iters = atomic_read(&iocb->n_iters);
 		for (int i = 0; i < n_iters ; i++) {
 			if (iocb->iter_is_dio_aligned[i]) {
-- 
2.51.0

