Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E362E3AF5
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 06:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756794823; cv=none; b=P2G/2E2FWtI6iz27ASs5E06LzfRse4L/+xt0wEo0/JYxFZj6JPcVwl25QOsFxleY5NX9kHP7RzFROYfSMiek5mvMpTP14ZbViPpP8DuBL9dqW2j6DJlO45k0g+UdvxWG09uLBpLN6KhJSdRR34a21jtgP4/DWWmWipXc5vioUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756794823; c=relaxed/simple;
	bh=MKo8n/x52MPOw7BrUfoyfV5mi9Zpix6Gd7w11RHjJxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgilO481htm6EX8X3WYtxm2yt2XeWc2uP80AhKltAadostUJYL6XIS/Wzt86VPEdaAsQNE0K0cKwDleu1zF6qVUKLLgUJgjQmQ5OOw3t2wS+FHvdzHGtpj7jEpjrE7MPiKfWbhiwiCvi4RbCKE5xiT1yjwzGWx/mEqkw8JNuJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW+QmvWd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW+QmvWd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso32449825e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756794820; x=1757399620; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=losT/kfGGLPsjGybv1p41hnyyy7EMl3u0Mtb0w2e7UQ=;
        b=OW+QmvWdPyijoDUNn/b6n9Ok/x3duEO0BLJ+bq6MsDq4cZuhp8QIIBqWuafnw6jumn
         mkuk5CZ1/MedVVi/YehIWBuEwKsrGWfG826AW460YFbgVI9MTT7xBJgAkNBadJCeLPgI
         8rsol1Q8JADindc25txhwyLzc7X0GSJFU3PTU5SDyKaFLJjM8lX7G8RbI946QOFGdMvP
         5QabQ2NmU4nilDM17n35MyVLjsJ5NxQws/+FV/2wOQkoaSBGnsk3BJ7G6OrKiweQjZiT
         BALBeJN4oZCvCN9Ayq//rtMh57PatRxSoptS05nE1D88A8oevznx8cvt4JyI1+8GpbLW
         ZYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756794820; x=1757399620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=losT/kfGGLPsjGybv1p41hnyyy7EMl3u0Mtb0w2e7UQ=;
        b=R7VwtbyiArhKxEoC40rwGKlx4LBxJ/gLM8aKjMNfIhNbuT7tiunZRxLl6zq0iatmt3
         +QPujGczWhZpFKIUOQ/jWnV84rDw90FPYzoyFUa2eI7Pvx/CEx+zLnR9Xkrid0U6zdsI
         mG4PnFxKnzwsC5jUwta4z3+2wLTXloTU1r77G7WwgdW48F9EODlBju1KoweW21daqdWR
         gZRee/GipSI+nEC8E3iJfadDQi3TOWhyP1W4/oQlsuO1kWyZ1hBvOjnceP7jHw2Oktm+
         AWX1NF4ia5aGDx4PqgcpiujXICb2aLmjy+LFWf2raQqkt7EalnEwd86AeWbRW5Z77sgL
         rPTA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NbSlvlVzBEb82cDmTZfu4AkqvFXeZB+ViX+tHz5gDgV+J0Mq4DruvJLqPc/8wndX1vlPtHYXivbC0z5iq2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtyVSrBam+vQDiHb6hTZ/PPFSXYLRnjX3H6rdKssR1KbP7w9YH
	sNNdlSJjIUeFbuwlVF8d40UJo5FOxKDZI/HQ/1C2a1JKmRPYNB3/cVO/neXqwsb7INc=
X-Gm-Gg: ASbGncsZbZxL+t1fNe+GZmc1sn0+brxmYTcey5FBrpsSBnZMr5VpkUPOVCN0DDaJGUC
	LmqRC/VduS6IhfnZ4i3pHkiIpWLBQHPWlYnnXZqUfNDdwGn8ub6KC6GyCmdDc1iKmUDIZhvFvCm
	TmGgzY227ZoA7b/53b0eKmjVCt29htt7sZoSKbuts1dzYHjqV2SGsXRC3jMcm8pTUkGVcq/rqs6
	LG2W+65TbYXLDiY56SbbyhtLBaWZ39t1A/rdgQTYP70nM8M2bvgNwPkqRVXQy01iAITbnddSs/J
	FCeZ+D+qbeASo+APjQCwH9ZPMBW6urhAocQRfpO9IapKRYZ6eVcixqu0wI4ex6nO5+9uFZJa+CD
	UYTgrqdLG6fCCdruaEkUZwPFWjayP1M16Bq2vDw==
X-Google-Smtp-Source: AGHT+IGTC4jvhc5wtr9AKkKmGa0tiEpKXwEYpezAIz5zGfXKE+mLDpBMK8tQiURoKbOUDB0H5J7XFg==
X-Received: by 2002:a05:600c:4fc1:b0:45b:6163:c031 with SMTP id 5b1f17b1804b1-45b9353ed8dmr24223305e9.24.1756794820456;
        Mon, 01 Sep 2025 23:33:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm265828005e9.1.2025.09.01.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 23:33:40 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
Message-ID: <aLaPwL2gFS85WsfD@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
pointers.  Update the checking to match.

Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/qcom/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 37c3008e6c1b..121591886774 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -277,8 +277,8 @@ static int qcom_cc_icc_register(struct device *dev,
 		icd[i].slave_id = desc->icc_hws[i].slave_id;
 		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
 		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
-		if (!icd[i].clk)
-			return dev_err_probe(dev, -ENOENT,
+		if (IS_ERR(icd[i].clk))
+			return dev_err_probe(dev, PTR_ERR(icd[i].clk),
 					     "(%d) clock entry is null\n", i);
 		icd[i].name = clk_hw_get_name(hws);
 	}
-- 
2.47.2

