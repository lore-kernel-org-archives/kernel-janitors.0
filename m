Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD2AC47087
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 May 2021 18:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C5C4613DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 May 2021 18:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhE1S5f (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 May 2021 14:57:35 -0400
Received: from gloria.sntech.de ([185.11.138.130]:45084 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhE1S5d (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 May 2021 14:57:33 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lmheG-0006hU-5i; Fri, 28 May 2021 20:55:56 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     daniel@ffwll.ch,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        miquel.raynal@bootlin.com, airlied@linux.ie, hjc@rock-chips.com
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: Fix an error handling path
Date:   Fri, 28 May 2021 20:55:52 +0200
Message-Id: <162222814865.2904787.11303263150056915377.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
References: <248220d4815dc8c8088cebfab7d6df5f70518438.1619881852.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 1 May 2021 17:13:16 +0200, Christophe JAILLET wrote:
> 'ret' is know to be 0 a this point. Checking the return value of
> 'phy_init()' and 'phy_set_mode()' was intended instead.
> 
> So add the missing assignments.

Applied, thanks!

[1/1] drm/rockchip: Fix an error handling path
      commit: 3dfa159f6b0c054eb63673fbf643a5f2cc862e63

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
