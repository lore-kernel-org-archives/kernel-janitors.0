Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28F5C433FE
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Nov 2022 06:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiKBG6t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Nov 2022 02:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiKBG6q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Nov 2022 02:58:46 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B26AB8E;
        Tue,  1 Nov 2022 23:58:45 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 695646732D; Wed,  2 Nov 2022 07:58:41 +0100 (CET)
Date:   Wed, 2 Nov 2022 07:58:41 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-nvme@lists.infradead.org
Subject: Re: [PATCH 06/30] nvme: Use kstrtobool() instead of strtobool()
Message-ID: <20221102065841.GA9020@lst.de>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr> <2e8d7f2f3cb754982f5fe99f2e13cf72db9d6dba.1667336095.git.christophe.jaillet@wanadoo.fr> <20221102064747.GA8903@lst.de> <a0df7655-ac8c-0834-0872-2fa97d5b8797@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0df7655-ac8c-0834-0872-2fa97d5b8797@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 02, 2022 at 07:57:23AM +0100, Christophe JAILLET wrote:
> What is the best strategy for sending such patches?

Just send them per subsystems as mini series or individual patches.
