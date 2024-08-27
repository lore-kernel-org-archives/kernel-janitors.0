Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F2B4C92
	for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724754130; cv=none; b=TEtaLEjoyNfPY1L2X+iq8z9Nt8nnq86VD5PO0bdQZHjCEAxNG1OdNDAPWdbxo8Y4xANjGPJMl5As0VPS9WvXf7Be9TSBGSMcAzpRBdrsuIkzbsW9QBmVbioJMMsNKt/AQ8K9LJXAq9GZGVTCrcC13S8uUdQ8KfuaQ03UJ5MFf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724754130; c=relaxed/simple;
	bh=+2jUL/+uEBOw6LpKWlK1Tu+nVd50L/unDNOCfKAZyvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P00/zh432sTNHxlGpoqDZI4/oS8VYXXPgAf9uJC/swM9YGVsQpiaQSzYn9zap1sPxbazjBVcGzG23zeuOodV+C8ycn6qeaZIK6Keanzxrt1TfVEHxy2neklmOEGNcf67NLVNcNo5KIhUG0ebjP3aNFPmZ3Bhce/V/86FzzXTqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Td9kMHk/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Td9kMHk/"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so6800527a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Aug 2024 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724754127; x=1725358927; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXfzGGSzW1LQyVQH2h8XMdx4aBR3WP/4rswBsbhSUHM=;
        b=Td9kMHk/wpL7Ki1rIiR+DzZB8CFwg7ZOc1V3XOmGOceiGBKIRxyEYq1lZPz4VIVz0i
         yKxPpOPsPgv9ym3JSvURbcH9Tek6Si1K/tbsc7jT0sZHQ5uJG/yHBajh6HYABDNYphYc
         RRjpuTTkETSxgiIrjBzIcRT/V8Jbf0aI2FU0cjFmIc0jOnYhOwkgNb/NjZdtJ5mHYLbU
         Zd6DrOBglGKkZ3TvHZ8g0zVDvgBoo+JQe4rWw3n3cUrzvi8vbyXssv1ZYPnyZTQbhPD/
         y7d00oH5cqKkDNizucaVB5EEfI7+fkc4YO4NrALe/gtvhzIo3/QgKu0uzd9NDLi7lG7u
         9kQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724754127; x=1725358927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXfzGGSzW1LQyVQH2h8XMdx4aBR3WP/4rswBsbhSUHM=;
        b=H93LfJWaClk8ma3vP4eS5iFRZuDaBJsSFpRfAKDIcbCoo2H5hWxCT6NrGeKSVsFreM
         g+pKfVSz2S25TijuSsp1h9ywNVgWHa2MWCEWt22hHGnVtWGy9zCw7ei+wI4OiO4UNllb
         ah8dxQXZljzy/fApxRoT1YogjuoLLjW7FaUe3xiqNRRtRcfX7q+QoqzSxT7N8/gldyzI
         I8VhekvbWdgHYUNBBimMx86LLPO3tVF1xMQb3MnIi2xr9FM2L1szMmak3ik75LFjxD67
         KEVPo7o+El5VNfZcsTcEkCXkgED6SOMkCEQSeguTytxnWGqqC+Kj/5/vqNrw4NNlCC2v
         4RDw==
X-Forwarded-Encrypted: i=1; AJvYcCV/szachJg5AKglMurwzfF/XV/jBQ6DAgGWwgrFf7XQcNPiTeBqYEPbHrN8nW9aOP7Iij7O8eei9vTzEizOGjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKst9/9ho7ui69HYpt0BwPhdAASSo0wupG5v+Ug3BalrQ4sw18
	uyxhbwnvVDfHITUNFWmkSNjhDXzeaejZ2osYEHideYkzlix8R33Nht4PbqI8k9E=
X-Google-Smtp-Source: AGHT+IGU1Gcv59EA7RWT0Yplcfm8x3lrlhce91lxQBQsjInUEccjhJX1/5wu0tTWkmXr93DijVx30A==
X-Received: by 2002:a17:907:6e90:b0:a86:85eb:bde9 with SMTP id a640c23a62f3a-a86a54a95b5mr1100570466b.50.1724754126954;
        Tue, 27 Aug 2024 03:22:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549ccacsm91676866b.56.2024.08.27.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:22:06 -0700 (PDT)
Date: Tue, 27 Aug 2024 13:22:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/memory-failure: small white space tweak
Message-ID: <acb3b809-7ef7-42cb-a98b-7654d00e5e54@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This uses 7 space to indent instead of a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This should likely be folded into commit 4e3a04695e25
("mm-migrate-add-isolate_folio_to_list-fix").

 mm/memory-failure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 3438595d0a43..1213649c088b 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2711,7 +2711,7 @@ static int soft_offline_in_use_page(struct page *page)
 		return 0;
 	}
 
-       isolated = isolate_folio_to_list(folio, &pagelist);
+	isolated = isolate_folio_to_list(folio, &pagelist);
 
 	/*
 	 * If we succeed to isolate the folio, we grabbed another refcount on
-- 
2.43.0

