Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1F8C4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jul 2021 07:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59A1A60F57
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jul 2021 07:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhGZHSE convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jul 2021 03:18:04 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:38457 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhGZHSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jul 2021 03:18:04 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3F4401C0003;
        Mon, 26 Jul 2021 07:58:30 +0000 (UTC)
Date:   Mon, 26 Jul 2021 09:58:29 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Martin Kaiser <martin@kaiser.cx>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in
 of_get_nand_secure_regions()
Message-ID: <20210726095829.63af18b2@xps13>
In-Reply-To: <20210724160308.GA62321@thinkpad>
References: <YMtQFXE0F1w7mUh+@mwanda>
        <20210715225045.66185-1-miquel.raynal@bootlin.com>
        <20210724142712.GA24036@martin-debian-1.paytec.ch>
        <20210724160308.GA62321@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Mani,

Manivannan Sadhasivam <mani@kernel.org> wrote on Sat, 24 Jul 2021
21:33:08 +0530:

> On Sat, Jul 24, 2021 at 04:27:30PM +0200, Martin Kaiser wrote:
> > Hi all,
> > 
> > Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):
> >   
> > > On Thu, 2021-06-17 at 13:37:25 UTC, Dan Carpenter wrote:  
> > > > Check for whether of_property_count_elems_of_size() returns a negative
> > > > error code.  
> >   
> > > > Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>  
> >   
> > > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.  
> > 
> > I'm running linux-next on an imx25 system with the following flash chip
> > 
> > [    1.997539] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xaa
> > [    2.004134] nand: Toshiba NAND 256MiB 1,8V 8-bit
> > [    2.008917] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
> > 
> > The system is using the drivers/mtd/nand/raw/mxc_nand.c driver.
> > 
> > Since this commit appeared in linux-next, mxc_nand's probe function fails
> > with -EINVAL, taking this path
> > 
> > mxcnd_probe
> >    nand_scan
> >       nand_scan_with_ids
> >          nand_scan_tail
> >             of_get_nand_secure_regions
> > 
> > nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
> > returns -EINVAL as there's no secure-regions property in my device tree.
> >   
> 
> Doh! Sorry for missing this.
> 
> > We should certainly handle negative error codes before we calculate
> > chip->nr_secure_regions = nr_elem / 2
> > but a missing secure-regions property is a valid case and should not make
> > the probe fail.
> >   
> 
> Absolutely!
> 
> > If the property exists, but the device-tree entry is incorrect
> > and of_property_count_elems_of_size returns -ENODATA, we might print a
> > warning and ignore the entry.
> >   
> 
> Hmm, I think it is best to error out in this case as the user has got DT wrong.
> 
> > What do you think?
> >   
> 
> Since of_property_count_elems_of_size() returns -EINVAL if the length is not
> a multiple of sizeof(u64), we can't just ignore -EINVAL.
> 
> So I think we can just check for the existence of the property before invoking
> of_get_nand_secure_regions(). Miquel, what do you think?

Yes please add this check and we should be good.

Thanks,
Miquèl
