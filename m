Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0B325483
	for <kernel-janitors@vger.kernel.org>; Fri,  8 May 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259158; cv=none; b=mGJOWt9IavJcZ4s/i4LMw28AT22e/L1R9ovQvI2dvNBLzopXnA875Cu/LAwJsRYOvItyrIJnlKOKI2I9USAvwUhlATzWNmFyea+R5LwGbob+5DilSDfcZwMamDlpynFG2RSTOAu0/xIUE22egH4bqwJByrXfenK4g2RP0ynHv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259158; c=relaxed/simple;
	bh=BQ4r8c1KpfYE3hCqwq96T8uwxakS+v2i2hWNPC4C2e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QuwGxbAtzy3rEQDYcnfa0ud11W1rgMbnlMvnrJlBBetLPZxJvBWmxVhkq1JLdm+BCnymeW/2a/QcjnUYOnoycpwruh9ZO+Kuhq0D92oG+5pY0yFQkqqSJJiJrOtg+YsCyb50zSPbRVBtSgoyqr3SdAYT7QjkzFLPzkPZpG/T0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV1jaDMV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV1jaDMV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso14019465e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 08 May 2026 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778259156; x=1778863956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=lV1jaDMV92VP4mV7hGsFeMjBLqrT5fQlkNYsTX6lgtw0166ZXmP9BLLzXUktWuyMY8
         g1xjp96IaUZ0tI2D3zm20LApogdoaij4Vd+NqCxciHvYO5OEJH+FlFP2TBzO3YbfFctM
         ZcVAI/av2KfOsrXJRMItFOZzX55zgXERNrDGH54NA2pW2g4fOQ7NwRbVg0SUXuCVEC7V
         KG7q79mms3LkdPXceA2eTSyWQ5rN5LlavODdmIzHyN2swfpUYO5YsNMJPQ+uIXt/5NrA
         rpVoxoLYoDPJoify1CTSCZtKqyd23FgT64Zs/FHNg/oLJVF5ssCohpB/h84r6qORSR3h
         pwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259156; x=1778863956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=BJ79xuS4wAPb1pyexqXLW3TOotyzSK81kYkH51FkdBtcG129LvHY+jvIjkFcKR52Is
         TrllvmV5BAWMGmNNdLMmhNJDpZdzKvbcCt3XFMZkLZxA4iUaIZ8vBRx1g8bH4JDmCfgp
         ipslwMz5L2rw1dTSWtXe09SVYmRV6Wbn3hq/4ZFUlQt7RYXP1OogYGrQjlUgqHd8kMo0
         IDUe5qLf6wuVub9Y5m/RS+s+2brDsxgoX6/Xxa5dBlnoylb0wF6bRNorNC96xIjtxEkt
         QxgrEeH4jUanqQJ7VFG/pULSbbcZTXOuThBVWiIfjY2vMhsMSDIEi0DvGT4I+DmAX8Eg
         fW8A==
X-Gm-Message-State: AOJu0YyaO5nZRiQ+nlRri4BnymLFm3HIwkgy894/gcV7a7VTfuECZzFu
	s2/b5ASneuq3hcduLSzb5kGvV0NvR6F36gDBjJF+5rJp1asHNXgKEyxk
X-Gm-Gg: AeBDietybQ1k4JRoNmrjyVrd1WBnxMdiYdMy/F8u47xsF+VWfqBpCmtQiu8o4ntUOJJ
	hYrzJdnhyQCEYWGbp45QXoX5Vf3LWRwfYjGiP7EKp81i/9hY0L36jrF36pMsYFOSMMcLvm5hCck
	g3G9jQSJwGvKwxcaBgIOqzWiYFuiyYvHGh4l4zlEhIBAPNYSnL990/c6tCqt6cySk9yNpylPA8g
	syGaINPI2UWm2cIN0YQfXB9Eupckqq/v00uSxXk9lbw+/PDZBbXtLxfDoOeqr70VAPMhvq/Hq7I
	P2iALsXPCeRzOJlv+YfDlkr7KCRP9REwA6kjq6s9/26YKKTXjoY+26LUiBxOwZY10S3RnJ8NrlH
	L8sppADd1EXWeA0buZ3grPYyIkmDlog3HbOYWqIO1i9MJT0ffLmYqA4P6EhRIqW2noq2pR96Fo+
	f04cCNsrhHgkh12qkryaRy7A==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr202325015e9.6.1778259155336;
        Fri, 08 May 2026 09:52:35 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm6637015e9.7.2026.05.08.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:52:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: imx: Fix spelling mistake "mismatced" -> "mismatched"
Date: Fri,  8 May 2026 17:51:09 +0100
Message-ID: <20260508165110.73435-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 78440f62bf92..e5117a1f1995 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -110,7 +110,7 @@ int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 	 */
 	if (header->size << 2 != tx_msg_sz) {
 		dev_err(dev_ctx->priv->dev,
-			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
 			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
-- 
2.53.0

