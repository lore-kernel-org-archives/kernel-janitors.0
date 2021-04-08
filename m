Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4E8C43460
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 09:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6481A61181
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Apr 2021 09:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDHJTO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Apr 2021 05:19:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhDHJTO (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Apr 2021 05:19:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCE6361155;
        Thu,  8 Apr 2021 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617873543;
        bh=xbBjbqAHb7quxhrHR7tJJLA5bJlS1olJOxvI3sQgoC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n0dbHh762grKynzDj/6idh9Mno0hQ5RH/oFRWoMLXx1kxOpOPXP+NTKylm/J6oeYr
         PK8Aev84igJNzEvhhHx3D0/Dui3AutaFSRHz2MDeBWFQy1bGMvDei1XSVs2caMDa31
         Tiv6Yha9hYE9RUYW/4YgxOFJrZipvFNodkOM8fb4=
Date:   Thu, 8 Apr 2021 11:19:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Ye Bin <yebin10@huawei.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
Message-ID: <YG7KhTDZyR8U0yNY@kroah.com>
References: <20210408085033.909377-1-yebin10@huawei.com>
 <bf976317-2bf5-d019-bf7b-4a4ead0b1c94@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf976317-2bf5-d019-bf7b-4a4ead0b1c94@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 08, 2021 at 04:57:11PM +0800, YueHaibing wrote:
> 
> 这种bugfix最好加下Fixes tag

I am sorry but I can not parse that :(
