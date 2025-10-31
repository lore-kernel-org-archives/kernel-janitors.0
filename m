Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC06C2E6CA8
	for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915875; cv=none; b=sem0MUMGmvYAwJkitD7rW2HbC5n7nq5mruXNwX+jrQ9fnBo8yReJSbkbfUAfYY3oNm6ZoPDw461PQ4PxyOdHupbtL9h71ZloHPiWYa9nSWIpOP+0IUpJB1+zXBg5BTS4xHhQxBe8x9XxkHkbFnoT3DNnJqVE31VQR0vjAgq5pT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915875; c=relaxed/simple;
	bh=yeiq88IC/wiatgkkK0r6GR62xuv/O/ItLS4vy5v9HZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uL8M2tjhe+j1YfCjCKL2e8sRwRWgPgXYRR0BKk6zPj7xjSKUEwfMc9WLdKl9hzMYbZ9pQ//WNanS2731ejrzoWMcShqIVZUY5ZXzNr1/bV0spYtruv1poR7m6GO/yyQM5grQmW09Snxb1Uljc6UGp7jgymHk8oOSuLXMlHHUcaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWUEHXVz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWUEHXVz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso19404455e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 31 Oct 2025 06:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915872; x=1762520672; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhTG70xhFOoL3LxdnSOH1s4YIgOQ3cukod+Akz7RCDg=;
        b=AWUEHXVzRER+h3Fa/h/PpkzNHYFo+BN1THtGkFpY5ACBoaNibcfs88be+6wTqjh5c8
         4+rLyQEHYb7P4zllAPFRz9VCNRiRvSDvqT80y8xqGrp1ryUg6VhmMt4Gmm9sXvzNuThu
         I+Q9YNN+DawHtGuUNqAfa6lt14W4ZlfL1U2bt5weoYD/n9CxZVj6haqd6oFAD4/Ds9AF
         b5IDNha0wTlqbgIKwEDgNk1sTybAEMIH3iMM3nzkDGkvM4Q8Patnj0bwuu997iAHSztQ
         gt7kBpINEcP5qJsYeonUmMevIdL3Ugr3+F17Qa85h65aGcA1ootFzMqkoT76epJpDb+n
         bwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915872; x=1762520672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhTG70xhFOoL3LxdnSOH1s4YIgOQ3cukod+Akz7RCDg=;
        b=N4K3P02G+MCOxLcj7cTuY+bEos0RYJfwJlNwlWuyYiO7g6ut6/e09z6Hhd89AsQ3Er
         Ct1l1ud2D9GMYGWokCXI+40wum6R6TrBjk4oIjSOMI86k2Y6V/wNqddCvXhGFq6L3R6t
         xHvUPEYoHh9dlMq7ImLQqxvF/t7NRzahqYALDQznvyLWMDl37x+Ym6SZA5c0f69VTkkZ
         wOSjZtKcHOLd0RokiSSLGXZS/gu6ejMWVyX29Hq42uFOqV5/Ld/Rvm16F0PaCyZ3hVCt
         9M/hbmidYi3MKTL71CcrA3GnR5HQe6LNGeBDzkF56d9AmgesLNolWTMmatVENXwCSNyo
         KMww==
X-Forwarded-Encrypted: i=1; AJvYcCVIU73IE/Rd8KFy0fsECbD95rbFM1+UvPGdh09IfbXSGQd3JzGHRmKdefMyslhwLOBv4iAY5nJO0aAqCYvasag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1CjYCGr3xuhxQ0MyJ7526fiq4BRXgD2Fpm7CjZaH1GJeJ3Ja
	LAsBu1+a1y1e8JSvQoAFk8KlRsQC3ZLdtVCh84OuuXnDQaurk3JoCI3NUmX3ghs4lXU=
X-Gm-Gg: ASbGnct1w6qwF1SWGfA/8q4oIR67ho/jQaTCOAy4HbRCaCcfI8qWnNzsoaJsuzPXjnj
	xygiHprs88Nnmv75+d5Jsw9QFaKICKpdcHuRCsmoLGAEt0FhOpsrz2LXQ4KsGdDMpWnNiE5iaRG
	DHyAZkWjUbspjO3KWMNZAJfpJ2PAEofkPJVqEradLWvJdlc34D8Du78zBWf+h1HM8iAQ2QlkxNg
	/EQAxdnXdTZWq5K7SIZk2eLTSaHBBRtr1u0Y4MWkeaecO/79ihaQG0piycfJQc2Jq8TbBUKLziU
	bu3mi4/HBL43CIVFLHcQcMQrEGpPJvQ0sxvHmBvX4yTZRfZMl01WSG0vrUtj2zxBHHZn9EqgAwc
	1iF4aBqadYNH7rU9JXu0dxpTt5XqPnQdSqEmPsuzfJtH256SZCREdFO/UHm6QPzzYxYJDaKVpKz
	EiLYmRsratlj1X19L9
X-Google-Smtp-Source: AGHT+IESqZPWaIgD3AFJm0+ERJLsHPPT26aWWfG1t25b6cC3jhoS3LSTQWz0ZPa8qZHwD6kKbm0TEA==
X-Received: by 2002:a05:600c:1907:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-4773089c432mr29850955e9.20.1761915872032;
        Fri, 31 Oct 2025 06:04:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47733023256sm33788435e9.17.2025.10.31.06.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:04:31 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:04:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] rtlwifi: rtl8188ee: remove an accidental '-' character
Message-ID: <aQSz3KnK4wFIJoe3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "->allstasleep" variable is a 1 bit bitfield.  It can only be
0 or 1.  This "= -1" assignement was supposed to be "= 1".  This
doesn't change how the code works, it's just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Found with a static checker rule that Harshit and I wrote.

 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
index 7252bc621211..7ef57b1c674c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.c
@@ -694,7 +694,7 @@ void rtl88e_set_p2p_ps_offload_cmd(struct ieee80211_hw *hw, u8 p2p_ps_state)
 
 			if (P2P_ROLE_GO == rtlpriv->mac80211.p2p) {
 				p2p_ps_offload->role = 1;
-				p2p_ps_offload->allstasleep = -1;
+				p2p_ps_offload->allstasleep = 1;
 			} else {
 				p2p_ps_offload->role = 0;
 			}
-- 
2.51.0

