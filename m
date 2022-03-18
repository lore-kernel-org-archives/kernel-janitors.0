Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFB8C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Mar 2022 16:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238831AbiCRQfE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Mar 2022 12:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238922AbiCRQez (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Mar 2022 12:34:55 -0400
Received: from smtp4.emailarray.com (smtp4.emailarray.com [65.39.216.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1A923193C
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Mar 2022 09:33:34 -0700 (PDT)
Received: (qmail 73806 invoked by uid 89); 18 Mar 2022 16:33:32 -0000
Received: from unknown (HELO localhost) (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuNQ==) (POLARISLOCAL)  
  by smtp4.emailarray.com with SMTP; 18 Mar 2022 16:33:32 -0000
Date:   Fri, 18 Mar 2022 09:33:31 -0700
From:   Jonathan Lemon <jonathan.lemon@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 net-next] ptp: ocp: use snprintf() in ptp_ocp_verify()
Message-ID: <20220318163331.yabbgis2u57vp3cu@bsd-mbp.dhcp.thefacebook.com>
References: <20220318074723.GA6617@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318074723.GA6617@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 18, 2022 at 10:47:23AM +0300, Dan Carpenter wrote:
> This code is fine, but it's easier to review if we use snprintf()
> instead of sprintf().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Jonathan Lemon <jonathan.lemon@gmail.com>
