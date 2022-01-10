Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106AAC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jan 2022 07:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239163AbiAJHME (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jan 2022 02:12:04 -0500
Received: from verein.lst.de ([213.95.11.211]:37052 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230433AbiAJHMC (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jan 2022 02:12:02 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id EE2E768AFE; Mon, 10 Jan 2022 08:11:59 +0100 (CET)
Date:   Mon, 10 Jan 2022 08:11:59 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Alexander Lobakin <alexandr.lobakin@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Subject: Re: [PATCH] ixgbe: Remove useless DMA-32 fallback configuration
Message-ID: <20220110071159.GC625@lst.de>
References: <aafc0597758dd8ba58c15e4bf2e669872246c839.1641748850.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aafc0597758dd8ba58c15e4bf2e669872246c839.1641748850.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
