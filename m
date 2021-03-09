Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BB5C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 17:04:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF3164F4B
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 17:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhCIRE1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Mar 2021 12:04:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:53502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230173AbhCIRD6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Mar 2021 12:03:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73F4C64EEE;
        Tue,  9 Mar 2021 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615309438;
        bh=wrj77/STvOG+oBQn4sot6y/R2bYTYVFS+DWfzuusjKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cRxie/sU+VHtcVIHxiJeC/EukbxFgUHzzRnuSO/cIZyOCsG6Fj1vLwj6Ac6wNguI9
         S61Sx4iPlFBZQU5i8pQGBPxEQkQON4Xo8gHiDj9wke7meH6J4/eDW/Bbedq14PKDaW
         rINQrguB/6BX7gisRbVhqVgOTu4k/avQVV+evMB8=
Date:   Tue, 9 Mar 2021 18:03:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Walter Harms <wharms@bfs.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        John Joseph <jnjoseph@google.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Simon Que <sque@chromium.org>, Richard Yeh <rcy@google.com>,
        Rob Springer <rspringer@google.com>,
        Todd Poynor <toddpoynor@google.com>
Subject: Re: [PATCH] staging: gasket: Fix sizeof() in gasket_handle_ioctl()
Message-ID: <YEeqe9od5lMxEauv@kroah.com>
References: <YAroue0qiuf35rkS@mwanda>
 <YEd3n/vbIzRr5vnA@kroah.com>
 <8fda6445b7944426a45a944b777c52fe@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fda6445b7944426a45a944b777c52fe@bfs.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 09, 2021 at 04:57:59PM +0000, Walter Harms wrote:
> why not mark it as "Deprecated" and remove it with the next version ? Maybe soneone will wakeup ?

We don't really have a "Deprecated" marking, we just delete them :)

thanks,

greg k-h
