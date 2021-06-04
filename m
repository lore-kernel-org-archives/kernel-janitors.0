Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF8BC47082
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 01:44:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14AB761402
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Jun 2021 01:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFDBq1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Jun 2021 21:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFDBq0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Jun 2021 21:46:26 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA67C06174A;
        Thu,  3 Jun 2021 18:44:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fx5D56k9rz9sRN;
        Fri,  4 Jun 2021 11:44:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
        t=1622771078; bh=50EfJBKU4bDP6I7XQlD6MYVj4+vj2dewObOhR7914Hc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=TXlPT6/gCsrrWKtg+AgmkQAsYIWLbvR1rXPJaOqHtLIUvxF2XbpgDXYFVDIz0KL5u
         dAOuYCEW98Pddbsp5VIzhpLztLwLuNiqU82nnPq/1uUab8LQ2CGaUpZQIkHnsrj/GJ
         CUYeyGz48DdxGycblLBWNMKzeNUtP9lhFdMnja+HEyK/tyjOKjFtOqRiq7Dwh0zOoT
         KhqTjgk5s+63gX65a7VQlSeB5g3C7GYgwS2Tcny2wIj2oPRbF8t7gCnlfshtJDJIDp
         9HRpH2VuICH5Kr5VJLfMYdVy3VlI898o9Mab1T/IuP08bfkw5TOADOQIf+zJ26xieQ
         MBPDnG5TaJB8A==
Message-ID: <bc45bf20461fda09e7b224465285f1385cdab09b.camel@ozlabs.org>
Subject: Re: [PATCH] fsi: core: Fix return of error values on failures
From:   Jeremy Kerr <jk@ozlabs.org>
To:     Colin King <colin.king@canonical.com>,
        Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-fsi@lists.ozlabs.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 04 Jun 2021 09:44:33 +0800
In-Reply-To: <20210603122812.83587-1-colin.king@canonical.com>
References: <20210603122812.83587-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,
> Currently the cfam_read and cfam_write functions return the provided
> number of bytes given in the count parameter and not the error return
> code in variable rc, hence all failures of read/writes are being
> silently ignored. Fix this by returning the error code in rc.

Looks good to me, thanks for the fix.

Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

