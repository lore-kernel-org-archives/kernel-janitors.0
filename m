Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AAEC4332F
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Nov 2022 13:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbiKBNrH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Nov 2022 09:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiKBNqy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Nov 2022 09:46:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1462AE16;
        Wed,  2 Nov 2022 06:46:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB2196199D;
        Wed,  2 Nov 2022 13:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49602C433D7;
        Wed,  2 Nov 2022 13:46:48 +0000 (UTC)
Date:   Wed, 2 Nov 2022 13:46:44 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 24/30] arm64: cpufeature: Use kstrtobool() instead of
 strtobool()
Message-ID: <Y2J0xJ61iclx6WZG@arm.com>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <5a1b329cda34aec67615c0d2fd326eb0d6634bf7.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a1b329cda34aec67615c0d2fd326eb0d6634bf7.1667336095.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 01, 2022 at 10:14:12PM +0100, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
