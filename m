Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC0AC001DF
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 13:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjGaNx0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 09:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjGaNwX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 09:52:23 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9051BC9;
        Mon, 31 Jul 2023 06:51:56 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id E72F767373; Mon, 31 Jul 2023 15:51:52 +0200 (CEST)
Date:   Mon, 31 Jul 2023 15:51:52 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Mark O'Donovan <shiftee@posteo.net>,
        linux-nvme@lists.infradead.org, kernel-janitors@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
        Sagi Grimberg <sagi@grimberg.me>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] nvme-auth: unlock mutex in one place only
Message-ID: <20230731135152.GA6016@lst.de>
References: <20230727134748.4163796-1-shiftee@posteo.net> <28d11fc5-743f-0810-8ab7-3fa2a3f98c65@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d11fc5-743f-0810-8ab7-3fa2a3f98c65@web.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jul 31, 2023 at 02:00:37PM +0200, Markus Elfring wrote:
> Are imperative change descriptions still preferred?

It doesn't fucking matter.  Please stop spamming nvme contributors.
