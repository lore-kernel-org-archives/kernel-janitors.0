Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BB2CDB482
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Oct 2023 14:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbjJPOLo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Oct 2023 10:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjJPOLn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Oct 2023 10:11:43 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B479DEE
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Oct 2023 07:11:39 -0700 (PDT)
Received: from i53875b5b.versanet.de ([83.135.91.91] helo=phil.lan)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qsOJd-00062e-DJ; Mon, 16 Oct 2023 16:11:29 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Tomasz Figa <tfiga@chromium.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Sandy Huang <hjc@rock-chips.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Yao <markyao0591@gmail.com>,
        kernel-janitors@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        rjan Eide <orjan.eide@arm.com>,
        linux-rockchip@lists.infradead.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
Date:   Mon, 16 Oct 2023 16:11:26 +0200
Message-Id: <169746544051.926160.339275214162402772.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
References: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 11 Oct 2023 11:01:48 +0300, Dan Carpenter wrote:
> The "ret" variable is declared as ssize_t and it can hold negative error
> codes but the "rk_obj->base.size" variable is type size_t.  This means
> that when we compare them, they are both type promoted to size_t and the
> negative error code becomes a high unsigned value and is treated as
> success.  Add a cast to fix this.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
      commit: 6471da5ee311d53ef46eebcb7725bc94266cc0cf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
