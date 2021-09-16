Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2022C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 15:18:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D3516120D
	for <kernel-janitors@archiver.kernel.org>; Thu, 16 Sep 2021 15:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbhIPPTl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Sep 2021 11:19:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238480AbhIPPTg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Sep 2021 11:19:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E75736113E;
        Thu, 16 Sep 2021 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631805496;
        bh=LGSVPeIIHu+0pAw0uhNhoz/B5NdpvuMDpECy9qis4KY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dFakPqLvC3D1pNvvFIpWKqpSQDXYyBlejBIzGrawBiiTyk19x9j3OEl9OIxOIpNc8
         VvC16iUCfwXId/xTKZJ5n20tLRit0DpWSH090qv//ArN+olcTmiwf55Zh4wncGfyy6
         3QcQ2e4dok1x71O4sefmBGmayirPlZsNQ6gVKWIEiLFqdbxhCCkTjLUTDJwo68AReV
         PitoG33KB7gdBWZJ+4SwUwSYcDyUtBupaC0mh8JXv25K9OHlwBL5KszAElCzbqOtl4
         DOhLQxPjNSssZl8Ok+wuUWYPllXm13Co2dbvo+kFtv6aeZnu1kbPxdzZYkN+Q9e7tf
         6+lo+LlueD9PQ==
Date:   Thu, 16 Sep 2021 08:18:15 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] qede: cleanup printing in qede_log_probe()
Message-ID: <20210916081815.25ec31ad@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210916135415.GH25094@kili>
References: <20210916135415.GH25094@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 16 Sep 2021 16:54:15 +0300 Dan Carpenter wrote:
> This code use strlen(buf) to find the number of characters printed.
> That's sort of ugly and unnecessary because we can just use the
> return from scnprintf() instead.
> 
> Also since strlen() does not count the NUL terminator, that means
> "QEDE_FW_VER_STR_SIZE - strlen(buf)" is never going to be zero so
> that condition can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/qlogic/qede/qede_main.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
> index 9837bdb89cd4..e188ff5277a5 100644
> --- a/drivers/net/ethernet/qlogic/qede/qede_main.c
> +++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
> @@ -1087,9 +1087,9 @@ static void qede_log_probe(struct qede_dev *edev)
>  {
>  	struct qed_dev_info *p_dev_info = &edev->dev_info.common;
>  	u8 buf[QEDE_FW_VER_STR_SIZE];
> -	size_t left_size;
> +	int off;
>  
> -	snprintf(buf, QEDE_FW_VER_STR_SIZE,
> +	off = scnprintf(buf, QEDE_FW_VER_STR_SIZE,
>  		 "Storm FW %d.%d.%d.%d, Management FW %d.%d.%d.%d",
>  		 p_dev_info->fw_major, p_dev_info->fw_minor, p_dev_info->fw_rev,
>  		 p_dev_info->fw_eng,

Why not adjust the continuation lines? checkpatch is not happy.
