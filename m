Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B076BE46
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Jul 2024 01:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720832661; cv=none; b=XUGMh0JT6vzLjEaWwI6IvysLvv1b46gxJrrhvRK37F96SWiB0eAvm0yJ4I0Q9xFeSOLXoWcZz+bhuJPB3EX3mKkYgkDWwe2cNeyelj7SlQI8BsG3hVUE7fTPyTcgX3gbqswI6Hp/PeTB7F6cIe0hQgfPNzB8Tk4VdsqM3FawpUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720832661; c=relaxed/simple;
	bh=RzrD9zGQk8NcYYSGv8KI5yyCUDLRSlNm8Msk9mtdE40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQ0eQWyxbc/r6fDJYGowpjQKeL/TheXEINFxjbnYzSEJq5Q2/dcI08jHzr0jPJMeTawv647gB2NTxWapW5VlqQGOotKzS+7fhQr7+6kdcMyD+Oaz4r+FVQ/uG8R2x90qe2zURe5TRPzAGeZn/9mEP26TmL1aYA1VgAhuTMjFxEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xa1NRRja; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xa1NRRja"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c9cc681e4fso1356547b6e.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720832659; x=1721437459; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yH7mUDs9iCLcnupWVzAlTv4cUV/drEJ2d5DV9IL4ZtM=;
        b=Xa1NRRjaTxoeBKJEkLhvQO7ftbVI73MPS/vlOCQEXmgpsCR+I8zhIQyou+9zyx0jU4
         n9IAMr8LDoW063kfGysm87zI9OQy4s1XmEPfqMk95H37wFVsbWcXY4L/9/g2+GzVmuuc
         xmznsd8J5xVgsViG68Nvlb/NUgGZ0UFJldmifSUtuYCInkASh+4iFP7tcf/GMF7t6H9F
         D8ZPJA+42sk9+lwDDqHcWdhVxdCKa6p3mCYfGoyqlMRFUx2Q0CNUD7fmwYIJnnHr/WKE
         7TA53uct53fBInJpJtDmu4MjDeRsWJD3OZrpziihveWZ+pTyjZz8HVXt5cJ5tCRXALpS
         tNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720832659; x=1721437459;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yH7mUDs9iCLcnupWVzAlTv4cUV/drEJ2d5DV9IL4ZtM=;
        b=jysUG89DVp2Q8tUMnEYHO7Ro8WDtjCRNeLhWJY8SLYvJDfENoIFHSU6ePuQ6a4xl1O
         GQAEC8G89DgpGN0MCff7QJ2p3eZUtrAvHAidJs9bjMoQp9ZSgEqCQ2rrYeEQpe2X0B75
         ORoUFx80Yj9HVNuBtjDL+D7zAoRK+e7oAA3e8HErik2NBae3s6mfTDOJcFotuJf/tf9h
         6OrFltUAeEZ8Xhl0sJkd6WZz9YkuUa0lJ4dG8EUMZijSykHahIW35uSBoB8pZk6EKR1h
         X0h/bTDQC0DFaxMngqtnUpPex+zNTK5YHklglwZCYVwmxgdQMIdmaCAFTTtQP7JkNrvU
         7VPg==
X-Forwarded-Encrypted: i=1; AJvYcCU3qDL8exyZghtENBbdhHlaKjL8i8jH+ncDvmbKFy7W6ZERX1NzJlYztDe/zWA0S7Ghscn5moEICAh85/ZVBj4ORdEq8aRlSpKgyWUUaEV0
X-Gm-Message-State: AOJu0Yymp5Su/2FwYzANac912wpsG762QWa2ChaReiZsHEu+v0DUQo+v
	z+Ikyjq6FJnGyJOL8syu36RZxE9/tyfv8mEbnj39ZviBOLeZIocauB06m+76/p0=
X-Google-Smtp-Source: AGHT+IGQ/I0WaFhGJFtcL3N/xdoeqsNKfep4fanzD9WvQoCVAUijIIi04JLfIvB+6AR9sfiTtDBmRA==
X-Received: by 2002:a05:6808:17a5:b0:3d2:23e0:d7aa with SMTP id 5614622812f47-3d93bef8b38mr17705419b6e.13.1720832659290;
        Fri, 12 Jul 2024 18:04:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dab3e1d054sm25642b6e.53.2024.07.12.18.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 18:04:18 -0700 (PDT)
Date: Fri, 12 Jul 2024 20:04:16 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gao Xiang <xiang@kernel.org>
Cc: Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] erofs: silence uninitialized variable warning in
 z_erofs_scan_folio()
Message-ID: <f78ab50e-ed6d-4275-8dd4-a4159fa565a2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that:

    fs/erofs/zdata.c:1047 z_erofs_scan_folio()
    error: uninitialized symbol 'err'.

The issue is if we hit this (!(map->m_flags & EROFS_MAP_MAPPED)) {
condition then "err" isn't set.  It's inside a loop so we would have to
hit that condition on every iteration.  Initialize "err" to zero to
solve this.

Fixes: 5b9654efb604 ("erofs: teach z_erofs_scan_folios() to handle multi-page folios")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/erofs/zdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index aff3cdf114ad..ac5ffd4674e4 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -962,7 +962,7 @@ static int z_erofs_scan_folio(struct z_erofs_decompress_frontend *f,
 	const unsigned int bs = i_blocksize(inode);
 	unsigned int end = folio_size(folio), split = 0, cur, pgs;
 	bool tight, excl;
-	int err;
+	int err = 0;
 
 	tight = (bs == PAGE_SIZE);
 	z_erofs_onlinefolio_init(folio);
-- 
2.43.0

