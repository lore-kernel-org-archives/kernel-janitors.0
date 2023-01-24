Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E114C38142
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Jan 2023 09:21:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbjAXJVZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Jan 2023 04:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbjAXJVG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Jan 2023 04:21:06 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C1D83BDA6;
        Tue, 24 Jan 2023 01:20:44 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D33FC14;
        Tue, 24 Jan 2023 01:21:08 -0800 (PST)
Received: from e120937-lin (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D536C3F64C;
        Tue, 24 Jan 2023 01:20:25 -0800 (PST)
Date:   Tue, 24 Jan 2023 09:20:23 +0000
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Clean up a return statement
Message-ID: <Y8+i14h0bfo3aOeb@e120937-lin>
References: <Y86im5M49p3ePGxj@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y86im5M49p3ePGxj@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 23, 2023 at 06:07:07PM +0300, Dan Carpenter wrote:
> The comments say "enabled" where "disabled" is intended.  Also it's
> cleaner to return zero explicitly instead of ret.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/firmware/arm_scmi/driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index d21c7eafd641..703f16ef3953 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2739,8 +2739,8 @@ static int scmi_probe(struct platform_device *pdev)
>  				if (ret)
>  					goto clear_dev_req_notifier;
>  
> -				/* Bail out anyway when coex enabled */
> -				return ret;
> +				/* Bail out anyway when coex disabled. */
> +				return 0;
>  			}
>  
>  			/* Coex enabled, carry on in any case. */
> -- 

Indeed.

Thanks,
Cristian
