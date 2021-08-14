Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D73C4338F
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D7E960E9B
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 14:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhHNO7t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:59:49 -0400
Received: from zeniv-ca.linux.org.uk ([142.44.231.140]:36994 "EHLO
        zeniv-ca.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbhHNO7t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Aug 2021 10:59:49 -0400
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mEv5u-00BilX-4v; Sat, 14 Aug 2021 14:57:06 +0000
Date:   Sat, 14 Aug 2021 14:57:06 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] checkpatch: prefer = {} initializations to = {0}
Message-ID: <YRfZwrJUutB4IO+G@zeniv-ca.linux.org.uk>
References: <20210805104353.GD26417@kili>
 <1b94e688-a070-998a-3014-96bcbaed4cae@wanadoo.fr>
 <YRfVYxQ126AOuexl@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRfVYxQ126AOuexl@unreal>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Aug 14, 2021 at 05:38:27PM +0300, Leon Romanovsky wrote:

> There are number of reasons why you didn't notice any difference.
> 1. {} is GCC extension
> 2. {} was adopted in latest C standards, so need to check which one GCC 10
> is using by default.
> 3. Main difference will be in padding - {0} will set to zero fields but
> won't touch padding, while {} will zero everything.

References on (3), please?
