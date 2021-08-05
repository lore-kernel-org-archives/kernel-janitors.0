Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C3C4338F
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 10:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB8A610CC
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 10:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240596AbhHEK5q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Aug 2021 06:57:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:50174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240080AbhHEK5p (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Aug 2021 06:57:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06A4661102;
        Thu,  5 Aug 2021 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628161051;
        bh=5YItBmORmqphWcywSRK6VChbqHUwt7vQFPJnhLyl8Y4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E5yzwbx+98vYtasf88y60sQWHM2ZDNiNNIavxsI3WFkorHqLMy5BpF6paPcbMx/Me
         QfXSzAdfzwu2usYGyjDR8eCUI1vgjwjn4SdWu5mcsvpb6hU6Q7308kqYIOsokeFdIS
         GuDjsfM4mppculWROj1t7B49ROCy+znJVq+hyWlo=
Date:   Thu, 5 Aug 2021 12:57:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Marco Cesati <marcocesati@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: r8188eu: Fix spelling mistakes and typos
Message-ID: <YQvEGYIufwoPKHfS@kroah.com>
References: <20210803104410.337982-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803104410.337982-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Aug 03, 2021 at 11:44:10AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are quire a few spelling mistakes and typos in the driver
> in comments, literal strings and function names. Fix these.
> 
> Note that this just corrects spelling mistakes and does not
> clean up any existing checkpatch warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Does not apply to my tree right now, and if I try to take just parts of
it, it blows up the build.

Can you please break this up into a patch series?  You are doing a lot
of different things all in one patch (functions, strings, comments) and
it makes it hard to review, and apply.

thanks,

greg k-h
