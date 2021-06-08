Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8FFC47082
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 16:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D541A6128A
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 16:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbhFHQp1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 12:45:27 -0400
Received: from verein.lst.de ([213.95.11.211]:51660 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhFHQpZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 12:45:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 43F1D67373; Tue,  8 Jun 2021 18:43:29 +0200 (CEST)
Date:   Tue, 8 Jun 2021 18:43:28 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Roy Shterman <roys@lightbitslabs.com>,
        Solganik Alexander <sashas@lightbitslabs.com>,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: fix error codes in nvme_tcp_setup_ctrl()
Message-ID: <20210608164328.GB12661@lst.de>
References: <YLtykIn+Or0l08oV@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLtykIn+Or0l08oV@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.14.
