Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556C4C00140
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Aug 2022 14:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbiHLOQP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Aug 2022 10:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbiHLOQN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Aug 2022 10:16:13 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914D36E887
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Aug 2022 07:16:12 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id b7so700033qvq.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Aug 2022 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=5iPqAfoRqp5oAaE2cpTx+pD0aqojCmJ/R3i8Xb9ioEc=;
        b=wwkN9qmtdWjmMLF7v96gLIMpOGhnj7vFp9ztCunVDnVsOo8/TPH3mTD3KbYPC6cOb3
         nvZLPjb0OSWWeUNFqhy+3uuuSZR/khP5KqiXHvUaoHwApTfEPeFkmsRPf/UJc2CYhrfs
         NITgPt39CV1+XA1XKsO8kWXoNdThNh1ZUB9iInnMAaJkUVJlcHaOVLniJ5lW2wvdWwTZ
         FjX8V82QGoNDiNjeoW+BTZf4bbEJBQUHMRACy2qEf21R7hdP2u+8joFk4i45x9n4VsJd
         yrQ+6PeIxRfhrVSvyYVdtcHknnuSD9Oc95aLnlmF59pLiIuFsFpsigI7Ph/YSO4RhJCp
         F/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=5iPqAfoRqp5oAaE2cpTx+pD0aqojCmJ/R3i8Xb9ioEc=;
        b=AsUVFiuBOfMfutcBaFL8panV6zx1uWwuOfeQG456vY8aXpQaBC1IxFYCyC+fqy0HHF
         wqrvS3DaadSNU9lMHbvtKNLGdReVKi8eeLgD25CzJkjXovJaIW7/FOWg3KPBMfiuh3fd
         I6MY7RetEFzzJp0Jg8GV2W+wD37rrSkhixDy1Ec7CiVQ6vcjXUdIn/Ns1brckVY6DPL6
         7dDn2FPm7snqsLHG2DR5y2ORE680pVzl40aZwgWLkhDO9erEw0/tRDb8/CcydxqSRDQw
         wF+L2QZ4LXgQmD5UUEU1RV/1McE/QnU6gg8SWyCwfBQVvWDI431u3gNyfx+BfXITGlzp
         0W0Q==
X-Gm-Message-State: ACgBeo3NXnzA3pypQgs7X3MhOpK/tFORSxBh73TRxsAXhBwmLkHKxVte
        Pj+vArvMb1kVp+gOhXT4Y4gUe7X+uBAN7O0OBzI=
X-Google-Smtp-Source: AA6agR6vWpHbleJHYiOGdDgKcmRxx5rMTEcA6ymOP/9PVk3R2MY2CU/Iddu3fNJxFYZiy2hKUYOweg==
X-Received: by 2002:a05:6214:1a07:b0:474:6e80:e1e5 with SMTP id fh7-20020a0562141a0700b004746e80e1e5mr3685538qvb.41.1660313771702;
        Fri, 12 Aug 2022 07:16:11 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b006b9576cd060sm1740631qkm.21.2022.08.12.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 07:16:11 -0700 (PDT)
Date:   Fri, 12 Aug 2022 10:16:09 -0400
From:   Jon Mason <jdmason@kudzu.us>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Frank Li <Frank.Li@nxp.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
        linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] NTB: EPF: Fix error code in epf_ntb_bind()
Message-ID: <YvZgqRJtGdbzEXo3@kudzu.us>
References: <YuenvTPwQj022P13@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuenvTPwQj022P13@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Aug 01, 2022 at 01:15:25PM +0300, Dan Carpenter wrote:
> Return an error code if pci_register_driver() fails.  Don't return
> success.
> 
> Fixes: da51fd247424 ("NTB: EPF: support NTB transfer between PCI RC and EP connection")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pci/endpoint/functions/pci-epf-vntb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> index 111568089d45..cf338f3cf348 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
> @@ -1312,7 +1312,8 @@ static int epf_ntb_bind(struct pci_epf *epf)
>  
>  	epf_set_drvdata(epf, ntb);
>  
> -	if (pci_register_driver(&vntb_pci_driver)) {
> +	ret = pci_register_driver(&vntb_pci_driver);
> +	if (ret) {
>  		dev_err(dev, "failure register vntb pci driver\n");
>  		goto err_bar_alloc;
>  	}
> -- 
> 2.35.1
> 

Sorry for the delay in response.  This series is in my
ntb branch and will be in my pull request for v5.20 which should be
going out later today.

Thanks,
Jon
