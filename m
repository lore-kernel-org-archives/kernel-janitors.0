Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D339C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 17:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F20E6103D
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 17:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhJXR5M (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 24 Oct 2021 13:57:12 -0400
Received: from smtprelay0215.hostedemail.com ([216.40.44.215]:42742 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229886AbhJXR5M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 Oct 2021 13:57:12 -0400
Received: from omf02.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 38F50837F24A;
        Sun, 24 Oct 2021 17:54:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id 045191D42FE;
        Sun, 24 Oct 2021 17:54:48 +0000 (UTC)
Message-ID: <c8cd95bc81173fdbdff4f2b504db3ce89119fa0d.camel@perches.com>
Subject: Re: [PATCH] dma-mapping: Use 'bitmap_zalloc()' when applicable
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>, hch@lst.de,
        m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Sun, 24 Oct 2021 10:54:47 -0700
In-Reply-To: <20976d6fd4af266dec589b40929b53dfddd64b75.1635097161.git.christophe.jaillet@wanadoo.fr>
References: <20976d6fd4af266dec589b40929b53dfddd64b75.1635097161.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 045191D42FE
X-Stat-Signature: dotqdwh1id9s5bqhiu7qf5wdox53djwc
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19VkHMpeC0Rf7DNqfV3OOTzbF+2tEL3N9E=
X-HE-Tag: 1635098088-252882
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 2021-10-24 at 19:40 +0200, Christophe JAILLET wrote:
> 'dma_mem->bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify code,
> improve the semantic and avoid some open-coded arithmetic in allocator
> arguments.

There is a cocci script for some of these.

https://lore.kernel.org/all/08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com/


