Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02AEC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 07:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89EFB6135B
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 07:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbhESHCJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 May 2021 03:02:09 -0400
Received: from verein.lst.de ([213.95.11.211]:36997 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232520AbhESHCJ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 May 2021 03:02:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6E12067373; Wed, 19 May 2021 09:00:48 +0200 (CEST)
Date:   Wed, 19 May 2021 09:00:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: remove redundant initialization of variable ret
Message-ID: <20210519070048.GB32339@lst.de>
References: <20210513115952.58482-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513115952.58482-1-colin.king@canonical.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.14.
