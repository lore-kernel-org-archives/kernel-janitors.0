Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AF5C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 12:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE1A86023D
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 12:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbhEUMVd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 May 2021 08:21:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:53194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232009AbhEUMVa (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 08:21:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F0EC61132;
        Fri, 21 May 2021 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621599607;
        bh=/RhEbe/nsOgLC7YrjB+J/krqEGphJxg1gyZM4ZuhW1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R6Mj/6imEN3tFW7PW0PKWD9ZsQvIXDpHX7RptZMZ3v2ABSMGIrelRYHlB2mk1s5Mm
         q1tT3xH3Y5WnsIR++BscWISmxqyYk3ByVvYk7tpfs8ChTaoZrRU5i1Wq3rbiu1do6D
         H5DlnP4xLjYDP6i58sIeMjJVPFxDy0gooIcNRJkfV7oCYl2iLaExXKE7igRRjsGHRb
         iLIilv5wEoJ1OaPQNWwf0PVIYkEOKOz3jtBR6glMBaaQ/bd/JXzX2e3YhrBM2jTcyO
         XtYyWHYCfrK43okID1a7ULqlSqtLmYbqv2zZUEUOJQjUrHaj52LnLpLVEu3Cohrc/T
         yUl1xZKIKTcTw==
Date:   Fri, 21 May 2021 17:49:58 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
Message-ID: <20210521121958.GC70095@thinkpad>
References: <20210413160318.2003699-1-weiyongjun1@huawei.com>
 <20210521121744.GB70095@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521121744.GB70095@thinkpad>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 21, 2021 at 05:47:44PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 13, 2021 at 04:03:18PM +0000, Wei Yongjun wrote:
> > This driver's remove path calls del_timer(). However, that function
> > does not wait until the timer handler finishes. This means that the
> > timer handler may still be running after the driver's remove function
> > has finished, which would result in a use-after-free.
> > 
> > Fix by calling del_timer_sync(), which makes sure the timer handler
> > has finished, and unable to re-schedule itself.
> > 
> > Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Loic, could you please review this patch as well?
> 

Nvm, Loic did review the patch.

Thanks,
Mani

> Thanks,
> Mani
> 
> > ---
> >  drivers/bus/mhi/pci_generic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 7c810f02a2ef..5b19e877d17a 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -708,7 +708,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> >  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> >  
> > -	del_timer(&mhi_pdev->health_check_timer);
> > +	del_timer_sync(&mhi_pdev->health_check_timer);
> >  	cancel_work_sync(&mhi_pdev->recovery_work);
> >  
> >  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> > 
