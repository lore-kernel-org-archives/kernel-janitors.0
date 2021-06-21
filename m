Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE19C48BE5
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 06:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C87A6100A
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 06:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFUGgo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 02:36:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFUGgo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 02:36:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EA8661002;
        Mon, 21 Jun 2021 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624257270;
        bh=J2UkjNiDVlVLQCJc+TT6Np0y26TvHkmM1b5v6axIous=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kmx6UT26l9lheOTOv4SaHpTyau3Qad/NwftoNAxG7GI/0N3d+t+V0Ci5gY5rQ8mSw
         bB7Liuut68rsh5j9mRkj4KJfVbfSclSH4wK4RiP3H2s9CQD0qsNnC1BulTaAtWk+L7
         F9E4eUWBtSMZn6qgVo4VDX/IG22dT6QfyI8z5vo67e6GblkYrI3duZpGe22kFjUi3p
         vHIkHYBKnhBX2NBzm8muvisi15f5sIpHDpNCAbb1CRI+m/g7kAIrVBGJ123xF8ssJp
         hfeZe/FWnVY39mlwHK3Yqrk94GoJGLq0BneeLwPXZojrRR+GcAohYZpY4iDSmgDZkT
         cijKiU26z1KbQ==
Date:   Mon, 21 Jun 2021 12:04:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     kishon@ti.com, tony@atomide.com, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: ti: dm816x: Fix the error handling path in
 'dm816x_usb_phy_probe()
Message-ID: <YNAy8hlj3upzshnD@vkoul-mobl>
References: <ac5136881f6bdec50be19b3bf73b3bc1b15ef1f1.1622898974.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac5136881f6bdec50be19b3bf73b3bc1b15ef1f1.1622898974.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05-06-21, 15:17, Christophe JAILLET wrote:
> Add an error handling path in the probe to release some resources, as
> already done in the remove function.

Applied, thanks

-- 
~Vinod
