Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE19519ADBE
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724754077; cv=none; b=Aao1OcUvqn7NRbrzmMxf35b8lWJj//Qmu0oBuNIfi8kUmPa5ChmYaKUBQjLEAOsKvjtq5KMjlF0NURIQal3r7h2iadCr/jhSjJM/fJqw9X20LUm0sflHO2Lee3Ena5RIx7VpBiq3g8Kb8j/4XkOsBE7no+gDFq2A92i2wWb8AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724754077; c=relaxed/simple;
	bh=WpkEbJXN36l/+w1BQOU69FzZ4FVKiYj7MJY7doQoJGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTcLJ+LHNqOsQS4unHBQ+jwTHzag5eQhm1ko28iIdQwn+vk+CZZ/SFUTow9N9FZVlRNY+Gqpuxng/AJ9m7uv1Pg+U3FWH+fl6wpR/JmejxhpmWx1Cg8m4HQot8Wy07l1VCkd82bP6tZZq7EK6+oLMzCC+tBdddNhipOwFDOvmHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DhN5J9Ym; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhN5J9Ym"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso7930178a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724754074; x=1725358874; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5veQCoN8lYQBQJD74SRhygXarb8IsubhyDY9LmHaE8=;
        b=DhN5J9YmRY5Q9YoG4kQjrRIcsppKQME509CjTpkFh4nl2nac3hFv+RN1vKCz7Cmr+W
         wIPCTQWwPJqUJO5Zn+pSm4wCIdBP2s/AquB+5zOjD4aXI2e1qzfcNoKZ+3q5WU5R5O2h
         byxLi/gukyVTLoU4KTQPVg8G3RXslWgtvHdROsSWNc/EOKHLm4deRyqDAWdKP+8W1sTA
         36G18PW24493hYtUOubFHWief1aVmwZGYNsaf4r2rtSDPiX0SM+GwMaTGO7BKsi8If/8
         kKn0fXJNojyDyN6UBntldKtGLkzfzod/bqryYehgTywcIEG/KHgDDUwzZqvTlpL2hNts
         1v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724754074; x=1725358874;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5veQCoN8lYQBQJD74SRhygXarb8IsubhyDY9LmHaE8=;
        b=P2kvQpP8V0gs0hW14jVcWvaa2+jzjp572IXKbTRqrWMynOL781pn0DuS89eTRr74xN
         HiXOUMM8GQ09i4lkQ7I7b/DsZiy72pLZfjlNhrvLyCZJFjkfmRNIq2LVJm2gf96uijtE
         Nn+6MsFlSnl5QB7pOf+IlAA3mcLfPf9mmO/jsZgzGDqyBjwB9HWeMEX58flxmcKIseUF
         Aj9BAwqugRQyhpkf1zvQZsRQh88XG1FKZMZwhEaM/dcbKXuEPlkxGbeq7C+n2UuHOh+1
         AWRWayzEyQWl4xjlV+HLbqpi+vNqlBy4c2TYYUj2GYvuUbXLpcfTHYQQp+sQU9SYEyRU
         OfJg==
X-Forwarded-Encrypted: i=1; AJvYcCX2EvgwHlk/fMZemfgnTIQADJ8bFY0wWpsKZXLV3c3JecLkfsz0uHIfosbtSx9mVBKLzqyWtH56SzXMW0tyi5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kRFzOAU8srJQNltt+W5M1asUcmSA5ismhkeT+GrDsRsnqGAZ
	uAE0sCH75hEow3ARns9frdMUAcT2pqGH8cBn8Cc2Aqiwg9OhdjJjicg2ugPGLOk=
X-Google-Smtp-Source: AGHT+IE3u9uTSQrOf4wWogLmsvncGtloKgibZM4lvdiulZe+XAmFxDCcQwrH57K4f9IJ0qqGDj8VOQ==
X-Received: by 2002:a05:6402:1ecc:b0:5bf:38:f676 with SMTP id 4fb4d7f45d1cf-5c08915aac7mr9644088a12.1.1724754074115;
        Tue, 27 Aug 2024 03:21:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4715b0sm832135a12.62.2024.08.27.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:21:13 -0700 (PDT)
Date: Tue, 27 Aug 2024 13:21:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] btrfs: Fix reversed condition in copy_inline_to_page()
Message-ID: <3a05145b-6c24-4101-948e-1a457b92ea3e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This if statement is reversed leading to locking issues.

Fixes: 8e603cfe05f0 ("btrfs: convert copy_inline_to_page() to use folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is obviously correct but it's from static analysis so additional
testing would be good as well.

 fs/btrfs/reflink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/reflink.c b/fs/btrfs/reflink.c
index 1681d63f03dd..f0824c948cb7 100644
--- a/fs/btrfs/reflink.c
+++ b/fs/btrfs/reflink.c
@@ -146,7 +146,7 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 	btrfs_folio_clear_checked(fs_info, folio, file_offset, block_size);
 	btrfs_folio_set_dirty(fs_info, folio, file_offset, block_size);
 out_unlock:
-	if (IS_ERR(folio)) {
+	if (!IS_ERR(folio)) {
 		folio_unlock(folio);
 		folio_put(folio);
 	}
-- 
2.43.0

