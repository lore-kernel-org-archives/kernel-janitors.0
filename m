Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21C20AF66
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254533; cv=none; b=jsc4tg3tg5PrOxoTxI1VnnTYrLqYt8LZtrpteOj3XGZgdjqsZZhOKM8Tln5sT6GqP0hphUupMh6oY9NOfkH6iBu43k4b0V6ZDdyA/FW+a5baeoBCQkUEM2ZPOWA5Vnokq+1U1/EdkPC3WAjQHQCPJDgNQreRXe/43djE3/tpTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254533; c=relaxed/simple;
	bh=GQV4SLZl8Frp7cjX5HDJ6Yk9MZtTIVwea83AAO11NUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZzKBq8M6ZYXcjRhKzQzsaEF8JsSW8u8KPoafI8PPDHa1zmH3AHcP6Q+gQxwYX8jc2Y0TofwRmplNm5gHXtvkj6WX0bBa0FIIKF51L7kmv6L74ARAGDfGrjQhlsojYr5dHgeGyNeeYJ2vA2SOaUGb0miNnHLaQOjlqtOz5KPP9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVKPPdTe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVKPPdTe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so11361555e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 01:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254530; x=1741859330; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lPMtdDnyS5p5XQ8x2O16sVZzRQVpy61Wi4CdXiyF5Y=;
        b=RVKPPdTeVJ//vZ+jgqsvVqscac7qoE5jpomx0DVMMTaXKAr8iBvrh3TeIvIZVPtpso
         uh1F26tI+nLQlGBVj5L1RNX+Q9FH4X/5gond4F4m5pe8KfoMB6zkAXwLfJTQPO11zB5h
         j+VSnmLpGQPvxDpFJ2blSqcBuuVDfcbbYJTlUb0THON6pPZWissmG/7tSisU8mqvOEwM
         Ir61KewCTjXCyUobq6IE8BreCLpkv3Wdoyho1uPTe01l0AjbuDmpluKtDomDIP7yd4K7
         tqasNIB+WadzSLZFTWlksyF+9n41FXYg2ZtZYRa0xhQGhzlOWaVUtLxkFCwz0sSmSv33
         EZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254530; x=1741859330;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lPMtdDnyS5p5XQ8x2O16sVZzRQVpy61Wi4CdXiyF5Y=;
        b=MBudo6eMGxeIHyz0f5A+VaL5ueIeXPj1q5wfVc9tFvg6wunkoOGi+nz/ETM4bT4VpM
         Z59+MNs52fq9j7FTZkypXjtMG4GIHAEuQOldmW5aho92eZ0lE8+RnKsa5VOA8gxQghn2
         qs6adS6NVpsqmZQnOscizmniaI2rNvG/q9y+3TyXgrC4o491AwTvu9be95oPbMWmlYpm
         IjPmcCjGyVNoZRMoyqhYkXITkSAGSFn5HzvZ5ORZT/yRuWLCHTEM8K9nGI1qjHaf/9UI
         AO5vysTr6fNmZjalfBB8S9n9jNICzDAtOPEp2wiUcLNwhXO0dWis85GT/wKctPVyZ2Dg
         +zww==
X-Forwarded-Encrypted: i=1; AJvYcCU0RdYaxsMKYK6DRi1Q8NLPz0kgJkjZYBtbYE1CCkKSlbMr+XOUGMXw7W0zuMl5QdUWZjGv+00KGIebLg9r2kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAyLO9aaZbkAiOSpjz4v22Ur19Gjoj+CyqifNU+xSUqRZh5oir
	7Ll033ZThDs3xvZQoo7ALToozNxRKgwidyElkWvjWmtoVqAljzDdOsNh4PkSVbk=
X-Gm-Gg: ASbGncuX5ySgZ/gyLXyqugCctX7OeMxSutALv2YozWmgkkQNzy8L65mZUckAUYMiEz9
	Idw8nwFLZ9T9jlhZSuRYIZkyCFI3FNoIO7VVLiwGboNqptD0zWgr6GzcrIChLOrzejHxhf6czeF
	KwbO7201Ko5ZQdtaMkY7XuDxUWNfkc2T9gnpIeET5iQFnZZ6BsA0QgQHQpM37Na1CWe9ehZwcau
	2UNQj7LTxZnMtRQ+8STrIQ+y+1Eqo5c2WGQBPMnZOmvrVkCM7IljTrCRoy96mGtMB1MffUgAwAk
	V0UKUvwS1YJt8hA9xOV3dGO7WAHm2ioT7CNvrmPl2SqsXXAcog==
X-Google-Smtp-Source: AGHT+IGgc/VG1JdHkP0LmXTSR3rq/s9jvn1fCwWnouSLK08mf+fqpf+SWLB/GA3APvlWee4dX0nBzA==
X-Received: by 2002:a7b:c053:0:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43bdb368dafmr20653825e9.3.1741254529757;
        Thu, 06 Mar 2025 01:48:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd831719sm15497185e9.0.2025.03.06.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:48:49 -0800 (PST)
Date: Thu, 6 Mar 2025 12:48:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Disseldorp <ddiss@suse.de>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] initramfs_test: Fix NULL vs IS_ERR() bug in
 initramfs_test_data()
Message-ID: <a4ed49c0-e92f-4fa6-b1b2-32749f551724@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filp_open() function returns error pointers.  It never returns
NULL pointers.  Update the check to match.

Fixes: b6736cfccb58 ("initramfs_test: kunit tests for initramfs unpacking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 init/initramfs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs_test.c b/init/initramfs_test.c
index 6231fe012583..7d14f70beabc 100644
--- a/init/initramfs_test.c
+++ b/init/initramfs_test.c
@@ -222,7 +222,7 @@ static void __init initramfs_test_data(struct kunit *test)
 	KUNIT_EXPECT_NULL(test, err);
 
 	file = filp_open(c[0].fname, O_RDONLY, 0);
-	if (!file) {
+	if (IS_ERR(file)) {
 		KUNIT_FAIL(test, "open failed");
 		goto out;
 	}
-- 
2.47.2

