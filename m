Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B42DC64ED6
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Feb 2023 10:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjB0KIT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Feb 2023 05:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjB0KIS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 05:08:18 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D1B1DB83
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 02:08:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so2958030wmq.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
        b=MKohpDIz/S4Xg0x+X2KcU6t+pMtWw7x7aaCBC2MuziRcvdD9XfqUHYeXhiW+W43YBB
         WZMmSFC8bnLjoEf2XKmsxlNiDJa12aaZjQLXxytckvlazf30HKg1+peTtlqEUkieTxkH
         7RmP0u7MOT/LMhQr5ob35MvXuwnWeHc2KpK5k9Y1w9qDyCjrQE6e/ad6uk4r9od+9jvk
         meRFo3eLsviVdrZhy1gPgxUFhYVVyKitnLYOpBqxNQsQ9KMBew27BcURLOZtsccvOvaj
         CiOxQ/86WpcsJ3MUUK2xAMzmKNChDfPGgcCZZT1YN6VXbFeYyi2HOscibi1xsPfBo5+Y
         S1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
        b=z2XA2iVqgQH2hZfE4MV8yz+dtbC3UUbMyQw3OY1YblfTEEegN3jaP5tCGVFkbNlLmq
         /M6RVvx7tQCO+Pn5impxzkheIJt7SWC6vDPcZrr/SLm/Bpj4ELjrvN4nvTGprbfM91He
         zUXJkBjke9PMuf4srFYlaSURMGbDgFqG+axUHp6sorpPtZM8c4aob9yldc7xSWBjyeDs
         BQ1p1Xbn6pxmSIVtnCs27r1CjamhTr0ql4bO5CpaCYmXU55kG1cl4id2/Q2tVhZSR6Pz
         aOqsDLqFdEspk84GFYVVr1HwTXqFY453eb8mWHg9QEjf65Lis2PVxGRpzY2ArBum6728
         xN3A==
X-Gm-Message-State: AO0yUKWDbNJIgCkYJRlYwMbOTFUQ8uSeF3Bd+n0a5AWQTiA/eKRBz017
        f5AvlKsOHIm+9GtiCJcM6Rg=
X-Google-Smtp-Source: AK7set+NctmgblTUNjstaclh3h5TNdE8Cl1slDZhTW3edmpcS7hONvoasgmxBKplOMlZjM/KqCQXDQ==
X-Received: by 2002:a05:600c:34cb:b0:3eb:a4e:a2b2 with SMTP id d11-20020a05600c34cb00b003eb0a4ea2b2mr8854763wmq.4.1677492495859;
        Mon, 27 Feb 2023 02:08:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a2-20020adfdd02000000b002c3f03d8851sm6734921wrm.16.2023.02.27.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:08:14 -0800 (PST)
Date:   Mon, 27 Feb 2023 13:08:11 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Julien STEPHAN <jstephan@baylibre.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
Message-ID: <Y/yBC4yxTs+Po0TG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a type bug because the return statement:

	return ret < 0 ? ret : recv_cnt;

will not return negatives on 64bit systems.  The problem is that the
function returns ssize_t types, while "ret" is int and "recv_cnt" is a
u32.  The negative values are type promoted to u32 and returned as
positive values instead of negative error codes.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..8e99981ca0e1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
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
@@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.39.1

