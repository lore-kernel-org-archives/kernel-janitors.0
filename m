Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57BA3C343B
	for <kernel-janitors@vger.kernel.org>; Thu, 21 May 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367783; cv=none; b=Etu/2gFKGpjNsJEEgNCR+fcWyOUPtZ2pizn50qJreidptZA/CGUxMbIiY2N9NBkn6D5uqpzOuZl2zH7DkPLlkcnM02xjm3FbqnkT27zP/aCm09T+PZ5ILpu/O/Jksk4rKqnmg2l6rbQ1oCBm2WugrCB7imSQBqnwZDLyvqoDRXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367783; c=relaxed/simple;
	bh=wigWFtjyEa+VCBZgvrGiZjEW95od0zj93AXCLLanc/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i424UxguXza/IZyYY/jUl5V5rgtJococc2V8V1Yz7e+K1cYjKWavYKPoI0EmQPvte+Deic3Agj38RfpcHnZCThQNZJ4C3PGGNm0B37wJySvkxYmyzVjlvjrtIFgphar/02tMASE4EUKz7zdJaFZ7SJcyCNgPy4WBkbmz4UnzsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaykBOUh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaykBOUh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48fde648a71so43859775e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 21 May 2026 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779367780; x=1779972580; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FOLDoUTVhvtMvpFRrgXFdt2ND7UZm3SuSUfzhbpzKo=;
        b=VaykBOUhtlW88xUww3Jn5n8ZoH/J009CQrx1v1vDaCNrv3+YyuH/fRW2keFMJzUlVX
         VdEGp0dnCqEdkx9wl+a8j7+8Q9/SERvqCcnXg9ZwfrjRvDe4w3DhYB6NEjbNDwXh61HL
         hfEX2fBsGwsUFq4yYoD6BddM+16lBOR/yXgto2fZGDJb0wZOAW8ffS0D60mRhTrvNMiq
         IXruIKVEmjHzAX4Tu0UmfNMrzBNcRGOOplb2hDcgIL/NPdS/2ECYJO4oO9fNAwCyEFPf
         +xHyv4zHnCaI93HCTE3MIyZKLtrDrclTvN+KszVa/Ojru1dZc7NIwFl6EikzLxvSgP9y
         q4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367780; x=1779972580;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FOLDoUTVhvtMvpFRrgXFdt2ND7UZm3SuSUfzhbpzKo=;
        b=YWeJv4RSCQ3aJ+L5NTIxypTMjXsGycrg8qclKNNdKXolnoOkoFsGswJxcpDzaddcpj
         OIIatp+/cuBMwu8RjzJ4a8goK2VnVa0FZB9Tvhossccwdh+TOVjBDbhpur3VbkfMGvBH
         3A8aY7DE7ewJ6dUHazC7QEg0Ol3E1O4SOrNX31NqjCl8yEpmYtLZzHKDvm0HB4s4dYdx
         7MRuBpXNOhpQAc+3BHyrraTri4mMbjFtkneyr2b2THwkNU2A4h41tFnVZt0V94TQBoW2
         fJ+0/J69HJpa7Bfo/5dUhFWZtYKlgh+V9+9oAicd0pjIEc3nJ52iz1fFi275/oLXaquH
         TbLw==
X-Forwarded-Encrypted: i=1; AFNElJ87azvYi/jg4D15DTVXI6i+wwWv9GyA/Kqs5DVqwNaBAoJ/xck2luVh8kF2O41MgLu4URuvVYQtXmOOySZ/drk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoKDHvTqwQ/T7OFi9w7lKYIVf8qQLa/KV5aTYnmFawg9Yo4Rm
	FzGamW9ZpwVvuZ5VKCpoSk8CwoeT9z0nhvqHd0vZn8DFyrxnfd8ABF1Y
X-Gm-Gg: Acq92OHgvKC37PHXve4Zg5wN3K/vqje1NEzBcM/Ohup71jqa2sGEua9JoZRFiue7mim
	8p5ZuacqMqA1HAevmNbIdCT0Qp0q7zAheN/XKSaPI6sz/lpFPWQ2WVZaNhN09YZu+uHN6ZRappH
	BOw2Cu1wVdnPtU4jWqSPAqo4NpjeDhCQg+mYA0gsC0V6a6vdtec+vzSFWezG+eQUVTIDU685CV2
	zh/3b8SiIhidDLI+2woss9KieI3EGLYsJkSRyVhbrEQXZvkL7GmN0R/Z7J57TuBktWsDms83u53
	C+KodSBTTGIGEaYXvwVHCguu+yCmtiQgq6FWZRO821QoHrkMwcwbNk+y9uroIffrIliPXuNm5fn
	npQyy+TfYZoyiWQ6LDXp0Zmxr96uTAyX2PadV1IltymbQhYOJDIpUtruQLtijkIQ9Y3mDEOAIgE
	TVPg3SiOHSnxmgHdl9F+XkER0=
X-Received: by 2002:a05:600c:8286:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4903606a0bdmr35037485e9.6.1779367780083;
        Thu, 21 May 2026 05:49:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c219a0sm16144605e9.5.2026.05.21.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:49:39 -0700 (PDT)
Date: Thu, 21 May 2026 15:49:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Carlier <devnexen@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: lan966x: cleanup error handling in
 lan966x_fdma_rx_alloc_page_pool()
Message-ID: <ag7_YBWRpRmY9MGT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code works, but there are a few things to tidy up:
1. No need to an unlikely() because IS_ERR() already has an unlikely()
   built in.
2. No need to use PTR_ERR_OR_ZERO() because it's not an error pointer.
3. Use the returned error code directly instead of using groveling in
   rx->page_pool to find it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index f8ce735a7fc0..2d1c38289bb4 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -91,7 +91,7 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 		pp_params.dma_dir = DMA_BIDIRECTIONAL;
 
 	rx->page_pool = page_pool_create(&pp_params);
-	if (unlikely(IS_ERR(rx->page_pool)))
+	if (IS_ERR(rx->page_pool))
 		return PTR_ERR(rx->page_pool);
 
 	for (int i = 0; i < lan966x->num_phys_ports; ++i) {
@@ -106,7 +106,7 @@ static int lan966x_fdma_rx_alloc_page_pool(struct lan966x_rx *rx)
 					   rx->page_pool);
 	}
 
-	return PTR_ERR_OR_ZERO(rx->page_pool);
+	return 0;
 }
 
 static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
@@ -115,8 +115,9 @@ static int lan966x_fdma_rx_alloc(struct lan966x_rx *rx)
 	struct fdma *fdma = &rx->fdma;
 	int err;
 
-	if (lan966x_fdma_rx_alloc_page_pool(rx))
-		return PTR_ERR(rx->page_pool);
+	err = lan966x_fdma_rx_alloc_page_pool(rx);
+	if (err)
+		return err;
 
 	err = fdma_alloc_coherent(lan966x->dev, fdma);
 	if (err) {
-- 
2.53.0

