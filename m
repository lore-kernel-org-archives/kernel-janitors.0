Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F2EC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 14:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC29A604E9
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Sep 2021 14:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346995AbhIIOIl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Sep 2021 10:08:41 -0400
Received: from verein.lst.de ([213.95.11.211]:44470 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344795AbhIIOIa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Sep 2021 10:08:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 66F6668AFE; Thu,  9 Sep 2021 16:07:13 +0200 (CEST)
Date:   Thu, 9 Sep 2021 16:07:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix a width vs precision bug in
 nvmet_subsys_attr_serial_show()
Message-ID: <20210909140712.GA28735@lst.de>
References: <20210909091440.GB26312@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909091440.GB26312@kili>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-5.15.
