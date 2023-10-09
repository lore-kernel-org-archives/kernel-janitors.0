Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC4CD6136
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 Oct 2023 20:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377918AbjJIUh1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 Oct 2023 16:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbjJIUhZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 Oct 2023 16:37:25 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074649E;
        Mon,  9 Oct 2023 13:37:23 -0700 (PDT)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qpx07-00058Z-Dy; Mon, 09 Oct 2023 22:37:15 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     David Airlie <airlied@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Sandy Huang <hjc@rock-chips.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
Date:   Mon,  9 Oct 2023 22:37:10 +0200
Message-Id: <169688381986.192795.11170132261049443621.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <8494a41602fadb7439630921a9779640698f2f9f.1693676045.git.christophe.jaillet@wanadoo.fr>
References: <8494a41602fadb7439630921a9779640698f2f9f.1693676045.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 2 Sep 2023 19:34:31 +0200, Christophe JAILLET wrote:
> cdn_dp_audio_codec_init() can fail. So add some error handling.
> 
> If component_add() fails, the previous cdn_dp_audio_codec_init() call
> should be undone, as already done in the remove function.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
      commit: 44b968d0d0868b7a9b7a5c64464ada464ff4d532

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
