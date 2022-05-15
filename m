Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF62C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 15 May 2022 20:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbiEOUHx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 15 May 2022 16:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiEOUHt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 15 May 2022 16:07:49 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57960F588
        for <kernel-janitors@vger.kernel.org>; Sun, 15 May 2022 13:07:46 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nqKWh-00069N-AL; Sun, 15 May 2022 22:07:39 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sandy Huang <hjc@rock-chips.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-arm-kernel@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
Date:   Sun, 15 May 2022 22:07:37 +0200
Message-Id: <165264524621.2584623.18007054358707398354.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YnjZQRV9lpub2ET8@kili>
References: <YnjZQRV9lpub2ET8@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 9 May 2022 12:05:05 +0300, Dan Carpenter wrote:
> This error path needs an unlock before returning.

Applied, thanks!

[1/1] drm/rockchip: vop2: unlock on error path in vop2_crtc_atomic_enable()
      commit: 98526c5bbe3267d447ddd076b685439e3e1396c6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
