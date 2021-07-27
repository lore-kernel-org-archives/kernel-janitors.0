Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35150C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jul 2021 10:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B596108C
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jul 2021 10:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhG0KGl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jul 2021 06:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236069AbhG0KGj (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jul 2021 06:06:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE4BB61406;
        Tue, 27 Jul 2021 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627380399;
        bh=TYq2xP0tZs2/5voU8QnKjbi73hhy9xhuqGHqxUE1wcg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PA4uxFMjUnu46PGnDXpt/fz+1DHgEp2UtnE85WcLrY5JxYFt5LJUEOxVuMTrpbfdz
         Tgm+RTdiqpT6kfmlr7ux1HX2n1aDP1XH4tB0sNYet4GU2bcUyj5pbAyup7kIKkLvfc
         oKfHiemeUFPr4UaVaKEW+RvrEEX3clAU1VZdkux3zaOsuPFwc6T4i3GpN0lCk3hz71
         nidbqCd0YGfjI+AXAogNBPDjTsukEU/BE28ih4lVlRv8cz8eNLEiXMIRgdaXgnfbrN
         v5tIysEfDp6TPMaXsFRYgh139tx7GOlxk2irzt2hfaWOQSO7SAhPaMrLNI/93g6C9S
         AL8sjWGgdZEJg==
Date:   Tue, 27 Jul 2021 12:06:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: remove section HISILICON STAGING DRIVERS
 FOR HIKEY 960/970
Message-ID: <20210727120632.2f963b4c@coco.lan>
In-Reply-To: <20210727093154.553-1-lukas.bulwahn@gmail.com>
References: <20210727093154.553-1-lukas.bulwahn@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Em Tue, 27 Jul 2021 11:31:54 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> escreveu:

> Commit 9bd9e0de1cf5 ("mfd: hi6421-spmi-pmic: move driver from staging")
> moves the last driver out of ./drivers/staging/hikey9xx/ and removes that
> directory, but missed to adjust the HISILICON STAGING DRIVERS FOR HIKEY
> 960/970 section in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/staging/hikey9xx/
> 
> As the directory ./drivers/staging/hikey9xx/ is gone, remove the section
> HISILICON STAGING DRIVERS FOR HIKEY 960/970 in MAINTAINERS as well.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210726
> 
> Mauro, please ack.
> 
> Greg, please pick this patch into your staging-next tree.

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


> 
>  MAINTAINERS | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f548b498eb0..2eb730101689 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8453,11 +8453,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
>  F:	drivers/mfd/hi6421-spmi-pmic.c
>  
> -HISILICON STAGING DRIVERS FOR HIKEY 960/970
> -M:	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> -S:	Maintained
> -F:	drivers/staging/hikey9xx/
> -
>  HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
>  M:	Zaibo Xu <xuzaibo@huawei.com>
>  S:	Maintained



Thanks,
Mauro
