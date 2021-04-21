Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669C8C43461
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 14:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DEB861425
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 14:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243485AbhDUOWs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 10:22:48 -0400
Received: from verein.lst.de ([213.95.11.211]:54833 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235421AbhDUOWr (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 10:22:47 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 32B6C67373; Wed, 21 Apr 2021 16:22:10 +0200 (CEST)
Date:   Wed, 21 Apr 2021 16:22:09 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] ataflop: potential out of bounds in do_format()
Message-ID: <20210421142209.GA29072@lst.de>
References: <YH/7+65JruUO/wsg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH/7+65JruUO/wsg@mwanda>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
