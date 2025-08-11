Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1A23B632
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909032; cv=none; b=JYSk3b6zOrTyYV3N18IoN97NIYRNsrFl2uOChsVb5O6Fwc0UI+pnpaE9jArWqahrjWJwCe/IQ0CnHhEOYHeOFONvxmanwvEvpe5avdYXu4/kKWPqcDevEuhNmiMRklqfoJDJMwuCP9lx0L6H+F/JtrY/ENONwBrrJ+WGA0RnNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909032; c=relaxed/simple;
	bh=jjqXaXgDKY6odzDCw+MVbdVk4B3G+zBmo7YkF3nHZYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCUWWV/mt5MyOyAtZRbd8gisj/ha2brG0kdSCuy1SC/3VCtGaBb6veaoa7e9uPi6ni24h8deo2/4m9B2y7oPX43hfqRQR5vUFLkJd+mngSbRIKiFu8JRtjCN0qfCr+45CDjQb4zGA9OpDXMFJsshi+0l9MroHakBnaLcg5v2aHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzXvTaVS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzXvTaVS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b7825e2775so3727997f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Aug 2025 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754909029; x=1755513829; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SOPcfPUvQvOcfMF7KghzUxDLwNBuyBOE7Sg8u+9nTqY=;
        b=OzXvTaVSAnT0WLWTeZiXo3UgTbx6h9GqUjYAD9zSO4yudh5fnd4Vu9Bjn/TpHvSSjT
         oAmtUx0TK3rA/5Cqo5EsIOKupOhwALxrsQEsH9wQHVLNWpd1O7C/qip3SaXsGxUa7Jt3
         DmjY1uDQmHcqcWvUV6/Qi7AIBwrpyMS2wstAckYllWeRCh4y9j1ILBUuxIHax5aYtXIy
         PxkiwH4C1cqWb99eg63GiUr0NBJv2eKk4qwYXyrYdb00OnEX+bQ93HntDJR/e0a5o5e/
         0DoOTXqmBSPDrVBWgcDovchdL5amKOm6NGYg2QARnhw8O2qFOOrHad2P91CO+8Snlep7
         5WQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909029; x=1755513829;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SOPcfPUvQvOcfMF7KghzUxDLwNBuyBOE7Sg8u+9nTqY=;
        b=pfrXyZcdAg7DpkV1gZdLOwh4DqSQpMwG+ldsB/0YGudLFxYrpc1wG/eEfugi9nBBAe
         m3dYic/tMWoCTrsmJEagqSdrHntLKPzJPYRGbxUE5HgT7+tZIzDvIfHSzNme66z+tBYv
         9kONkaWO3Rz5si9qkssFWCObaj9qsOrvEYBT7OhUlJkHA6bp20jQJCmEsGLHpNR4svXo
         vTrTa/sAfGRsfNPCq2jwLjlEqKrCqdRA33fHy8aaH3v2s+QbaCBhGwSO8nA7sTVcMHYY
         L0LBenIQgKbQxSNKGR4LMaWXZ3bEftfCTjAT+iWqZjsuiLXpDx2DG3pwhMjv3TngF6/4
         sqlw==
X-Forwarded-Encrypted: i=1; AJvYcCV5pNvvvl2Xp4lS/1NxVQPjen8wCeCGP7orc1TKgpF8CpeO822mcwY1BgKyP3pLsi76/JR6eic9WOR3bXjdnGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5zoI2Hz5Or9lzowIdm6OU0zvDsn8dO52IbkEgYYH9daV/Sqyk
	fSwsxX2dR/EoLwjYABy+CGFyN8QapaJZzXvKLp2sl7d/NIxCVkJ5hn8bj6oLVyRLK0c=
X-Gm-Gg: ASbGnctQcz+By7op8Dcw1EoTUsXGlgt4mpFvFLdc/aVNEqBKyr2TqlLNu/QSI6x8CvV
	Ha9XHvlhLhF5jatKy7G/MC0H1UCWi8qKWzqKBwHB0owPAteFFKT0rOx5KjGUmqzbvkfnT+bqERj
	KUuWM5inxrwXOJ7nAf/9B4SawEgnq1guXUco7p/Ax4vH05BhjA7rvk5sqbnG7Z8sj80p6lVN4vT
	NpiL4PN7NjlqmbYqEQcv+zQdpd0NJfWp6ThLN4A+UF64hZvoxBrCslSznLNnPZhJbEU1RP9lvqs
	BwbYqCWdHh0cvCPksafqZv0JwLwVrZmKSH3RzbQO0kzEjugoCUR2H46uVpRjdEweBsytwRWPXdv
	3knPEuw301lmO7g7j322pnn9j4uXQpcxP
X-Google-Smtp-Source: AGHT+IG0ravrynpY15kze3mYxWIzwLW/5/aen3QDh1FeTgm/ACIuqbr2R1w9fseNZY6MZKwA1ZpxfQ==
X-Received: by 2002:a05:6000:1ac7:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3b900b449b0mr8903590f8f.7.1754909028830;
        Mon, 11 Aug 2025 03:43:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dcb86d6asm299844695e9.5.2025.08.11.03.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:43:44 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:43:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>,
	Fenghua Yu <fenghuay@nvidia.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: idxd: Fix double free in idxd_setup_wqs()
Message-ID: <aJnJW3iYTDDCj9sk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The clean up in idxd_setup_wqs() has had a couple bugs because the error
handling is a bit subtle.  It's simpler to just re-write it in a cleaner
way.  The issues here are:

1) If "idxd->max_wqs" is <= 0 then we call put_device(conf_dev) when
   "conf_dev" hasn't been initialized.
2) If kzalloc_node() fails then again "conf_dev" is invalid.  It's
   either uninitialized or it points to the "conf_dev" from the
   previous iteration so it leads to a double free.

It's better to free partial loop iterations within the loop and then
the unwinding at the end can handle whole loop iterations.  I also
renamed the labels to describe what the goto does and not where the goto
was located.

Fixes: 3fd2f4bc010c ("dmaengine: idxd: fix memory leak in error handling path of idxd_setup_wqs")
Reported-by: Colin Ian King <colin.i.king@gmail.com>
Closes: https://lore.kernel.org/all/20250811095836.1642093-1-colin.i.king@gmail.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/idxd/init.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 35bdefd3728b..dda01a4398e1 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -189,27 +189,30 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 	idxd->wq_enable_map = bitmap_zalloc_node(idxd->max_wqs, GFP_KERNEL, dev_to_node(dev));
 	if (!idxd->wq_enable_map) {
 		rc = -ENOMEM;
-		goto err_bitmap;
+		goto err_free_wqs;
 	}

 	for (i = 0; i < idxd->max_wqs; i++) {
 		wq = kzalloc_node(sizeof(*wq), GFP_KERNEL, dev_to_node(dev));
 		if (!wq) {
 			rc = -ENOMEM;
-			goto err;
+			goto err_unwind;
 		}

 		idxd_dev_set_type(&wq->idxd_dev, IDXD_DEV_WQ);
 		conf_dev = wq_confdev(wq);
 		wq->id = i;
 		wq->idxd = idxd;
-		device_initialize(wq_confdev(wq));
+		device_initialize(conf_dev);
 		conf_dev->parent = idxd_confdev(idxd);
 		conf_dev->bus = &dsa_bus_type;
 		conf_dev->type = &idxd_wq_device_type;
 		rc = dev_set_name(conf_dev, "wq%d.%d", idxd->id, wq->id);
-		if (rc < 0)
-			goto err;
+		if (rc < 0) {
+			put_device(conf_dev);
+			kfree(wq);
+			goto err_unwind;
+		}

 		mutex_init(&wq->wq_lock);
 		init_waitqueue_head(&wq->err_queue);
@@ -220,15 +223,20 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 		wq->enqcmds_retries = IDXD_ENQCMDS_RETRIES;
 		wq->wqcfg = kzalloc_node(idxd->wqcfg_size, GFP_KERNEL, dev_to_node(dev));
 		if (!wq->wqcfg) {
+			put_device(conf_dev);
+			kfree(wq);
 			rc = -ENOMEM;
-			goto err;
+			goto err_unwind;
 		}

 		if (idxd->hw.wq_cap.op_config) {
 			wq->opcap_bmap = bitmap_zalloc(IDXD_MAX_OPCAP_BITS, GFP_KERNEL);
 			if (!wq->opcap_bmap) {
+				kfree(wq->wqcfg);
+				put_device(conf_dev);
+				kfree(wq);
 				rc = -ENOMEM;
-				goto err_opcap_bmap;
+				goto err_unwind;
 			}
 			bitmap_copy(wq->opcap_bmap, idxd->opcap_bmap, IDXD_MAX_OPCAP_BITS);
 		}
@@ -239,13 +247,7 @@ static int idxd_setup_wqs(struct idxd_device *idxd)

 	return 0;

-err_opcap_bmap:
-	kfree(wq->wqcfg);
-
-err:
-	put_device(conf_dev);
-	kfree(wq);
-
+err_unwind:
 	while (--i >= 0) {
 		wq = idxd->wqs[i];
 		if (idxd->hw.wq_cap.op_config)
@@ -254,11 +256,10 @@ static int idxd_setup_wqs(struct idxd_device *idxd)
 		conf_dev = wq_confdev(wq);
 		put_device(conf_dev);
 		kfree(wq);
-
 	}
 	bitmap_free(idxd->wq_enable_map);

-err_bitmap:
+err_free_wqs:
 	kfree(idxd->wqs);

 	return rc;
--
2.47.2
