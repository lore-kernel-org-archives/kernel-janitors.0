Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695071EE7D5
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328964; cv=none; b=PuhYxo70bYBqbVPPdAjFibE73X2IFS1QcxRFggS7O6ulL3j7F7YUxh/S8A69bCC/z1nGDfG0t3rMHaLc2O8sMgDYkfzToYZhYCxUfwdCS5up/Ki4ajVSd4O0PBy8hLKcBXTYP/M9Wih+WzCROQE2xbeIUBm1mW2b/YorP3ZAuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328964; c=relaxed/simple;
	bh=yA/0y5/r3RXc5njX7twbCnZs2KG90snQm7Bt83v8+3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+UIdMFfvv0jtHtjddI4Jdpeni1oI6pXkC0s+v6mXD+TDXzTV17c1c6aNLkvQMqbxtZ1QoeFIa/4QflkjYAA6JdZOieljmte+3hbEKP7BUC/7T2VqiKdEzi2V8Zdn9hll7efDEwHcNj0ElGJ4PTnNIx2iZdTb1zGDOBInNC6U0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8gt+hrN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8gt+hrN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f664af5so186351425e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736328961; x=1736933761; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
        b=T8gt+hrNzT8b64Mp3+VwJ9Qwgh1IdeU0+QQzKjEA/tVQdrR0Dvi5oXYdY58hbiCgIR
         2AIv5jv6g2EXX8dhSJHBznIrRDFbr+fzo2FK+RCgASHodIVCipReuz1toKxGA9upVQgY
         xdRLvfhU0oDCglebSE8AGblwSIcE2MXjSpOHUopiaLqnLILETom54AL0AFZfLoE7QOpn
         hheUxddj48OxanTjHTvRJOtaWnofgs8sknzo7Jh6eXoqyczDhbU3jz9/sY0WlsJAZvDM
         V68o4xWGz3M/D3JOseJix0qZ3ZgWTJIVTH934d0Ng6b5Q7fuJi+/A74Q6bHz9Qu8PkAw
         x/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328961; x=1736933761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
        b=iFEBNpl3CDra6FW9LyI7enfVFqiJqcPYDJRrhltXn4OqbaDGWJ3Dtp3vP0PQc01csB
         ZH0nRcGYtoY9W8udXfzRJxj6zycF3kw/TuNRJ2At3f4gAFFp2xTO6/ncyQ9wG53JIB/Q
         RpMEY1+MD4RYTIaxFdwvIeirXw5Q60cMiMGw4xgkvSatqxvh9eHSD9IfkkspPcyFeyKm
         7ZMUx86JdTnYEFGxzDTSNAo2jHO/Kw9cGswAJQGxPYYhM+KC2jmX9c9kPAl+NkYf6rCB
         idQcqAGeSuqIzCxSbE277cngP0DSs3iA2Vmy59FoEFvvx1Z4PrR6kAhE04db+MvC2rQR
         y2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkdMac8BFNK8E+g8XbGRr5H34YE7BZG3ewRPVFcj3ueG1cI+vHPPdDr1JFQNi7Fpx/XBbqHrkvC8J8bzCq1Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36y1pGnIXlhAFHS0JTPfAFtj4lSiBGbQd/IwMw83wplfSP1oV
	I0w7TghU2KJTNuQfxeuA+bSTcsCWNzfQGBGIfrU3nSoAVqfVepQv1rV6KtI2Bbw=
X-Gm-Gg: ASbGncstl/qZRy4jmZpoh3Kit6eGf6WJBnBoCAp3/UQE++SIKY7rXagQHXrkM8yiVO9
	PvL/iu/vRTS19UuIhvmj5scrHiNIx+LR4PrpQrU5bm/1c84lzheZjj/QrDbTEfDMbiNqyek1jBQ
	XfEvBIBFkbxjFiri53wYsIUMexqlTP5v/wk1bW7hzqF2zfAo6BogRr/sPCOG28+7VrtQ4fwJzW7
	eKAWif4q4iID+BlkczDFYsjylbTORSm1O52FwUkVYlj4lv1sHb+ffDzTCwIeA==
X-Google-Smtp-Source: AGHT+IG5WSBhFOJisgYTUKeIhRXBAfvDEN8YKwZDJA2mb5m6FO3aJNoBZk/2i3G8RcBgch7B0HaYEw==
X-Received: by 2002:a05:6000:1acf:b0:386:4034:f9a6 with SMTP id ffacd0b85a97d-38a8735727fmr1340774f8f.57.1736328960701;
        Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm14566785e9.19.2025.01.08.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Date: Wed, 8 Jan 2025 12:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Message-ID: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a type bug because the return statement:

        return ret < 0 ? ret : recv_cnt;

The issue is that ret is an int, recv_cnt is a u32 and the function
returns ssize_t, which is a signed long.  The way that the type promotion
works is that the negative error codes are first cast to u32 and then
to signed long.  The error codes end up being positive instead of
negative and the callers treat them as success.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
I sent this patch earlier:
https://lore.kernel.org/all/Y%2FyBC4yxTs+Po0TG@kili/
but it wasn't applied.  I've changed the commit message a bit and added
new tags.

 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d871b1dba083..0acfda47f002 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1015,12 +1015,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
-	u32 recv_cnt, i;
+	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
 	u32 dsi_mode;
-	int ret;
+	int ret, i;
 
 	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
 	if (dsi_mode & MODE) {
@@ -1069,7 +1069,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.45.2

