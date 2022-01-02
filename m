Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129E4C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun,  2 Jan 2022 18:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiABSP4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 2 Jan 2022 13:15:56 -0500
Received: from isilmar-4.linta.de ([136.243.71.142]:41136 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiABSPz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Jan 2022 13:15:55 -0500
X-Greylist: delayed 562 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Jan 2022 13:15:55 EST
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
        by isilmar-4.linta.de (Postfix) with ESMTPSA id A2D4F20140E;
        Sun,  2 Jan 2022 18:06:30 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
        id DF49480637; Sun,  2 Jan 2022 18:35:41 +0100 (CET)
Date:   Sun, 2 Jan 2022 18:35:41 +0100
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pcmcia: clean up dead drivers for CompuLab
 CM-X255/CM-X270 boards
Message-ID: <YdHibXIuQiBD/TM1@owl.dominikbrodowski.net>
References: <20210816150115.12889-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816150115.12889-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am Mon, Aug 16, 2021 at 05:01:15PM +0200 schrieb Lukas Bulwahn:
> Commit 9d3239147d6d ("ARM: pxa: remove Compulab pxa2xx boards") removes
> the config MACH_ARMCORE in ./arch/arm/mach-pxa/Kconfig.
> 
> Hence, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
> 
> MACH_ARMCORE
> Referencing files: drivers/pcmcia/Kconfig, drivers/pcmcia/Makefile
> 
> Clean up the dead remains of pcmcia drivers for Compulab pxa2xx boards.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to pcmcia-next.

Thanks,
	Dominik
