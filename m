Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA278E936FB
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 11:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbjJFLQe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 07:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjJFLQc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 07:16:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120FFC5
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 04:16:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684E9C43397;
        Fri,  6 Oct 2023 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696590991;
        bh=/9ry5KltDfiR7VrvMhHB0ZYHyVGwugubCOANKdLFAf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6tGswAjsXMdB6tRqQ2T0pnrSjTOgtO5Jhu8lFi6WFuMYQfgghdZjv7iBzYcstWWx
         btkRhHPzjKM8my2Waw0lXE3MN7xHnTzI7lt8BAlwpIbgpLUT2Lp3LqeBX8YEkPm2jy
         d8XeBihAfvwjQDJ7jbgBqbOYeUcH6Ng1keExewCTitN/Og0RKyI13c3FQKXw0Uc5Vi
         +3fH5fhxKfLqdFce9pmy64pfz3dniuX3TQ4le5qR6j4wPD6NcDO5j8eUDNCOPXuDb0
         BYbth7IhYR1MXprOPdyIF9hEcLmQWePVuBTtNC4q+7nxAPMN9DPxTK1xZpvNfuPt1/
         7H7mHHA67/U1g==
Date:   Fri, 6 Oct 2023 13:16:27 +0200
From:   Simon Horman <horms@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Greg Rose <gregory.v.rose@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] ixgbe: fix crash with empty VF macvlan list
Message-ID: <ZR/si/di5IbSB9Gq@kernel.org>
References: <3cee09b8-4c49-4a39-b889-75c0798dfe1c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cee09b8-4c49-4a39-b889-75c0798dfe1c@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2023 at 04:57:02PM +0300, Dan Carpenter wrote:
> The adapter->vf_mvs.l list needs to be initialized even if the list is
> empty.  Otherwise it will lead to crashes.
> 
> Fixes: c6bda30a06d9 ("ixgbe: Reconfigure SR-IOV Init")

Hi Dan,

I see that the patch cited above added the line you are changing.
But it also seems to me that patch was moving it from elsewhere.

Perhaps I am mistaken, but I wonder if this is a better tag.

Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> index a703ba975205..9cfdfa8a4355 100644
> --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> @@ -28,6 +28,9 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
>  	struct vf_macvlans *mv_list;
>  	int num_vf_macvlans, i;
>  
> +	/* Initialize list of VF macvlans */
> +	INIT_LIST_HEAD(&adapter->vf_mvs.l);
> +
>  	num_vf_macvlans = hw->mac.num_rar_entries -
>  			  (IXGBE_MAX_PF_MACVLANS + 1 + num_vfs);
>  	if (!num_vf_macvlans)
> @@ -36,8 +39,6 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
>  	mv_list = kcalloc(num_vf_macvlans, sizeof(struct vf_macvlans),
>  			  GFP_KERNEL);
>  	if (mv_list) {

I'm not sure it it is worth it, but perhaps more conventional error
handling could be used here:

	if (!mv_list)
		return;

	for (i = 0; i < num_vf_macvlans; i++) {
		...

> -		/* Initialize list of VF macvlans */
> -		INIT_LIST_HEAD(&adapter->vf_mvs.l);
>  		for (i = 0; i < num_vf_macvlans; i++) {
>  			mv_list[i].vf = -1;
>  			mv_list[i].free = true;
> -- 
> 2.39.2
> 
> 
