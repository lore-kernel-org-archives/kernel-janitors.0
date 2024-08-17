Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41EA83A06
	for <kernel-janitors@vger.kernel.org>; Sat, 17 Aug 2024 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723877574; cv=none; b=ennIopyd7213UhZ3zdxBKqrW5BLSRJX8QDBK4qd3PP+/3F1gChtk5Uf9ErYOPoQgGsyRN9+r68B6TBWP2kC8I9TIXHMY4UrGFFjw1Y6oRSjavIbu0cvqHg1egNbT91TnDenOA1zNgCZljwGy/WHMgzeRNiIXM03GkshiZt3WUGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723877574; c=relaxed/simple;
	bh=CzHStjjH4V8sPZdoqAFqWMk+oxPdeCbL03cvp8dl/zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GEDaiuownivrOHf1oFzUwi+8sz6x8u+OD+wBFTIk7+Sjx96CetkHmJqk7vniVVceZzb2g6bC3BojkXpMCn8OnNQM36cxQ9wpLpgvVUuKV4piE+wN29Vv8JBBYxa06ej04Q8nV59by5Yri/CwhGvZ8J4w0+b2q8z6eicVDolSZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hy4ZgiM/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hy4ZgiM/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428243f928fso27366205e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Aug 2024 23:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723877571; x=1724482371; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iayHuQdCGfrgLfhcreNqaNDx16C6Jh397QJm/SbJkWE=;
        b=hy4ZgiM/2D0kvCmQzX7EY6f74I182NKLsECGGQJxHlvdy/DiTjhAY1BYU9CXOFTQfB
         YRvoRp6b2wWvjIVI1hsZ/sRefkQO9Vk6TisKbMMf6XwMSq1blf26mkVDyF3KSUcDB865
         JMFhJQZ6+Yofnr50vk1SgeMlK7+LtixjxtNWLAbYaIxeXvxRAKiUnfUDb85b022Kaba4
         p9fpSO2gT1yKwuKeYnqiV+zGR0ZMSb7bPUjZ4k7a7K2ZxiDrPeOhD5zG6+shEi+bygJM
         LhWhSILjTvc797JrZh8yvQ0FrwPmEJXnWAqHbzROMPI15BhPG+8ldIXqKk93Q7Djv8qb
         yGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723877571; x=1724482371;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iayHuQdCGfrgLfhcreNqaNDx16C6Jh397QJm/SbJkWE=;
        b=fE+WPzgsh43v3w0VgnTNnfpeo6ZNhUUTy1V83clwoRYOmoBb8PzF1uCMO/16BI5c0c
         Jt3lHyDwImb0ZBRkCg1PuERuNphDHTv9mAMAE55kYDSseJsWuy8G6JBmDy0EMoA1OvfX
         nvk3gIVe/AmvFAKTFuwB8pNTE7AZk/EVAYSoyAu1wVcFDgV/BIJw9d1G9skT8A9HlSfr
         H5PuL4eG8u0dQbLVNmS23upIuNHKcIrIvbVZmCTZb5HbnXQHG/XGbw9qYzhZy+S5TriH
         8mb3E4E+LwiTiU0lI40FdAF/QXKGz3NRatBGai09iMVwMQMugA61FtJJ7sViltTUz3xl
         c8bg==
X-Forwarded-Encrypted: i=1; AJvYcCUrS/ldqb56pD2Iz1/8WTdnzklvG5B/rtm8daeEgUBi+FQfVgAS50eIFdi2+DvUe/uAHgONzit3YI/BNvSa/eJoU7tpJYulotAlBT9VboQF
X-Gm-Message-State: AOJu0YyCJgu4kgbXQZUigYctTKSGTscMV3n9+2r7KRORZcxV9jwe5y1i
	srDnrtph9zok9G/MSPIO/43yuwEYUAUwyia6N9CdcqG7XDwJp5KRgced+8nS8Pla0wT5IUayaKb
	1
X-Google-Smtp-Source: AGHT+IFNIXj9oV9+Ox0dNnq+TrIQ0ML3idpxQu8xxGwKVDp40dG1KGsNY1LaeHzxO7S57gOvqrDEzQ==
X-Received: by 2002:a5d:5545:0:b0:366:ee01:30d6 with SMTP id ffacd0b85a97d-3719469ff15mr3757080f8f.49.1723877571207;
        Fri, 16 Aug 2024 23:52:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898ab855sm5141246f8f.105.2024.08.16.23.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 23:52:50 -0700 (PDT)
Date: Sat, 17 Aug 2024 09:52:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] dpaa2-switch: Fix error checking in
 dpaa2_switch_seed_bp()
Message-ID: <eec27f30-b43f-42b6-b8ee-04a6f83423b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dpaa2_switch_add_bufs() function returns the number of bufs that it
was able to add.  It returns BUFS_PER_CMD (7) for complete success or a
smaller number if there are not enough pages available.  However, the
error checking is looking at the total number of bufs instead of the
number which were added on this iteration.  Thus the error checking
only works correctly for the first iteration through the loop and
subsequent iterations are always counted as a success.

Fix this by checking only the bufs added in the current iteration.

Fixes: 0b1b71370458 ("staging: dpaa2-switch: handle Rx path on control interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From reviewing the code.  Not tested.
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
index a71f848adc05..a293b08f36d4 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
@@ -2638,13 +2638,14 @@ static int dpaa2_switch_refill_bp(struct ethsw_core *ethsw)
 
 static int dpaa2_switch_seed_bp(struct ethsw_core *ethsw)
 {
-	int *count, i;
+	int *count, ret, i;
 
 	for (i = 0; i < DPAA2_ETHSW_NUM_BUFS; i += BUFS_PER_CMD) {
+		ret = dpaa2_switch_add_bufs(ethsw, ethsw->bpid);
 		count = &ethsw->buf_count;
-		*count += dpaa2_switch_add_bufs(ethsw, ethsw->bpid);
+		*count += ret;
 
-		if (unlikely(*count < BUFS_PER_CMD))
+		if (unlikely(ret < BUFS_PER_CMD))
 			return -ENOMEM;
 	}
 
-- 
2.43.0

