Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11911C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 01:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA5A2613AA
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 01:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237958AbhEUB6i (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 21:58:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:38842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237361AbhEUB6h (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 21:58:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D6B61363;
        Fri, 21 May 2021 01:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621562235;
        bh=Y4sLWiCzmZggrB+DEXmTmjrF0Kc7khKDtRYj72Uoeqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bT7QhuofxtHbsF5GzqdcOeUo7Ce9mBCbXSyj24ijq9OMyTHIVBSSRNZAShFQxCGYf
         qz22D7ADPC+AxZhB4zbHZqZLUq95Fl4xNrLiDaQFJE5lmuSr6LsqpTlM1FhH9c5Agt
         /0bGAaxfgBn8oS/eksHmJgAiabwDAhfo2scRNdbzy7k6ZEaS4PISO+jc5FmtkbZRdD
         BYzDXWcMMh0Mdt2EsVLQzZB+9PL6cEyJoPDlbGKvsvRudrOkWauNg8xa5ZoUYs//f+
         TwN5Pu2LpR66EGKm539QBCvpG6SG8h3inFC7h7KTktoRY6MVS4HI5ng1xSp3/nVCsI
         /vsDuOFvc8RLw==
Date:   Fri, 21 May 2021 09:57:01 +0800
From:   Gao Xiang <xiang@kernel.org>
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Gao Xiang <xiang@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>, linux-erofs@lists.ozlabs.org
Subject: Re: [PATCH -next] erofs: fix error return code in
 erofs_read_superblock()
Message-ID: <20210521015700.GA5725@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20210519141657.3062715-1-weiyongjun1@huawei.com>
 <20210520053226.GB1955@kadam>
 <20210520084023.GA5720@hsiangkao-HP-ZHAN-66-Pro-G1>
 <9f96b12f-b05b-c118-4391-448f780702ff@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f96b12f-b05b-c118-4391-448f780702ff@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 21, 2021 at 09:14:58AM +0800, Chao Yu wrote:
> On 2021/5/20 16:40, Gao Xiang wrote:
> > Hi Yongjun and Dan,
> > 
> > On Thu, May 20, 2021 at 08:32:26AM +0300, Dan Carpenter wrote:
> > > On Wed, May 19, 2021 at 02:16:57PM +0000, Wei Yongjun wrote:
> > > > 'ret' will be overwritten to 0 if erofs_sb_has_sb_chksum() return true,
> > > > thus 0 will return in some error handling cases. Fix to return negative
> > > > error code -EINVAL instead of 0.
> > > > 
> > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > 
> > > You need to add Fixes tags to bug fix patches and you need to ensure
> > > that the authors of the Fixes commit are CC'd so they can review your
> > > fix.  get_maintainer.pl will add the author automatically, but normally
> > > I like to put them in the To header to make sure they see it.
> > > 
> > > Fixes: b858a4844cfb ("erofs: support superblock checksum")
> > 
> > The commit and the tag look good to me (sorry for a bit delay on this),
> > 
> > Fixes: b858a4844cfb ("erofs: support superblock checksum")
> > Cc: stable <stable@vger.kernel.org> # 5.5+
> > Reviewed-by: Gao Xiang <xiang@kernel.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks Chao, will add soon. :)

> 
> Thanks,
> 
> > 
> > (will apply to dev-test for a while and then to -next.)
> > 
> > Thanks,
> > Gao Xiang
> > 
> > .
> > 
