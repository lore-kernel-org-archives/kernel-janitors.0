Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E64BC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Nov 2022 09:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiK2JLA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Nov 2022 04:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiK2JK5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Nov 2022 04:10:57 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46006532DF;
        Tue, 29 Nov 2022 01:10:57 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id A76ED68AFE; Tue, 29 Nov 2022 10:10:53 +0100 (CET)
Date:   Tue, 29 Nov 2022 10:10:53 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2] nvme: Use kstrtobool() instead of strtobool()
Message-ID: <20221129091053.GA27862@lst.de>
References: <5edef1b51c865faf61752c991eaf292c8a68cc01.1669324969.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5edef1b51c865faf61752c991eaf292c8a68cc01.1669324969.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-6.2.
