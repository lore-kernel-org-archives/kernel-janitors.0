Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CB8C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Mar 2022 22:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349124AbiCOWZB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Mar 2022 18:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbiCOWZA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Mar 2022 18:25:00 -0400
X-Greylist: delayed 1379 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Mar 2022 15:23:47 PDT
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C669F33A06;
        Tue, 15 Mar 2022 15:23:47 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nUFDh-00Br3M-OO; Tue, 15 Mar 2022 22:00:45 +0000
Date:   Tue, 15 Mar 2022 22:00:45 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Benjamin LaHaise <bcrl@kvack.org>, linux-aio@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] aio: drop needless assignment in aio_read()
Message-ID: <YjEMjYtpFjyUvFPV@zeniv-ca.linux.org.uk>
References: <20220314154605.11498-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314154605.11498-1-lukas.bulwahn@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Mar 14, 2022 at 04:46:05PM +0100, Lukas Bulwahn wrote:
> Commit 84c4e1f89fef ("aio: simplify - and fix - fget/fput for io_submit()")
> refactored aio_read() and some error cases into early return, which made
> some intermediate assignment of the return variable needless.
> 
> Drop this needless assignment in aio_read().
> 
> No functional change. No change in resulting object code.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> I cc'ed Linus as he is the author of the referred commit, but I expect
> that this clean-up just goes the usual way to Al Viro and then in some
> git pull to Linus.

Applied...
