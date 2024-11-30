Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4415532A
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961265; cv=none; b=l8lQg2qkVhqbOQGfcp+/huYiiJD7cuicpBK9GanG2Wwmnw5PuBYeHcy5hZPlEak1hmUUbNCOEe0gEOhSgt+PO9h8EDn4DZU+zzDSgy3DE77YZzV6AX2/ydd1JfLjbWDa1fNt0BQdfFZGur4pI5D87Hz6TvJW8bDQjaoMkcx1ymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961265; c=relaxed/simple;
	bh=/Lqq8JaXt4nCGNvsOy0aZbqLE2wFjoQdnXCeO4UCcfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFZ22hZgZjPdAaXyWucossAv69DjG10OCvcOg6p6vic9ZAzde/IotlzpJd1jL423kuqYxXalWnJnuzJPGQtTjA0Jg3Ad2rceY6sXf9k01dmFRYUW4cVxks2SuytpgIA1JtmbagLWCJK927eKNTiWuoqLzF5oDsCq6TCY2q78Djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KlmFOoiR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KlmFOoiR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so139518866b.3
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961263; x=1733566063; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTiN4AcsE0vQHpWePTXXpdIk4ANIHC/O3POgP94FzkU=;
        b=KlmFOoiRNiKz0bmAJL57GEISkQoQ512U25sLcZT2hsC8tO8m5haKOCdgJUHuyjppJf
         KWoKC3uHZWLPpq5vL46C6bLn95vUyhHEWPz1UljzjN9KvEF96ZDqG/WAYg4itPQubq7j
         EBfOagcrQ+dOxFdLjQ1q1/x756AQY7lngM6ufHZY5r+lRmAGYdxTPxnLXcGmXmf6p1iq
         q5uT22WixjfX3OV2CLM8n7lKc3mPFxUdt1mndKhGiS0oamSBjj1eqz+Ve4ffeW3BzbkA
         nse6GpSnavW30ilngbrCWsnixHl6pC1BA8CJDTAFxz7H3Qu04LZtlO60ghpH+YFt6RO3
         Me2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961263; x=1733566063;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LTiN4AcsE0vQHpWePTXXpdIk4ANIHC/O3POgP94FzkU=;
        b=Ym4I4/L0Mln2/KNzm3ISvlW5TO47WLAg3OjJXqEG+dztP5VP7pUD3d77Am1giN2trr
         36Qc92tx9zrf1mpXED+9blVB36TEXOacgjL/BVhCFRi26wFjJ/1m96E+VKQlkMZyfwjp
         dPTbD07sPnL4P8lgnzHqWDDkMpsYSUU23ccb2gjA3h0VNkkrf9iSVrDY3+1r7VCwXr9C
         n1BsG5n3us9TTOjDytzvSAKpKPjPz4x7uJb0/XIg1XITG+Ryp+4r6KRArhJ4PnDzwkYd
         Qt7rpuXuG6KvQu++9UKQgGn1U1FfJRYf/c1imow8xvXpKr3sZfDdNYBOx3NISfl1I1Di
         rmDg==
X-Forwarded-Encrypted: i=1; AJvYcCUhJbeYkPVla+MmSG62BN9OR8xcMVyBc76qI9dORBAt1gqr8B2qkfz01ykId3ltnPLHdLTGcjKrY3h6DGZ2GFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKQFFVeyQtIeMp/kvbfqVn3Vq6cqFfJp855/Ky5Axf+g5+BYI
	ChftWAYzyhLxtQW7gbryT9Uoa724dxi4TIwQsXz8/kQjvmdH1zItW4dIlMeOIDk=
X-Gm-Gg: ASbGnctyFeQON7aWBpVXdLRT4/HYtJdQvMkoQ4jr6ACZoB8utwJxu5HRBbFDNSTsu0y
	kFoCtWNZAdgqJNaF9U/UhZ8w9+jhx5giwSU8T/QnR3VgXKMRNWhEpjO/hkjoyqUHKeZfVGKtGdk
	oZCCyhDweAFUgp3QI9rRig1JOI9fFSK8K1gQ7fr2woI7b6jAva77NwOu31QGhcbMeLnQyUMt60D
	J4v8EKKRn1UoFoGkpN9+xYR0A3HtqdSCPxVGTwKCCRSSmm7W43qH2xCb7wzfbX+6slPLOVq
X-Google-Smtp-Source: AGHT+IHcv3RQB0ttGHB3rHF8kVixpbGo6oU/NmsBDLLe1zSp/r+M8Q40bOxX/CZl1ALhhzeDN+WQDw==
X-Received: by 2002:a05:6402:3589:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5d0ced8d41amr1610681a12.22.1732961262750;
        Sat, 30 Nov 2024 02:07:42 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d4124sm269133866b.64.2024.11.30.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:07:42 -0800 (PST)
Date: Sat, 30 Nov 2024 13:07:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: th1520: Fix a NULL vs IS_ERR() bug
Message-ID: <bda05d7b-5a6e-4f57-a124-ba56f51da031@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_ioremap() function doesn't return error pointers, it returns
NULL.  Update the error checking to match.

Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/mailbox-th1520.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-th1520.c b/drivers/mailbox/mailbox-th1520.c
index 4e84640ac3b8..e16e7c85ee3c 100644
--- a/drivers/mailbox/mailbox-th1520.c
+++ b/drivers/mailbox/mailbox-th1520.c
@@ -387,8 +387,10 @@ static void __iomem *th1520_map_mmio(struct platform_device *pdev,
 
 	mapped = devm_ioremap(&pdev->dev, res->start + offset,
 			      resource_size(res) - offset);
-	if (IS_ERR(mapped))
+	if (!mapped) {
 		dev_err(&pdev->dev, "Failed to map resource: %s\n", res_name);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	return mapped;
 }
-- 
2.45.2

