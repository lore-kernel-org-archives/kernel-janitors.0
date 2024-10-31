Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E66146590
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2024 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730359422; cv=none; b=rsXIRtDcJmGpJXpPVhBwT9aTiPvtw9XeMnmjA7UnpUxhDdFEULsdbbhJ+JhItB7oTmFWKtW9IeluTOciLzyGHd3pw6+prIH1i2xS+lJ/3/X8EdRnig/TcMgWPatkD/EKvRRbs0KbFCgi7BEZ/hHt3pdnTQOaxAJSoldFPb4hxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730359422; c=relaxed/simple;
	bh=FqPgmfMfJrc0+/cAObgO3obnQM+lqVUBgVtHaNhOgZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmPb0HOtX8HjsytygBRjipn0gKMJ7jz3kFrnKBn6o3vFumaePr39dkyaz68a38P2AuAkRel9Lg6sDo3iIxcbCShGJSwzdjQ+F43YRLTXGj1DF7qgAb6Jq/aIbZpdFnKtQh3FsrXpIwSJxsUySUGoup2yjsqpTd0Yia1CH1p0ZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMJynEQ6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMJynEQ6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so482611f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2024 00:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730359417; x=1730964217; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eppF8n4dF35FPRHto6hGatVhKtxOz/uvRu2s9GrmB9M=;
        b=bMJynEQ6rLmB0znzS8KJ+j7VEGON6Ps/6s+fS/KQukclFldG+cDsrWjrPDMvGuXAD7
         aS/wjQKjowm4iLLWRntj3KZPZDlfXun9Udungqvcz2V3KdRsdLihnY9AyW5UWpB+nk6G
         z6Mikp19dkAZAq+colb2xUrExY+ECvKevq53qRtORNyGXVtpOED/PZZjjPxVcxL0EmXC
         eP2gO7KC4RjiNzYPX1e/TAUsto1sZKd5Se5uz45uAhJarIa4Ve/Q/sS52e7FIFUjmxs8
         QmPDrW6biIB/Z1i6M1UQIY19x/sBwol5mV/hKM/mAfkpTxRR8u64UIc5pjC9BnTsVxUk
         cV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730359417; x=1730964217;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eppF8n4dF35FPRHto6hGatVhKtxOz/uvRu2s9GrmB9M=;
        b=nGZQppEbMgCUV/dED+HeUypNd6mFocqNELfWGR/uju1x6w8iMunY8XVl7OHrtH3KXX
         FuLX5Xl2tYzrzpAyJsCRvOHzZBcKT9fK/LQCG0VqPsHzLOwzbPrkRkQVYWdXltNfo1Rh
         v01nR5TXhgUu2u9TMKJD/EYm58pVes2BIB5F5sM0Hxe+FQMrf6llm2NK/oPUodFk89qZ
         C/gZcinjxqIpQXl0ixYOngGK9kiiORenzwAo9/S2ZKSpL7k/YdzJ3mmJQ0yuCfYGGTxd
         hs7MzyjOe+VsfYxHJaF+gQmDBos6mipKv1yl626xNioGIOOr5dNklVozUaJb2fHwSi0l
         3jgA==
X-Forwarded-Encrypted: i=1; AJvYcCWjaRrPGBw52kxkEeSNGSVruZ5gT6oU/tdDxMYVSjR9vht6+Nw5J44b+XHDJdoxWRS4yMZOpMIJAqXzd8eyuWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/FkUU3KLCCgUABmTqV7soQVQEL//+/jkFGZTtOl89DQl599HM
	QfFVofSS2rsdXgU2K2Hl+Sig4kHGMCNDYTPGRa0RXJ96LDopqogNG5U/+g1xens=
X-Google-Smtp-Source: AGHT+IFNnvWhRF0ypJE2IbRw/0FEvCWw1br2Z/ulxBe7NO7dJpvdXXEpTsTLYVrJ238z2NJVpl5a6Q==
X-Received: by 2002:adf:f887:0:b0:37c:cfdc:19ba with SMTP id ffacd0b85a97d-380611c5005mr16403526f8f.28.1730359416598;
        Thu, 31 Oct 2024 00:23:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d437bsm1214842f8f.30.2024.10.31.00.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:23:36 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:23:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Filipe Manana <fdmanana@suse.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>,
	Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] btrfs: fix error code in add_delayed_ref_head()
Message-ID: <8a26ccf8-707e-4004-8077-0d8b56501d83@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

xa_err errors are equivalent to "error_code * 4 + 2".  We want to return
error pointers here so we can't just cast them back and forth.  Use
xa_err() to do the conversion.

Fixes: 6d50990e6be2 ("btrfs: track delayed ref heads in an xarray")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/btrfs/delayed-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/delayed-ref.c b/fs/btrfs/delayed-ref.c
index 1f97e1e5c66c..012fce255866 100644
--- a/fs/btrfs/delayed-ref.c
+++ b/fs/btrfs/delayed-ref.c
@@ -848,7 +848,7 @@ add_delayed_ref_head(struct btrfs_trans_handle *trans,
 		if (xa_is_err(existing)) {
 			/* Memory was preallocated by the caller. */
 			ASSERT(xa_err(existing) != -ENOMEM);
-			return ERR_CAST(existing);
+			return ERR_PTR(xa_err(existing));
 		} else if (WARN_ON(existing)) {
 			/*
 			 * Shouldn't happen we just did a lookup before under
-- 
2.45.2

