Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D182D6621
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314277; cv=none; b=h7HYDVrLpSvoNVN+R8CPR7oy+b+Y2lG9FsYHx51yUq2IojVzRniXm3EytX7vA6ep/E1Ac4sWh+UYA9qaZzsH8/d0ejVxxRogZAAA25/RI8L6tghRJqj+NBMiQculjwGpQ5V4GcBQuO/fUZ1mmWAmvjRxX8wPaKt6xFY50TRYznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314277; c=relaxed/simple;
	bh=KoHI54xKO6w4vhThwhJrArEjSn2FRb5H0Tw2vvN1TzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzzMbDtxtqzg0DfLWKiJLBUuD9cY2hr9mBj99PCpRde9FI5Hy45rYU3QPE2HZFy02QxECac/IYB6cAZ5Lj86KPx5TZSJjmDf3rxK++apgQE7aYnh2abmEWll/p2c0cgdZeExNBl5y79u+mNy4f61mVdXQr6WJuh8zY8sZVRDXt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xu2aOICF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xu2aOICF"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so2766767a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 23:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764314273; x=1764919073; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWBXP38Y0RctBSxgnReoDAFsYXDk+HV4r4KizoiM/N8=;
        b=Xu2aOICF7fjzCqdUJHKiMGZhgJByTzHUCQrpqYUskV/uw9ijbyFmSA5CVPAwPnfGvy
         /aYALz6XIu+6LdB8y5om3ogS8dgppr2y3/Tj3dAyAfAMl7GzRmouCgnWQ3VD8PiwKaZG
         HCn0LuH/ThQjryr2KLhyVwNbXT4V6c7qzo7QphfT2s4ub+petc0yYxXNEbUn6ZI9NKyP
         o0nLwW88OUlSZMRpu4puSK2PoGlSd2Szd08DRihxnCrNxcRkfFyf1iDofujOgzxK2Ayc
         RKcODEeXyWTUG+1q42WklUHFPeHgK7S4xKKgfmYPiAZczAWhR4EhkzackjXTJL1Zq3dW
         DNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764314273; x=1764919073;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWBXP38Y0RctBSxgnReoDAFsYXDk+HV4r4KizoiM/N8=;
        b=aeXlkQgW7KNOVu1nz5kYol6gLCiraTzPoVfs4VhuhvoJJOorkR8Luv3FvqAtcMlUSn
         BsLRJPlhB6PojbB3fSrILPodUvnuQCLitum5nzZMFjRxIiBfvPLPFtQNonm5+gPy7TYE
         m/RkJYb4Qt8tPsejJV9JgNo3ffsXr/FGsfnG10wTQcWPbRAVkY0ZMJlYwrVYID8rLl5r
         QSX8kJBBAgBOXYlQ7scCl/Zuh1CY5eOLFumICw/dn+85QX04jmRZZjQbrgLbtKaf2Bg+
         3Ckcom9UOZ62Q5bPvX2CiziBHiJD08oAVgwUppg7W7h02I2Gg+reelgncwcCQnUgq1xz
         sRdA==
X-Forwarded-Encrypted: i=1; AJvYcCW9INq1W7ch9ydYo4KgvZ4YxCx1wyuSFCCO8gsjLco6xPm1BXxA7Tz8Ifx0xswePcr2HMt2w4z2sFL73meIWoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsL+Pm7FXMHlHBoaq2xqMs/YaT7XhaNTHSGjJ6dE5UNaV1hVF
	+1MXZ2IWlQGEEhTYOM9fiWE7PU+4k7n67EAPLwgmTmCdCf+AGnZo4us/vURILcUn9jo=
X-Gm-Gg: ASbGnctIlUFvpZMAYNY3QbpTjCRJUMGe3N3sUMTKu0xuw4bbq8IC+EcrAcMG2+ksTT0
	PHwcj6NDE05poAajMfDMLsj37EZ3jixpbCOMjLQOEPH2F1HUvroXRk2l/ddjlkPmQhoV7sFEo67
	/VtmfkKt2gl9V2HSbQzM8nH0iRwYAChGTgnu/N3/WwSQxJE5UvqvB747/1CgTb/U2gWhyST9kqE
	rqiwVZVtd0APrKisCzSBK8uNU892rXFd90id4Ca1IwhNlfd08jOsRRf3z6ew7mb1fNa8uJsZCSI
	EgXwpXtH2cNNXFBlHkk2ZrkCEQex5VbWc6ZRYMgEKpvGXzsXUgPD9G0jd/NGhiwEDC8Rx0cl9Qd
	E8p3E5zKdYhhOw+3h9oIGIuZNgSR173AAyKDGx4KptzDsXy1xN5rnbro7q0aAI3baLOwcz8z7mY
	yuihqMryZSTvsVucxP
X-Google-Smtp-Source: AGHT+IHy8geHvQVdEZJYbb402+U4bD4Z1Mesx4KgjWzi1r4SNNgcwDUHQRL/pHelc2R7Ugk+0s5ETw==
X-Received: by 2002:a05:6402:4313:b0:645:d3fe:8c57 with SMTP id 4fb4d7f45d1cf-645d3fe8d77mr16473812a12.18.1764314273417;
        Thu, 27 Nov 2025 23:17:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64751050a63sm3611118a12.24.2025.11.27.23.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 23:17:52 -0800 (PST)
Date: Fri, 28 Nov 2025 10:17:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Rubin <matchstick@neverthere.org>,
	Paul =?iso-8859-1?Q?Retourn=E9?= <paul.retourne@orange.fr>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpib: Fix error code in ibonline()
Message-ID: <aSlMnaT1M104NJb2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This accidentally returns 1 on error, but it should return negative
error codes.

Fixes: 9dde4559e939 ("staging: gpib: Add GPIB common core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpib/common/iblib.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/common/iblib.c b/drivers/gpib/common/iblib.c
index 7cbb6a467177..b672dd6aad25 100644
--- a/drivers/gpib/common/iblib.c
+++ b/drivers/gpib/common/iblib.c
@@ -227,11 +227,10 @@ int ibonline(struct gpib_board *board)
 #ifndef CONFIG_NIOS2
 	board->autospoll_task = kthread_run(&autospoll_thread, board,
 					    "gpib%d_autospoll_kthread", board->minor);
-	retval = IS_ERR(board->autospoll_task);
-	if (retval) {
+	if (IS_ERR(board->autospoll_task)) {
 		dev_err(board->gpib_dev, "failed to create autospoll thread\n");
 		board->interface->detach(board);
-		return retval;
+		return PTR_ERR(board->autospoll_task);
 	}
 #endif
 	board->online = 1;
-- 
2.51.0

