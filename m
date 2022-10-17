Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798B8C43217
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Oct 2022 07:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJQHVK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Oct 2022 03:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiJQHVI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Oct 2022 03:21:08 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3765A2DD
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Oct 2022 00:21:04 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id A9EBD68CFE; Mon, 17 Oct 2022 09:21:01 +0200 (CEST)
Date:   Mon, 17 Oct 2022 09:21:01 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] nvme: fix error pointer dereference in error handling
Message-ID: <20221017072101.GE30661@lst.de>
References: <Y0pulP9Xj/mQINCh@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0pulP9Xj/mQINCh@kili>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks, applied to nvme-6.1.
