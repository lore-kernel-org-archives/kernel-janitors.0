Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E16FB9D
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Mar 2024 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709306999; cv=none; b=pig4WL4ArdDKMox2nR6oQL2/elL+rJKl9274b9L3ZyoLuvLfzPFl06fVgKN6Jxr540E0xfE0GEDhemY5IGKDqr/EapNpTqPCu3gr/LqVg7qzvzfo85vDr8YYNiktbYhLBtevg1i9bqao7ZqH3OD0JAmHDuv2cIreiLzublRjb8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709306999; c=relaxed/simple;
	bh=zh1tMmI9C8esm9t8S5ODtHnOIgNunq7h2YrtfEFvx/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jau09z1RQL9UgFA52xxbzLADu2wb3PJgSSC8CLSO5yTKtqQ2L4/ItpueXhG/o4roaxIyXL5Yx1bfhPdWo7DEEsoui/yEzjnhD3psZkaEEJcAfUVyKtUX/GlDq+F8CDG5Z6++2PhOTp4cL+QHz+u7gUAwykoM5SXmRJhdsjQ/lZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iN+Gj8BL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iN+Gj8BL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d275e63590so29904031fa.2
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Mar 2024 07:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709306996; x=1709911796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LwF1vEHHtNcLEL22JU7CbamIfjcY0v8w9f8KAiAGRpo=;
        b=iN+Gj8BLG7HaTyiBwK6YrhMrrIGiUH1KBbRM+WYLGIStLQUsdJiiDT8mAnZhyYDe0i
         c9M/sZSyJC3TxXEIAeRBVuAiHTKg6msl4k8SgObymvgGho+tdkul7JSAZm/ZYzpidVMj
         bFm3yJByorJR58EPp23wAxNsFc+DU7GFkuwsCqsUh+wbHJGPOINsql66cjrGOomlD5fw
         FSgwzISi1HG0hbsWJ2v+R2XowxCCzXND8GW3lWvgMt7eAH5bjqfc1XQXD0f37mVJpHIB
         1ktYZPekGQZubSeNJiS8/IESaCq6PCGWpPnL9Ib2y9V6zRIToV1fOpdDRSbUsDMLAjY/
         HVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709306996; x=1709911796;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwF1vEHHtNcLEL22JU7CbamIfjcY0v8w9f8KAiAGRpo=;
        b=PT8Zxg0/8UORbmj8BhpX9hKpZcHOmEauiVqnhgM/DL/TbgQOCabNct6Ulov6B3yaca
         klH1FzQNpz+8aoMCz2UiqydIZ0D3vCOFZ/wC3jZSardauDYNUo1Hw3YzOKBaev11Mur1
         0/N9AwWVHo6JCzGBwfgLHHtzr9s35AxOcqYZlq/3OpnyrM+gcV5mF3tkgEPRNlD/rr+w
         +R2lV+EUpqTxWB6oHVRyATM7ZcPO9xFULdEvvtswsjStJSThU/HWRjyDJour8S2A5KBx
         jqOXDRmhhWIKs8dqBGDCk0XHEet2OHEgSVnubJ2pCB7vAeNMWhQ/BcoTUa9l3eu5e6R9
         IzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqsobrn14d0YwveTYzdlPv22kddLK4KO7j3dFjqtUZkarI8IuZ8aVYm6CrewI/gFf+6lJW8VY7TCiGgniYk+tkvGfaBLqJbhhEIBZLH6RZ
X-Gm-Message-State: AOJu0YyeIXksVqCwI1BDPsEDYDfKWCcomxVab1oRYrDaENh1GORik8PE
	Zz3Q7/qSeUm9bY5l7//QAAMjObLFawvTYnCXaZtTybVy7Mr651c7rmFLuNI4DX0=
X-Google-Smtp-Source: AGHT+IF+EdHbA/WMtHbEnW0MVWTX37KjpNSG/+lUHF/XBnrsQVeoc3UrADapsOV5vobHj+kpeNESiw==
X-Received: by 2002:a2e:2404:0:b0:2d2:935a:7a3d with SMTP id k4-20020a2e2404000000b002d2935a7a3dmr1312182ljk.34.1709306996297;
        Fri, 01 Mar 2024 07:29:56 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c310800b00412b0ef22basm5835531wmo.10.2024.03.01.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:29:56 -0800 (PST)
Date: Fri, 1 Mar 2024 18:29:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] io_uring/net: remove unnecessary check
Message-ID: <3d17a814-2300-4902-8b2c-2a73c0e9bfc4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f5d7887-f76e-4e68-98c2-894bfedbf292@moroto.mountain>
X-Mailer: git-send-email haha only kidding

"namelen" is type size_t so it can't be negative.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 io_uring/net.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io_uring/net.c b/io_uring/net.c
index da257bf429d5..04a7426c80d2 100644
--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -557,8 +557,6 @@ static int io_recvmsg_mshot_prep(struct io_kiocb *req,
 			  (REQ_F_APOLL_MULTISHOT|REQ_F_BUFFER_SELECT)) {
 		int hdr;
 
-		if (unlikely(namelen < 0))
-			return -EOVERFLOW;
 		if (check_add_overflow(sizeof(struct io_uring_recvmsg_out),
 					namelen, &hdr))
 			return -EOVERFLOW;
-- 
2.43.0

