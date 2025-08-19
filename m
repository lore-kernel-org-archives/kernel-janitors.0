Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEC26C39B
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596518; cv=none; b=DJc6FUt/hiiql0d3riGO9xlYuLPYlHGOujWD+hKwpyYZ9INAAs7Yu5UWsTU1+XVFRRaEcunznv5odODNmTGS3bmoAH8iwD1ppmGCoPRmt1hY92cub4mPFYZRWmPI0CEiKvxXLGAfMb9Nve0MI1CjOzlMfeJAJz+Ou9oLSqlKFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596518; c=relaxed/simple;
	bh=Rn+8s1z9P5Tpkw9T71JqBJFM5aF2BjvuA2JqLXFJzxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWyJWyZO1qj6xG1MREhNUjMbXPxTPK8ejIgg2C0ZdYqrYl0FLDe2BMEZ9HDNrUVcq8aPpW0LpGHa1/TXAF9LtUfdabHmKekRSpqZgL5qMFRNFe8+exKlfv2n/0P6XA2Gz4o7UhWa+GMg1MAdc5NLgMJp56PcqXOqI3sPprZB3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jy/ruT42; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jy/ruT42"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e413a219so4164204f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596515; x=1756201315; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVLLl9OqNk7Zu3EPzfXMDRVe4XrWiVodoUaeSDsMNj8=;
        b=jy/ruT42PnzyoSFxgOw03yjg6ghYeio7M8XRTStzj/dvvrpYZB2rmga03gce07gSTm
         QBnrvZfpmKbkTvCcNtMrUo9X9/Ly/D4HvmmKgz700NVxAtqFsKcJ3JCOdaIS2yBVMmsF
         xRbOQX2yxJ/9g/kj4THfDBPPYFS56kpwmra2+T3iUUt6+Mc26OvC0e3kL/xrWN7cffWA
         BHyK49iKUYokEuqlMj1bELhhiggvkmhtgN0dHEogI1GaYOUa3I/ZAbCNbdvMT6K4mMgb
         EeskYcvFHx5L1beMfzED8Z1H6PwPDsJmy4yCEc9mrfqs4dvOfoPe4Oz+5l72+8vrbPBy
         ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596515; x=1756201315;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVLLl9OqNk7Zu3EPzfXMDRVe4XrWiVodoUaeSDsMNj8=;
        b=hYmoUfiPBB4dYyeJUYi1d2JZXI8fxvAfvUSzHTbsBKmQAvOPLYBOKd+Ve7T+TRRCbK
         fjncyZn1nY4Uz8V38wR/eYnmNSe1yHOevCvzq/xYcDNYWhZC6bFeJVnkv1qShJ75bb7y
         ucMOGV/oVNmRMo9Ge0m4yyRkDVBV3vhU+6Hr/u8rggXqMEOosUjHeo8U9xTi8dbt8Em7
         1EhCPqVCqROBxpORe5+/hQVdSDah+PFV0ObHGl4uQEeOhA4Lah2kRGlW1wq626gEeQdc
         AuzfPtdGmupsz6K9d/wM13kaVy2q9J2rPCJQGPww6fduZ2ImaZEOOP3tSZ+iJdYLr+GT
         2fSg==
X-Forwarded-Encrypted: i=1; AJvYcCXiOHJ4My3/kR+QHTy+DJZIS2x+Di8qwD/gmvZ8CZ6pMNVCazvHCg7K9xNHk7AmI7DyATfiNW6D49UrOKoe5Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FpamOxiIo8J8e8BomndLtuI+KKG2ux0wuZ2diojJR5K2OTui
	fbGl/RM6VZWJXl4Bu60EIZc7hPawVnsNmPtZorGBa1DyRDRW4VM7RYvS6M8fXxsH+zI=
X-Gm-Gg: ASbGnctNDU5L5acwWzlClN1Og0Xlm+Cpg/48QWwQSlsLMAiafHVul0w4oV4zqCOWEwl
	nOqpK/9isTWUwY7W6W0Ah5zaLpOzwzum3PkeKdfrMXRugIO3ffHW7RnC3y9m0zWcGU1v+YCSQvu
	zb5tzV8A7WOD745R6Sq3fx5YC/PmUxlWi4p9PCWSqTADMOz5Ypyv1zld74/vCKhu+0ISSBBEbIv
	HWGnVXCZPbrXNJy2A2U21rikpAap6pPm5SZ4wm9a8liajPuaEZMBDaAUUQyWKAVwQSpaKZtonLq
	8VW1NLOiuWaTVsn3NRzC4M332ksy1ycJ4B4fxatC2dCSZHN36SBhAZ1ox62Ba2B4y9wVByZNXLX
	8975gYWmOzJhgvJH0Z3ATpJfO8Dz8l/YMyG45khf6dSxfPPSOoQA8xA==
X-Google-Smtp-Source: AGHT+IFmUB9GNTXpWwyDrW0I7+LgcmGoPg5Mmao/+q2ZsLIelBxWWUigl7kupDpLBula5DDMuHfjng==
X-Received: by 2002:a5d:5d0f:0:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3c0ecc3219emr1522505f8f.38.1755596514815;
        Tue, 19 Aug 2025 02:41:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077c5776fsm2929467f8f.61.2025.08.19.02.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:41:54 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:41:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ocfs2: remove unnecessary NULL check in ocfs2_grab_folios()
Message-ID: <aKRG39hyvDJcN2G7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that checking "folios" for NULL doesn't make sense
because it has already been dereferenced at this point.  Really passing a
NULL "folios" pointer to ocfs2_grab_folios() doesn't make sense, and
fortunately none of the callers do that.  Delete the unnecessary NULL
check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ocfs2/alloc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index 821cb7874685..162711cc5b20 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -6928,8 +6928,7 @@ static int ocfs2_grab_folios(struct inode *inode, loff_t start, loff_t end,
 
 out:
 	if (ret != 0) {
-		if (folios)
-			ocfs2_unlock_and_free_folios(folios, numfolios);
+		ocfs2_unlock_and_free_folios(folios, numfolios);
 		numfolios = 0;
 	}
 
-- 
2.47.2

