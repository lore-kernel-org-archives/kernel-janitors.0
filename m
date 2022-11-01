Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B361FA373D
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 09:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiKAJqC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 05:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbiKAJp7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 05:45:59 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1D5DF74;
        Tue,  1 Nov 2022 02:45:59 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5D63468AA6; Tue,  1 Nov 2022 10:45:56 +0100 (CET)
Date:   Tue, 1 Nov 2022 10:45:56 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     James Smart <james.smart@broadcom.com>,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme-fc: Improve memory usage in nvme_fc_rcv_ls_req()
Message-ID: <20221101094556.GA12904@lst.de>
References: <87a93f5fadd6e3cba2bb263b8853a5d33f589287.1664704751.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a93f5fadd6e3cba2bb263b8853a5d33f589287.1664704751.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

applied to nvme-6.2.
