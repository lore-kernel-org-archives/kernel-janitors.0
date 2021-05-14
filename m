Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA4CC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 18:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C0176144B
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 18:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhENSgr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 May 2021 14:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhENSgr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 May 2021 14:36:47 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 652A8C061574
        for <kernel-janitors@vger.kernel.org>; Fri, 14 May 2021 11:35:35 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9C68F2224B;
        Fri, 14 May 2021 20:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621017331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=riT+Nq4J1hu8+qyaKDSrJBVE67oxWgNH7ZvD4d985ck=;
        b=O/U1tdww2I83EyZeJOZ+8G3qKDKFtGRh2Xjg72z0s4w8WIaxya1r5BpEyt/W7VTb4F2Ku6
        M3Mz//SSvneCcff0dEXJ5qNgWu6+4VJR1ur4hGKKL5jADOObyIRvWUkQ8wx+PQHSiscS8B
        YA8CgaeNUipNhg+GFgfs92nKjhsDznQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 14 May 2021 20:35:31 +0200
From:   Michael Walle <michael@walle.cc>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
In-Reply-To: <YJ6Iw3iNvGycAWV6@mwanda>
References: <YJ6Iw3iNvGycAWV6@mwanda>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <23f1c1a4cf741a40e63420ff9aedff9b@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Am 2021-05-14 16:27, schrieb Dan Carpenter:
> If kmalloc() fails then it could lead to a NULL dereference.  Check and
> return -ENOMEM on error.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, were was my head..

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
