Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24884C4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jul 2021 07:34:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0830E60EBD
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jul 2021 07:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbhGWGx0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jul 2021 02:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233540AbhGWGxV (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jul 2021 02:53:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D59660E8E;
        Fri, 23 Jul 2021 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627025635;
        bh=h2Q1/2Gv6mneDSxxQqwUN5G5OaP5sDay7mxS5iGg2/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cWhpLFSMbzBMHsbnX3+rSv0Q7hBO+ghbOcF/7MBlC/NbZa/PHY85j7h+aPyf2/TnP
         L0JNDKs9+yBwcxDsQ30GUVIlF8dNhZ9u3mKrCRq+kuFI+kxds2h7jZICD2rb6ZzyHl
         PfmJUeDIACe2ZEz5GyehY4gi2OG1xQ+ZueQlrAgrOQMdPfxW50qvryYc5J8pTqr25h
         1W8sJxUxIefiLMwMPSlktik51Z0NF3jT2X98+vl875/yl28+eNfSGhq4guZP3o7vik
         0aqvhaF3jKmOGUTQg/qf7Dci4YKdz80m4KfP3jKwpAqPVfyrqnTM0Uwc4kJtI6nGKV
         AhnP9tdEDOiOg==
Date:   Fri, 23 Jul 2021 15:33:49 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: imx: fix missing 3rd argument in macro
 imx_mmdc_perf_init
Message-ID: <20210723073348.GE30773@dragon>
References: <20210715132321.25388-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715132321.25388-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jul 15, 2021 at 02:23:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function imx_mmdc_perf_init recently had a 3rd argument added to
> it but the equivalent macro was not updated and is still the older
> 2 argument version. Fix this by adding in the missing 3rd argumement
> mmdc_ipg_clk.
> 
> Fixes: f07ec8536580 ("ARM: imx: add missing clk_disable_unprepare()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks!
