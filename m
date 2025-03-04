Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B81F12E8
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Mar 2025 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741071672; cv=none; b=r5ebWcjFWnXl84/vzv6+6hnYxhyhxJyXk3GVwkEi7/2sEw3f/3ZwEnBAOrkKkDSj6cFJbCOX1Sj9bDmkB7glXWDgX2+54JY4e5h9IH29+I/H0z/H2rSNZqyQbLDsKLg4bSVGT7/fNqqbSRSkYJQXy+OD89YSisBPP5R30ErPX7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741071672; c=relaxed/simple;
	bh=WeoK4O4lNVf1jf3RL4kog/vPaezBLPVB+yX+IBUebZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFwW5PnxnTnoMwCWxM+yX7pAWdmAPVgD5NINHzM272khDsVdfYVAc/T7CIiGd6Up+M24uT2jDSSPAtV9TlePnX9SBJf1Zhjxlc8EroofPPX0KApvaJ4992smR+GnKmHnlpVtzUldVgv6beYzkgGFzcq2ofqj16+GGDMNx0myCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bttbGjI/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bttbGjI/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac1f5157c90so66237166b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Mar 2025 23:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741071669; x=1741676469; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSdQFiVMCrS5O9/EkwHKFfamzvbURyk8m93xw+1w4DU=;
        b=bttbGjI/lzJoQgfS+9oM+r1NK1li9VyzHlDLSFOdLfzAf99CG19nCgKM857n7GJk6l
         u3+jngiwt8+oocMkzXMHdPV/vUB5JOeyZG/JLby/CcKvSG3bK0pWmp6CrGmXbUPV0qM+
         07RTbCdlR3nKJhd4g5tPB+a/HhtQdCz60AM7lq7liLkSmgfqll7lmxCOha0aQb0MsJGc
         +Oy6BXgcNKRz1whpBO1mK/+XE6+5aZTwMri9neFB5V55fgxIzNa4rYBSTFCyV14olXEr
         4ViqicwViIqVBlmz0auqOVpzKETchpYvKympwTdY8wbMULfHVvtfa2Gq2Q6zg1p/46v4
         zPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741071669; x=1741676469;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSdQFiVMCrS5O9/EkwHKFfamzvbURyk8m93xw+1w4DU=;
        b=M+etr1zjHtyvsrgaisq3hjONdzbQ+hV7Xgp3TvhZ4O9vBQESdPMlIs5ueJEY3VaH9f
         fFqLOYPdE6u7Yz/av/TEhsjkZJtFwqftwxtEbfr15ISJV5lllic0zggXRqclVBExaV0b
         pxYUdTIbcGhNA94iqkSBTIRT5JxReHs+XamJvYvAg2boOHdrTPFkqwUmjgmDQhfptZ/3
         TKtEZJwZ1sZm+6ar2fQDMGj55nzoC6tHc9Ida4o6T6CovVArJQ9B5BPuOb5Zns2bBq6l
         TCHazrLWY4smfierTlxSIrCsS65qwQjrOO5EY9x8i5jb0BLixjWf7LO/rFAWwmFPkr/I
         wxIA==
X-Forwarded-Encrypted: i=1; AJvYcCX22bymkKhOMIRxK2DStYwNbYVxaNQEu9gaW7JQ+xHoWDNQ4175C1h/SHwjuyCacJCD/9ubgqqsbpsG4pFQMqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Gh++PrUY4YBrzsJAl3tRkkMPowem3nc/o9FzsK6y7zg0tt0Q
	RzH0V7bYTHDMa8XtIHX/9iAzOWgwlkjwuDHNx+GQLRFeyXZUhcRVjJEio9n1168=
X-Gm-Gg: ASbGncu61Mzi7wnG2gdBRJAm7Os74142o2wydDPqMdohYDx/Emco2soW+b7Emuw7m0n
	tlX4elcOHkmdtrTFAl0r41yxyll8CBLr5Vy7I37Hg4EFfpoZETb5rbHcWs1oeOyl/8Sq5J7G9YJ
	9MIp8iXgvdbSZkTbHdqDDWxl98hv2nLLpTijQ/JjNK+agJh9D8zmwJCM7mJ5c75ZIH6Us8PFY4x
	FR2LLpWfnziYW7Vlqew7Bsr6wvdUgPlXUislacQVuMWTmOumW/bZWmDxZKgIuVo2eWg6DpGgCYV
	MkQayxrGYwhx3VKUgWbT3jAzJAHa7P9CJt6m3zoDzPtyvbRS2w==
X-Google-Smtp-Source: AGHT+IGxyBW63fSgEIDkdKmUigp27y49JS7UkTA+NZOY+d9+or8SnPNDX/CPFO1XI+oWKppLDaoD5Q==
X-Received: by 2002:a17:907:86a9:b0:abf:6424:79fa with SMTP id a640c23a62f3a-abf6424d073mr1083370966b.28.1741071668220;
        Mon, 03 Mar 2025 23:01:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf7981482csm286996066b.122.2025.03.03.23.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:01:07 -0800 (PST)
Date: Tue, 4 Mar 2025 10:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ahmed Zaki <ahmed.zaki@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net-next] net: Silence use after free static checker
 warning
Message-ID: <Z8alMHz89jH3uPJ9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The cpu_rmap_put() will call kfree() when the last reference is dropped.

Fortunately, this is not the the last reference so it won't free it
here.  Unfortunately, static checkers are not clever enough and they
still warn that this could lead to a use after free on the next line.
Flip these two statements around to silence the static checker false
positve.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 9189c4a048d7..c102349e04ee 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -7072,8 +7072,8 @@ void netif_napi_set_irq_locked(struct napi_struct *napi, int irq)
 put_rmap:
 #ifdef CONFIG_RFS_ACCEL
 	if (napi->dev->rx_cpu_rmap_auto) {
-		cpu_rmap_put(napi->dev->rx_cpu_rmap);
 		napi->dev->rx_cpu_rmap->obj[napi->napi_rmap_idx] = NULL;
+		cpu_rmap_put(napi->dev->rx_cpu_rmap);
 		napi->napi_rmap_idx = -1;
 	}
 #endif
-- 
2.47.2

