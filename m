Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBB3C433E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 04:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9940964E07
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 04:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCOE1Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 00:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229596AbhCOE1P (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 00:27:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 729C364E07;
        Mon, 15 Mar 2021 04:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615782435;
        bh=YxVCih2+45kiqJm7Jk94vb6LRaHawHoeKIg+0blEzps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rLSpmBc40D3RAzbVTB3vSf9Fq8BJWf7nQpaxC7w3fPH+R/rPJMCNchWZESpumPaN3
         oJTw05OoAAv1Xlg3jI6Y77qxIcOOjpXnaIAblhxJM64YJHVWgGfFEx4Ksqi117INxU
         SqS+TOTiyqCQwLCGz433pfyVPPpFaJDFmNuOoaxhlCuBQDCQCCdn+FeJWFKljAP0qZ
         shWalICwmkzzOVOL8ZdVjAiBV0Ws9LqoqJsgVGYKiMs6YVPvPbqWFgulARhJoqyIQW
         EijwMLqF64KpdpFsox8o6ONAGgGum5waUZK4ltMnCvurlueM3C+pYg32M37dK0BB+G
         0i9RgoqROwi/w==
Date:   Mon, 15 Mar 2021 09:57:07 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bus: mhi: core: remove redundant initialization of
 variables state and ee
Message-ID: <20210315042707.GB81300@thinkpad>
References: <20210311111727.8433-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311111727.8433-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 11, 2021 at 11:17:27AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variables state and ee are being initialized with values that
> are never read and are being updated later with a new values. The
> initializations are redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2c61dfd01353..3faf8bade520 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -428,9 +428,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  {
>  	struct mhi_controller *mhi_cntrl = priv;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	enum mhi_state state = MHI_STATE_MAX;
> +	enum mhi_state state;
>  	enum mhi_pm_state pm_state = 0;
> -	enum mhi_ee_type ee = MHI_EE_MAX;
> +	enum mhi_ee_type ee;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> -- 
> 2.30.2
> 
