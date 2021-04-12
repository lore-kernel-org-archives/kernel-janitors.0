Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F40EC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 08:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F3C1611F0
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 08:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237333AbhDLIa7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 04:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:59860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237019AbhDLIa6 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 04:30:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11FC6611AD;
        Mon, 12 Apr 2021 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618216237;
        bh=4GKel3929+VgmWgd13Qpjj/iH8WtICMfCDLgtBw8Sr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y9fnte6DvoFE2HV/nGIf5XZn4t4Bn68xhwpWAEK//XfZ8GrcooyJf3BjC1Ex/CGrb
         /zZHBYSM3B+sdEckjKKRzLhIrpDcw0i+uCIkaMo47Ka+Nf+nsTFY1UHfRbHVYSFhX9
         0Ue6RclukOiFlzx8JJrGz8X5oXUVUQD7THLT0yeU=
Date:   Mon, 12 Apr 2021 10:30:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yebin <yebin10@huawei.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com
Subject: Re: [PATCH -next v2] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
Message-ID: <YHQFK1IK/yoSBuVM@kroah.com>
References: <20210408112305.1022247-1-yebin10@huawei.com>
 <YHBe9m7wGqlZ2cp+@kroah.com>
 <6073EFF3.90506@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6073EFF3.90506@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 12, 2021 at 03:00:03PM +0800, yebin wrote:
> Sorry. I build kernel  image  with  follow config and  commit  base on
> linux-next:
> commit：e99d8a849517
> config:  make allmodconfig
> I can build kernel image without errors. So, what build error did you
> encounter?

Ah, I missed that this was only in my usb-linus branch, which is now in
Linus's tree, so I can take this, sorry for the noise...

greg k-h
