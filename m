Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1DDC0015E
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 09:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjFWJjP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 05:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjFWJjN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 05:39:13 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B190BC;
        Fri, 23 Jun 2023 02:39:11 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 3C9DE1F390;
        Fri, 23 Jun 2023 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1687513150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=72hbvKej1iXoVScVh7pfvmvxDYNuBXrKbZOOD3LpqvM=;
        b=BUFHwB9m4AvYTKbcwVSYeNGVx2dHZGDCOEZu9463i+fjqB3WE9eQW4++gKxIhVi6CT2uk7
        CwagT2aVubyAVyXUaOe/RgErIU5juCWmuLHiQMM21ZN123QRrInYPoqRd+laE3gUNMyQ6r
        /VUJHHdszYjktsEstnSOh1FaEpPw8rA=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 09C982C141;
        Fri, 23 Jun 2023 09:39:09 +0000 (UTC)
Date:   Fri, 23 Jun 2023 11:39:06 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog/hardlockup: fix typo in config
 HARDLOCKUP_DETECTOR_PREFER_BUDDY
Message-ID: <ZJVoOm7NXG8OjQwV@alley>
References: <20230623040717.8645-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623040717.8645-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri 2023-06-23 06:07:17, Lukas Bulwahn wrote:
> Commit a5fcc2367e22 ("watchdog/hardlockup: make HAVE_NMI_WATCHDOG
> sparc64-specific") accidentially introduces a typo in one of the config
> dependencies of HARDLOCKUP_DETECTOR_PREFER_BUDDY.
> 
> Fix this accidental typo.
> 
> Fixes: a5fcc2367e22 ("watchdog/hardlockup: make HAVE_NMI_WATCHDOG sparc64-specific")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks for catching this!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
