Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB9328A0
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678399; cv=none; b=KFALYc8+n4rDtaH1uFfcDHbFyF6K3oo69sSFfTy5FB6i4DE2MOwn9QVxjH+3JLG4BJ0RfOqMS1Y/PDRiycwSawmU8IfsLvBc9lcflS4Mv1o1mH4HII6yIA6IOx5OXGAscmKBUSs0+iowT4VkkgzjO4kNR68F5iX41w0V1u1W04I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678399; c=relaxed/simple;
	bh=BSjNR3X+3nm+25UIpSMBQ35cTL6Gc+cEnAXZ4y6VWLw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O/2Dat2Mmd6I397RKRP+7IHJFpjN6j7aww0IbCHMcv7C8o5RcXEi2bZR4besRag9BkNl0v9NMoMIKs/NfOACxSVm0A63WbUPKHxD6MHBJxpFF9QSBYksz9rpk6g6PXiIzuudSMiOVEat46mNgz03xT+J+TYmt2zDK3sItBwwOhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=yQqeFhcR; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="yQqeFhcR"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-829e856a173so23715539f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1724678396; x=1725283196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND3NrPkSi5n6iQvhSYnvkyJB6B2+0U8Ic4Hctt71hOs=;
        b=yQqeFhcRo+1CAV9da501Lj34t3nc2ivLe6U3Mxg2QPV5p0jOTaUbnGF8HcZZ68cXfa
         3BXPNIx1Jyp8QuTwexeP8cG5m25kDHnxTuTtpfXiVMBKqPrVy23jrKTgmJSqJoc8MmJV
         RMsXz+ipYh/WL0YLxvDOYhEqrTwtZ7qQCef/LUmTcIwNl8uRdzCabywW8VNwyrtiEE18
         1S90RHJhWH8XML7eYxb9yM1cKWjTOlecd7CUL9gf2QT53Aos2+w7XWM8qwnHi2PHdQsT
         9ZKDhpl7MAjy1cE2g34YuqJhz91B8SxAF9XQ44Xdlh2jr6KJKRM3gcYPEmVhhWpPqXs2
         JQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724678396; x=1725283196;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND3NrPkSi5n6iQvhSYnvkyJB6B2+0U8Ic4Hctt71hOs=;
        b=QOvzRPqQ8NAzBxLOMMyG8z/6otaJAYaPDXHqv2/w3de/0eNTSVtTyCC3osfoFa6IXh
         MWC6vzrQ7H5twrisLwkAN9b0VQOkAb/J9Abj15ADaSx7U1EprLWf6WRUpMHhrxgUsqe2
         L2mj6p7cgV+cdOQpq0BLLvAXFE1FOYJLyG+2a1SbGRW3B1GNA08NOlnePxmCJyRmG/7I
         ATHHRsN8QifLxLgz9eQh74LAtf51QIYfOB5zoICNh8hskg5u+wzZek+rOI6GZqn2AA01
         DtVhSQyDrdjG9qISV/0lAzhwPUiqKcnsWZRmiaU6tE9l7PrziJPSrCppDrRDExHA5Waf
         0tlA==
X-Forwarded-Encrypted: i=1; AJvYcCU4CaBCIo6sA2ZPAWN5k0VEnK3dwHLs0rc8uL2mKJClV2HD/+mkDoz0+M116F3m11/CWVtZ52kJgHUhMODuvHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdH4O6pC4a8dO0ec/ltp0d4E1zoCLiSpFU+sxoeFnIOkEp218V
	U1PLmTQHg+OkjIpUhbXFvzG2TR5vl43/5A8FczQdy15GC/Jol/mqbRGkf13OZ3KJ84n3ZtynS6R
	X
X-Google-Smtp-Source: AGHT+IGuneM3ymYO8gW9bV/pY862S/sob8UkKyinwtVwYM0YXOVdA12+fjG4OXjQZVCqPhQd4a3LGA==
X-Received: by 2002:a05:6602:6216:b0:824:d9c0:3fc6 with SMTP id ca18e2360f4ac-8278812b383mr1092953939f.3.1724678395910;
        Mon, 26 Aug 2024 06:19:55 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ce710bb24csm2196044173.132.2024.08.26.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 06:19:55 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, 
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
In-Reply-To: <d5322ef88d1d6f544963ee277cb0b427da8dceef.1724602922.git.christophe.jaillet@wanadoo.fr>
References: <d5322ef88d1d6f544963ee277cb0b427da8dceef.1724602922.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drbd: Remove an unused field in struct drbd_device
Message-Id: <172467839482.162646.6496919978142098172.b4-ty@kernel.dk>
Date: Mon, 26 Aug 2024 07:19:54 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Sun, 25 Aug 2024 18:22:23 +0200, Christophe JAILLET wrote:
> 'next_barrier_nr' is not used in this driver. Remove it.
> 
> It was already part of the original commit b411b3637fa7 ("The DRBD driver")
> Apparently, it has never been used.
> 
> 

Applied, thanks!

[1/1] drbd: Remove an unused field in struct drbd_device
      commit: 87599eddc25ac03647ab76221523c6485e7594b1

Best regards,
-- 
Jens Axboe



