Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B766226CF9
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603714; cv=none; b=aSon+XA6uqm/WqyUxfInLIq1ocGaH3Nl4oBXWLYRoztEdbfy/NJhjxHHf9XYU6anacDxwRKA59tq7YaVBnunhDFQfMpLLa+9+0M727BRHPZeqfbF0JEkr5FkOvRmdeZ8C/9G2Z/ebYBdd2S0NJEkPBh4YZg+pMtrUdc45CI1RZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603714; c=relaxed/simple;
	bh=j4PdO1nu/lOtJhos8w8kwuTN7slIzAII22YRob34W3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sehyhu9H5talFPvWK7QXBqNlm8MkaoIAJBaya5UStX87AgIjzMLKNIWNHiTNGklBi74vENFRnHafMSQbGHuhi19iMsodo1fX33vngMnL8I6uapYo3uP0Q0qKjXpR+oUZlzPoFOaqz0chMoAaiEedOvaFct8AVEszEIb7ZDXbCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fUwfjXp9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fUwfjXp9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so1991285e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603711; x=1742208511; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=fUwfjXp9rTFdMI/2jYh2Pa4duCMDN49sgIGYlm0TwNFFy9a2ZRTS1uw6F7bbhYyEkC
         pJuLv97Ai/ibsz6KBsSfEs1Lj8NBHFuNj26D9ZQortapRgDfYqUulw9Dwd8Ow2KC8Kv+
         MVRhXW97OTq31uq3smzJpBlNW6UYZXcfifMl+eQsDrItmIFsYp36ykLVMsit6d8QJliy
         T9upNRfJYVkUTkpkuu++VOD6xK8AFFVhsCwfcAVZq676v/8S2UTS/QgfqkZMl2iqA5/1
         OsvjAjBK2YVa2t90rOnyIrPoFig+tTS6NVMsYSVb1IbPJFbf5J+R4gm2eCvS1mGXhw6g
         FGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603711; x=1742208511;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=uVp5tHKrjyQzEEL6/BKFXd4qcq8xnRVwzHWyNelqr0AFYv3g67A1IrrttMTufHxV2M
         OxRJpzhzxF+ih2Uz9htOYTJa19ozcClZD9hW6Y506ypC/S2zySDtrfnll1l9RENtx+th
         tgrC5cDD+/Q0rlVHG/tTYFnsMPp/nRdm3YAQBV+ZMGXefOFPO58Ny8v3foaOHXcltYD/
         h5ZlAakTzErlLbVnHihbC6xWmJo8nrGEFlQeyy/7o0P0Nf1KbOa1ts6csCxM3PZY+70y
         ev6isDHKIDYBi/bEBn1/QpdfQrCQ/B4Cy26kqr4m00fFi0r/xyt1PC69Mr3Q5mD1o+Ny
         f6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj2tgyxoannYmVbKlPJJ+AZKKNr1GYoONmm2sQQpqFgaCJDzhxfb9mqIuDm2RjVYdq7h6Ts2Vm391AFCmq6A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2misG6PeZ5j8QZbt6iA2A3En8ggvmVGRVqKehLbXXj3gSEaS
	QQ+QvtHudr2j0XZhnKbZ3SDZ9EIkFr2EGvisg1M3snqnE6Wei/CyEk/AiH5Mqcs=
X-Gm-Gg: ASbGncvX8IoREvCrcRpuxqYrPowi/e2mNj0kDaexMfpa6EPBUMyG+DeJvtOUJh5Jn7u
	ZAkZjx9Ox5f/4CbGjJpIrHBSmeKe3JYp0Ih+sDWlsrojFcmLXBVSapxAkASs4M94W1JpMpNUQiQ
	ky5OL8TJfqLgec64UVpQNiGmlaCgk9vFz5QGAEJnH7fHNDUHW8/nkTlY7Cw6kA37OusMKimg5mt
	qoWWSqR8b9h8XxSwf5LXjkONF1YOBLXWKY06MhdG70VVcgwrdmM4gWQeL7umZHEvU4An0sS0i3C
	6d7j7BeBWctOVwKlGEIWfRK1PTCW9oQdBpgStRSxDBdqpyWapg==
X-Google-Smtp-Source: AGHT+IEvyQMgaUHnCuYCt+OpJiqkHIstn9Ui2odq4PjFQ9lNSszLbzPKWSr7S0YVwsCBZMsm/36JQg==
X-Received: by 2002:a05:600c:470d:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43cfab351c6mr15054385e9.16.1741603710881;
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf27f8ef3sm45737585e9.11.2025.03.10.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
but there was typo and the | operation was missing and which turned
it into a no-op.

Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not tested.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 922330b3f4d7..9efef0e860da 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
 		case SPEED_100:
 			val |= MTK_QTX_SCH_MAX_RATE_EN |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
-			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
+			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
 			break;
 		case SPEED_1000:
-- 
2.47.2

