Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75B4E81DF0
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 12:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjJFMtr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 08:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbjJFMtq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 08:49:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D878CA
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 05:49:44 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40535597f01so18622705e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Oct 2023 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696596582; x=1697201382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oHjBNst/lhil+UcE/qDI5coR6SVyilLvcP6sMcHytls=;
        b=AerCDRuezhOwH+X4RX6pC/yUdwS9mqzaDmw52jg11c8+LY2ymgKBsep2sXcM5rMMfY
         hO6PZsME6MzRHbrJrR4tfgjiV9vb01eNZJ5UBpZpEEBKSwtuzcCknMl3qxJyFKENZhN2
         OHWcE7li7dyfZuumlRHOoYaOvmB5Xgsswoc+Jnts06mTsqxoS/oUGG9J7ZsSs46Imeig
         3LwLB1rr5uscUfbn1c/YqEJoYFeNYGaIek6egfls9BWkixBSxOG8l6ucGBHczSWT3U+D
         BhGi+FdJ5OfxBnU4XluFomXgk82vggNYHJXRG1nTFzUuoSJmMC0p4JMf4EGqwPgij6yE
         TIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596582; x=1697201382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHjBNst/lhil+UcE/qDI5coR6SVyilLvcP6sMcHytls=;
        b=sXyJFa0Xg2nu5GSl5Is879+7nKwQFzwf79HkQJ3G+M7KANkNefgl0G1FyihjKdW3xK
         ju/KQiuf53zKYrW9My7kcfmQzAYCDLew0Qw5G3QjPqPLneibssLb9sDuQW6UwPykAxhG
         UQgZ/ToxkPTzWY5MRUmJWiGKmgNO2Voi2X/Dy+0bNhM3iaF3sFIa3ZHCjzZ+9O5lkmpa
         2hvvBQWtLQqYDIdZK2HhO1HMxFkz8EfsdaVXnHbxPVGEURhi92/IlF8CBwztn9rip0+K
         /4rbtXytlBCzfEhTSfmUvg6iu9brOuQl+sgz3lo/TFXXo4YWstX3jgbIpZp1gffqbmB9
         UqfQ==
X-Gm-Message-State: AOJu0YyGZsr2RPIP2jNuXjFlsMaAYFYP330oTwemJBfBlJerHOUajjHj
        XB5u4KKLRjLiKN+GOaoRvBf6Ew==
X-Google-Smtp-Source: AGHT+IErZT4Z9JOnQab8/UPM9P5VYK8b44c4GNP61Z9e5SRanKoOeNOUL0LBngvKhNZHSCtY36Ax5g==
X-Received: by 2002:adf:ecd2:0:b0:317:e1fb:d57b with SMTP id s18-20020adfecd2000000b00317e1fbd57bmr6910194wro.56.1696596582480;
        Fri, 06 Oct 2023 05:49:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v7-20020adfedc7000000b003197efd1e7bsm1563290wro.114.2023.10.06.05.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:49:41 -0700 (PDT)
Date:   Fri, 6 Oct 2023 15:49:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Simon Horman <horms@kernel.org>
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
Message-ID: <569ba96b-2bc3-45ea-b397-36e7ef88ed8f@kadam.mountain>
References: <3cee09b8-4c49-4a39-b889-75c0798dfe1c@moroto.mountain>
 <ZR/si/di5IbSB9Gq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR/si/di5IbSB9Gq@kernel.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 06, 2023 at 01:16:27PM +0200, Simon Horman wrote:
> On Thu, Oct 05, 2023 at 04:57:02PM +0300, Dan Carpenter wrote:
> > The adapter->vf_mvs.l list needs to be initialized even if the list is
> > empty.  Otherwise it will lead to crashes.
> > 
> > Fixes: c6bda30a06d9 ("ixgbe: Reconfigure SR-IOV Init")
> 
> Hi Dan,
> 
> I see that the patch cited above added the line you are changing.
> But it also seems to me that patch was moving it from elsewhere.
> 
> Perhaps I am mistaken, but I wonder if this is a better tag.
> 
> Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
> 

Yeah.  You're right.  I'll resend.


> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > index a703ba975205..9cfdfa8a4355 100644
> > --- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > +++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
> > @@ -28,6 +28,9 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
> >  	struct vf_macvlans *mv_list;
> >  	int num_vf_macvlans, i;
> >  
> > +	/* Initialize list of VF macvlans */
> > +	INIT_LIST_HEAD(&adapter->vf_mvs.l);
> > +
> >  	num_vf_macvlans = hw->mac.num_rar_entries -
> >  			  (IXGBE_MAX_PF_MACVLANS + 1 + num_vfs);
> >  	if (!num_vf_macvlans)
> > @@ -36,8 +39,6 @@ static inline void ixgbe_alloc_vf_macvlans(struct ixgbe_adapter *adapter,
> >  	mv_list = kcalloc(num_vf_macvlans, sizeof(struct vf_macvlans),
> >  			  GFP_KERNEL);
> >  	if (mv_list) {
> 
> I'm not sure it it is worth it, but perhaps more conventional error
> handling could be used here:
> 
> 	if (!mv_list)
> 		return;
> 
> 	for (i = 0; i < num_vf_macvlans; i++) {
> 		...

I mean error handling is always cleaner than success handling but it's
probably not worth cleaning up in old code.  I say it's not worth
cleaning up old code and yet I secretly reversed two if statements like
this yesterday.  :P
https://lore.kernel.org/all/d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain/
It really is nicer, yes.  But it just makes the patch too noisy.

regards,
dan carpenter

