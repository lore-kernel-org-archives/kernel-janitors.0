Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963B4C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 17:14:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244413AbiCGRPU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 12:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243677AbiCGRPN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 12:15:13 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Mar 2022 09:14:12 PST
Received: from smtp5.emailarray.com (smtp5.emailarray.com [65.39.216.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B228BE08
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 09:14:11 -0800 (PST)
Received: (qmail 35533 invoked by uid 89); 7 Mar 2022 17:07:31 -0000
Received: from unknown (HELO localhost) (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuNQ==) (POLARISLOCAL)  
  by smtp5.emailarray.com with SMTP; 7 Mar 2022 17:07:31 -0000
Date:   Mon, 7 Mar 2022 09:07:29 -0800
From:   Jonathan Lemon <jonathan.lemon@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Richard Cochran <richardcochran@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] ptp: ocp: off by in in ptp_ocp_tod_gnss_name()
Message-ID: <20220307170729.cd7ek7gtwem6phii@bsd-mbp.dhcp.thefacebook.com>
References: <20220307141318.GA18867@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307141318.GA18867@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 07, 2022 at 05:13:18PM +0300, Dan Carpenter wrote:
> The > ARRAY_SIZE() needs to be >= ARRAY_SIZE() to prevent an out of
> bounds access.
> 
> Fixes: 9f492c4cb235 ("ptp: ocp: add TOD debug information")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jonathan Lemon <jonathan.lemon@gmail.com>
