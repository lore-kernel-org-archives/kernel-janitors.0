Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136361F12E5
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327797; cv=none; b=PAtnMc/n7rvOgY6xIMrEacuS16lbUdFO0jUxs1PNrPE+XOHvTd7rnqW4FKOrYcfMMCrZ9GOSYc3ZD0cwGX4e+HXuxERhau/MbflUX+e+LuXg+PTGl6tNxrcLHqofwdW+js7A7B8CsQCBCHX8OKk7HGDsOGVqs0FOMU/XldgQ7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327797; c=relaxed/simple;
	bh=dV4S8HOppsFcgVGC7QiJizQ4Lj1XGOeykTyv7xK55N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnU86DcvuD1xfis6NWpBcNTOfAUGaJytRjpE/p3spt+mjf/HhG9Vw3OmeRkYkNmph6zOFalx/lTkfZWF4h0pFLyo1XYJB1sjc9Y3rJBhvaBAgD/45XvxWHPvWBe5KZsp8FDCVEIDwBp0OB1xbN/WmC3GlN5n1yX7UiBtS+4gArg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZcCtTwS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZcCtTwS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d161947so7808216f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736327794; x=1736932594; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvlBj2WN6a6L2RUlTgyxwxKr5oxzoi756bQqygCmbRQ=;
        b=uZcCtTwSjYooB2860iW+q+xq4ObC7GCz0xj9H30Q6Y7qk/x23Lp5agEGInxwEEi5nM
         yNn3K3B0ww1WCjWfwalAOZx3VSz9flLqrvYTYF5938QrObffjuPsFC79UAylc51zDhMF
         6uzEQRCcUscAwuisoBmqP5lIUwcBA6L7Ras/Hujt8GQw4pMnlbCueYbPD300MYda7b6N
         PavTDkqN5VZuRdCW9OvNlUOPDbrnwzYIE6d2ifBy1nHY2CEdwrGZ6MyDj0B6yExdIcn9
         qiOZNT7gUXwMidIhGWumScuiONrrOHuisraVr3P92V8R7CdM9eAakRut3FLwxZFeIhwP
         wDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327794; x=1736932594;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvlBj2WN6a6L2RUlTgyxwxKr5oxzoi756bQqygCmbRQ=;
        b=TU+hAAWFLsrJzukTOX/Lowb21jPKWC6ELdXI1HpSn6tcFdND/676+8t+UN1oIqO8Hp
         xqrZVXzkjjJ+6XWHzH9kYqIJsTDZ6tR7xSo7fLtNCUTt+xA75O2H4yf8MmiMWyV8h8Qu
         Vl+oFGC0MvIj271ucVJhk3euZa0gKvulr1gI7eACvycoKKlgxmsgMwXWFbfJl8cmPEqv
         nLiyxqn7OBVzdxj/Nf53by7b2gJWPQgNE6b6ININkBnhCgE42Ik16uBtjMLaMnDDmtPn
         tuA3e1yYuAdmxNCXUnUM7s+frhpKxwyjqyvpIMLjZnjSFUW4u+gdCxkar2K4GWyi2zzO
         dU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuh7NmqaouZIqSU4i+vlMsQzCl9vYKCviKpnSyzUrqxd6UXg4yeOIJ0N5zJcKcCsCZYJ/LNZgK3AXiB2IKOaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1aL4GuIRdWI2k6Ha9+x0K4OWkoe9GwLO8IFHzsoM6lQ0a6y27
	me3LMCVSPy4uZVz+1q+gcMXor9hkTfGwlXsvPR9ahskh0s2QMIq3Oe8LS06hTKI=
X-Gm-Gg: ASbGncvaoTWDCL43OjRkbwT3Z1soWwqNlx4bhQZsToeXNLAwq0Y+nzx9ui5T5uNioz0
	mzp6u8h6Hri1x3lbcBNILv50Rt4LlDQBfrvGXERpmSwhJYEqXMXLz0SNN9kBzjHvVvwkvjNaDte
	DKteDZJ4TpEz0WiAf7yxJX5P8Un8XhWJFON2jx6kHSTnolDZEjkv7vMOdtge0yrBHmRmgr+Tqq0
	QGRh6qMbBSGTbDKqIv/6Eq+qAAq0l4l0xbBsJikCTlAutslT+0ZqTijXlLI6A==
X-Google-Smtp-Source: AGHT+IEjLSiUbnxzBVHorfr2BhZyDJueASVdBNF9i3EuS8moSquAx10MsoZpGiupe/eVUlbWfTnYmg==
X-Received: by 2002:a5d:6d09:0:b0:386:1c13:30d5 with SMTP id ffacd0b85a97d-38a872f6ebfmr1477142f8f.7.1736327794371;
        Wed, 08 Jan 2025 01:16:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da70easm13947315e9.1.2025.01.08.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:16:34 -0800 (PST)
Date: Wed, 8 Jan 2025 12:16:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] squashfs: Fix a NULL vs IS_ERR() bug
Message-ID: <7b7f44d6-9153-4d7c-b65b-2d78febe6c7a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __filemap_get_folio() functoin never returns NULL, it returns
error pointers.  This incorrect check would lead to an Oops on the
following line when we pass "push_folio" to folio_test_uptodate().

Fixes: 43c73ba98b2c ("squashfs; convert squashfs_copy_cache() to take a folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/squashfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index da25d6fa45ce..eef1dd462592 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -409,7 +409,7 @@ void squashfs_copy_cache(struct folio *folio,
 					FGP_LOCK|FGP_CREAT|FGP_NOFS|FGP_NOWAIT,
 					mapping_gfp_mask(mapping));
 
-		if (!push_folio)
+		if (IS_ERR(push_folio))
 			continue;
 
 		if (folio_test_uptodate(push_folio))
-- 
2.45.2

