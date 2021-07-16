Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08701C07E95
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jul 2021 07:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D368C613E7
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jul 2021 07:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhGPH4u (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Jul 2021 03:56:50 -0400
Received: from verein.lst.de ([213.95.11.211]:42189 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhGPH4t (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Jul 2021 03:56:49 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 94EB767373; Fri, 16 Jul 2021 09:53:53 +0200 (CEST)
Date:   Fri, 16 Jul 2021 09:53:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] nvmet: remove redundant assignments of variable
 status
Message-ID: <20210716075353.GB15223@lst.de>
References: <20210706145650.32555-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706145650.32555-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.15.
