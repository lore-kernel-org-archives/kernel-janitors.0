Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DCBC61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Mar 2023 09:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjCIJme (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 9 Mar 2023 04:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCIJmd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Mar 2023 04:42:33 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C81E824F;
        Thu,  9 Mar 2023 01:42:31 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 833F168B05; Thu,  9 Mar 2023 10:42:27 +0100 (CET)
Date:   Thu, 9 Mar 2023 10:42:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: repair malformed T: entries in NVM
 EXPRESS DRIVERS
Message-ID: <20230309094227.GC24868@lst.de>
References: <20230308144132.13368-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308144132.13368-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-6.3.
