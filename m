Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7270EEAA6E
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Sep 2023 19:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjINT6Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Sep 2023 15:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjINT6Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Sep 2023 15:58:25 -0400
Received: from out-224.mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B9826B8
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Sep 2023 12:58:20 -0700 (PDT)
Date:   Thu, 14 Sep 2023 15:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1694721499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cMYkJu+KocFqvcljDF1KPeCHEI57snC+fJaLw5pl1C0=;
        b=thvAad2tn6CbzmmnVuHuccjT9ZpUsi9+wak05U2kViSasK7a+L3hxKgcUznxd/qv4pckMd
        2oRF/5p7GYJZCUhZz3Sxo779Y7PHlGegz51UIH6zKsMrcUgGPvs3NSgOqZO9p4P5EEN4vw
        OsLz/rFqxfijadEYKbPzkv/fRWLsghY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bcachefs: fix error checking in bch2_fs_alloc()
Message-ID: <20230914195817.fmpwy7yafwm2tgv4@moria.home.lan>
References: <a0032f97-333a-41ec-97b0-62f0b6135d54@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0032f97-333a-41ec-97b0-62f0b6135d54@moroto.mountain>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 14, 2023 at 12:47:44PM +0300, Dan Carpenter wrote:
> There is a typo here where it uses ";" instead of "?:".  The result is
> that bch2_fs_fs_io_direct_init() is called unconditionally and the errors
> from it are not checked.

Thanks, applied
