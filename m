Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE515A4A0
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713958850; cv=none; b=MCwwqxgNgqkKy5whmbqwLhMTGZ++i0XD9l9M8chP6no2W+xg8Yelj3a6HqQMJDko9H5bs3nw2SVogbZ5LOiXZonPpGkiWwgH725cqhEA8DnAMsXUsIqi3sXXGQAhqwUDxvTrZUjQGTsXVq/9DLiJkv8gxziQ88m7i3X5N++zHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713958850; c=relaxed/simple;
	bh=DZn1msmrvnUDpB1XYGLTb2XSqmSMQi5pdRoTelsZwaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXIEUioemNAJUqIrgpCldIrPFvg+mTCIgntAOb0EprW046c6PxsFNFJDb6hDNSklZQ2ekS1FKm27qY+tLQGGa7QL6hV4/DTRLvNR+vIYL8bxZJ1vBcw0MVyUPupvBfkKlQg0J0DdYCubVoFJilSY8i0q7d5imeTaot5BG1XHm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ie2F7g/j; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ie2F7g/j"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41b09fb205dso3127275e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 04:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713958847; x=1714563647; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0lANIOxi5uxn7sMyfNP37wCyBCdh1cTCQaJU7DGFG0=;
        b=Ie2F7g/jhqM0Uk5g8zolDMMKc9OKIGjSZI/tzuqCrD0P3jv9wKaHsjIcK8rdrcPPky
         S0xK9Xx/97lL6WGoZk6lKcz2a6H8cudDiJfg/ncirdQbxsGujUeD7q05FzaLp+VT/pCA
         D9hUL/soUOcApysUSDKSld2jd4lwazqrXRctSdmk+FWudBBOFRYujTpGCGXAbo+xcHsl
         0oyfc2nJRIbgqTlrZaiFZZ5YBNiLHSlzaOquvzj+xRXwrJCFYdGm+l0As5PrWG/cL6jU
         gGWZl/Z+ws9L1ooeAsSrNFp0mWFjp+3ctRglvIqL4WBl72R0nVFwvHl1xjkr+m64W+Dc
         22hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713958847; x=1714563647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0lANIOxi5uxn7sMyfNP37wCyBCdh1cTCQaJU7DGFG0=;
        b=VbMIgCycmRpR8s1bCyktV0ZEFAF0EtmM0hIquMXDMwS3f1MMHBHwgVTeLhIAwsiZdw
         WoDdVTxRuIFGzhfOptx8HzzuBcf/Am6RuyC4NHYOHS6EebXYbbfOLyJmo28FwOzmFJZy
         MzojXjRXZzp9Gn6Xkohc+bbSXaDUdaMQxIbYNsozbJeUoveJsrfaViAyGcldwRkmXU9x
         0eLQNvB3C/TQCYRVKL8KvOjWj/lwWOIoPKUaQjMwrRt38AphJ9mzx4WKda29K/JtnrGq
         rPR5/c/P/dARHxy5aYYwxaK8vcO9TGb8D0QgpAvICapCQoVcveaWQijMaR/Xw2PaOoOT
         J3pw==
X-Forwarded-Encrypted: i=1; AJvYcCUVSysYK06To/bYm2D3v5nXPej9bpNct7yZ45hoE+VbkZs6UL1XlPE904lpqDFhSIcvd1u9mZxZaQaDAJ/gAFb+7J4h6HP8uzfr4IagLKSU
X-Gm-Message-State: AOJu0Yx9pgsyBMNNYojseeglQCeEL8g3I1wLj4E1MYmVFjLy7kPJE1fw
	OlJUB7jFOaE4LheFNPFuRvU3GI2rvSslZS7S88CbpvAngJysDgOFk3onlQ89xgw=
X-Google-Smtp-Source: AGHT+IFEpG6VVoFe2vx9Em8Wq34NxagOiwS0imQ3bplPo2B0dlfiYMxGiYckEUmIjeAACcHinXRoAw==
X-Received: by 2002:a05:600c:3d88:b0:41b:417:cd6 with SMTP id bi8-20020a05600c3d8800b0041b04170cd6mr886304wmb.7.1713958846907;
        Wed, 24 Apr 2024 04:40:46 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c1d1000b0041902ebc85bsm1305782wms.1.2024.04.24.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:40:46 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:40:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: fix memory corruption in ffa_msg_send2()
Message-ID: <cd5fb6b5-81fa-4a6d-b2b8-284ca704bbff@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "msg" pointer is a struct and msg->offset is the sizeof(*msg).  The
pointer here math means the memcpy() will write outside the bounds.
Cast "msg" to a u8 pointer to fix this.

Fixes: 02c19d84c7c5 ("firmware: arm_ffa: Add support for FFA_MSG_SEND2")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 9f89ee0aaa6b..363e86936461 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -363,7 +363,7 @@ static int ffa_msg_send2(u16 src_id, u16 dst_id, void *buf, size_t sz)
 	msg->offset = sizeof(*msg);
 	msg->send_recv_id = src_dst_ids;
 	msg->size = sz;
-	memcpy(msg + msg->offset, buf, sz);
+	memcpy((u8 *)msg + msg->offset, buf, sz);
 
 	/* flags = 0, sender VMID = 0 works for both physical/virtual NS */
 	invoke_ffa_fn((ffa_value_t){
-- 
2.43.0

