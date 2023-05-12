Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC2C77B75
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 May 2023 20:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbjELUmK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 May 2023 16:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239005AbjELUmJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 May 2023 16:42:09 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF403AB8;
        Fri, 12 May 2023 13:41:43 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id D567D68AA6; Fri, 12 May 2023 22:26:24 +0200 (CEST)
Date:   Fri, 12 May 2023 22:26:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/5] optimize some data structure in nvme
Message-ID: <20230512202624.GA21607@lst.de>
References: <cover.1682941568.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682941568.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Thanks,

the whole series looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>
