Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5A8C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 11:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1708B613F7
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 11:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhEML1r (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 07:27:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232340AbhEML1l (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 07:27:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BD71613DE;
        Thu, 13 May 2021 11:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620905190;
        bh=eXSAetXGIYK5LnUNOnxaqqmbAirQeIHFyQvJIrjRgRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yWCKSgOoKhNC2z+tE0cB2g0gLWejzEQKbWtzsAfkIMOUfUxZFLPqT2MDVCVdEVyBb
         Q5Cf16R02c7tz92SIgd+t+5SmtcRB6kaJwmyoZSNuSzMqNpvsgXnP+A2x1cmQCcIhn
         LHfdx9pHG4ul35SzCczpUGZMS3nd2JgJRSKqMjI4=
Date:   Thu, 13 May 2021 13:26:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ruiqi Gong <gongruiqi1@huawei.com>
Cc:     Wang Weiyang <wangweiyang2@huawei.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] drivers/base/node.c: make CACHE_ATTR define static
 DEVICE_ATTR_RO
Message-ID: <YJ0M5HcXIQQFOTEq@kroah.com>
References: <20210513110716.25791-1-gongruiqi1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513110716.25791-1-gongruiqi1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 13, 2021 at 07:07:16PM +0800, Ruiqi Gong wrote:
> The Sparse tool reports as follows:
> 
> drivers/base/node.c:239:1: warning:
>  symbol 'dev_attr_line_size' was not declared. Should it be static?
> drivers/base/node.c:240:1: warning:
>  symbol 'dev_attr_indexing' was not declared. Should it be static?
> 
> These symbols (and several others) are defined by DEVICE_ATTR_RO(name) in
> CACHE_ATTR(name, fmt), and all of them are not used outside of node.c. So let's
> mark DEVICE_ATTR_RO(name) static to solve these complains from Sparse.

Why not fix them all at once?  Why only one here?

thanks,

greg k-h
