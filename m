Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0CBC4743F
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 09:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3215E611BE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 09:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhFGJfg convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 05:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbhFGJff (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 05:35:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345B3C061766
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Jun 2021 02:33:44 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqBdZ-0007NR-5g; Mon, 07 Jun 2021 11:33:37 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lqBdY-0001RK-8y; Mon, 07 Jun 2021 11:33:36 +0200
Message-ID: <d6665d84470dfb8ac59d76b97f4f85dc97a754f5.camel@pengutronix.de>
Subject: Re: [PATCH -next] reset: mchp: sparx5: fix return value check in
 mchp_sparx5_map_io()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        UNGLinuxDriver@microchip.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Date:   Mon, 07 Jun 2021 11:33:36 +0200
In-Reply-To: <d222e3a93d192722099994441283193d6ed26a79.camel@pengutronix.de>
References: <20210519141638.3052456-1-weiyongjun1@huawei.com>
         <d222e3a93d192722099994441283193d6ed26a79.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2021-06-07 at 11:23 +0200, Philipp Zabel wrote:
> On Wed, 2021-05-19 at 14:16 +0000, Wei Yongjun wrote:
> > In case of error, the function devm_platform_get_and_ioremap_resource()
> > returns ERR_PTR() and never returns NULL. The NULL test in the return
> > value check should be replaced with IS_ERR().
> > 
> > Fixes: 453ed4283beb ("reset: mchp: sparx5: add switch reset driver")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Thank you, applied to reset/fixes.
                        ^^^^^^^^^^^
reset/next, not fixes.

regards
Philipp
