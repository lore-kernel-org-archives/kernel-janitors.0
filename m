Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B92C43460
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 13:50:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05AA7613C5
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 13:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbhEMNwG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 09:52:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:57406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234240AbhEMNv4 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 09:51:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2029613C8;
        Thu, 13 May 2021 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620913846;
        bh=CEA3FRQtgAztdkKO3KsZGDizTo3tS40qy8xIl9x5pbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNfS/rZ0bk0a17LDgRG87v+2N5Xv39RBnKGdAR/l5SGXGb7YIaeE3XRGzi99Hg9vF
         0B3Nk2edw5woKPNwOoKlxkqiw1nOiox50+gn8uwhr3Ei1CQ7YRlcYzYJievKukdPaV
         DfkZMUMLy8n30ckSK5jGDCujPQNrwn/gW9hlcC3A=
Date:   Thu, 13 May 2021 15:50:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Gong Ruiqi <gongruiqi1@huawei.com>
Cc:     Wang Weiyang <wangweiyang2@huawei.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] drivers/base/node.c: make CACHE_ATTR define static
 DEVICE_ATTR_RO
Message-ID: <YJ0usxH4Li+fPRUf@kroah.com>
References: <20210513110716.25791-1-gongruiqi1@huawei.com>
 <YJ0M5HcXIQQFOTEq@kroah.com>
 <017d9fae-328f-e93f-095e-bdfa0cc2f2ff@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017d9fae-328f-e93f-095e-bdfa0cc2f2ff@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, May 13, 2021 at 09:22:44PM +0800, Gong Ruiqi wrote:
> 
> 
> On 2021/05/13 19:26, Greg Kroah-Hartman wrote:
> > On Thu, May 13, 2021 at 07:07:16PM +0800, Ruiqi Gong wrote:
> > > The Sparse tool reports as follows:
> > > 
> > > drivers/base/node.c:239:1: warning:
> > >   symbol 'dev_attr_line_size' was not declared. Should it be static?
> > > drivers/base/node.c:240:1: warning:
> > >   symbol 'dev_attr_indexing' was not declared. Should it be static?
> > > 
> > > These symbols (and several others) are defined by DEVICE_ATTR_RO(name) in
> > > CACHE_ATTR(name, fmt), and all of them are not used outside of node.c. So let's
> > > mark DEVICE_ATTR_RO(name) static to solve these complains from Sparse.
> > 
> > Why not fix them all at once?  Why only one here?
> 
> Sorry for not making it clear enough. Actually the patch does fix them all.
> Those symbols reported by Sparse are generated when two of the following
> macros are expanded:
> 
>     CACHE_ATTR(size, "%llu")
>     CACHE_ATTR(line_size, "%u")
>     CACHE_ATTR(indexing, "%u")
>     CACHE_ATTR(write_policy, "%u")
> 
> So one fix of the CACHE_ATTR's definition fixs them all.

Ok, can you please rewrite the changelog text to make it more clear?

thanks,

greg k-h
