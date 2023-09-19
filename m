Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75261CE79AA
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Sep 2023 21:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233305AbjISVEc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Sep 2023 17:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233279AbjISVEc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Sep 2023 17:04:32 -0400
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 14:04:26 PDT
Received: from out-220.mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4B0BF
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Sep 2023 14:04:26 -0700 (PDT)
Date:   Tue, 19 Sep 2023 17:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695157464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mzWr7EVmN4tDjOE1uL/TSpQK0uyq5+aVuZpTN625Z5A=;
        b=p0gcWpoD5Qu69ldaxuxgWgNe+LUCRIp92Qp3Y5bNnye9mgN42w6n84nWVpFrqf5jWoOI7+
        CljbO+8eDEdHb+VT9WdmT5uB8X4TnNxS+mjw59vSf72R99PlDkfaQ1GDoF+kqi/j/vFW+o
        CQXmrpEoBxSBsYszRVM2LvQQdqEZlek=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Kent Overstreet <kent.overstreet@gmail.com>,
        linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bcachefs:  fs-ioctl: Fix copy_to_user() error code
Message-ID: <20230919210421.x436kmas4jjbfdyg@moria.home.lan>
References: <90f0388a-ea0d-47d3-bbbd-efb38fd96d2c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f0388a-ea0d-47d3-bbbd-efb38fd96d2c@moroto.mountain>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Sep 15, 2023 at 03:55:23PM +0300, Dan Carpenter wrote:
> The copy_to_user() function returns the number of bytes that it wasn't
> able to copy but we want to return -EFAULT to the user.
> 
> Fixes: e0750d947352 ("bcachefs: Initial commit")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, applied
