Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8B2C6FD1D
	for <kernel-janitors@archiver.kernel.org>; Sat,  1 Apr 2023 07:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbjDAHt5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 1 Apr 2023 03:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjDAHt4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 1 Apr 2023 03:49:56 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F891D2FA
        for <kernel-janitors@vger.kernel.org>; Sat,  1 Apr 2023 00:49:54 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id l37so14201057wms.2
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Apr 2023 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680335393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQmX2mGScAue83vyZ+9kwTFOh7dPyEoancWAtKJ7oI4=;
        b=Rr7V9UgoOhidBQezlE+jxr7wXOGStDfyaIeWP9n71WJ0LkcaHZlXZ1geay2TGYEZ9j
         5fxrF8olF6m95IrIAmJZl3okUN3joUR7Rctcb5hesTOdgkwIDiiqLEs4VcATW310qdvp
         mD+bnGqX1Hn1E2JAoD6tHAqXI9pq/msGN2J6W7IfCxuxrA8nuaS2GxnyOup2GIcDnXN0
         9ng8MSfLrLl4FxGhTWYKv/HhX1vuI34e+jojgHTuxOh19UCUpz3Wo0CbJWepYUXg5LU2
         G7bsG2N9gSN5GJrBjHlCj02aRLUexUWHPAC/yyEwS9JIK5MzZUZFh+EQ9kWzLnjBJejH
         jpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680335393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQmX2mGScAue83vyZ+9kwTFOh7dPyEoancWAtKJ7oI4=;
        b=J1dYDahJEm6Sz4N3IE8ZxPmVoIo9cdlPys0ecCN1SAMPh1uCSRdmXqebNwETB0LK8J
         tlt8gR4SnYtPxaiwPYJlhzAk46aILLegPaqHGu2O7fGsWHQ5/KDNUgHtJ/z3b+u8Om1a
         rHDTfsRb8wojgAQYn8ZxXevA7NOfIeWD0ULaE+kSYaKmJE8XvhwA22IT99CXwGEuDiRC
         shNDaCFzL1KB4fL72bm90HkHgu1cAtOiB9cnl4rdeJCFV8wCRaHvn7VewnOfTIOvp1Yi
         3UggsBthzB12uk3Ao4HHX4pzqt93smO3GryJ25AUcmrpQUAC7KP7Bkt925t5KpZi6w3o
         BhBg==
X-Gm-Message-State: AAQBX9dGSPHZ0wn7peI3K4NRoqURGuid05BdJjcTffIjesRnuK0nqvY1
        IHF/mm8ikEawCise8wrs3oUp7DGGZv4Y3A==
X-Google-Smtp-Source: AKy350Zp5+yqaQjdmx9ycHomeI50vMh6iRVByFss10btpzLl2MABzcEUUaFbM/Xt9LNZs6uJ118Ebg==
X-Received: by 2002:a1c:7714:0:b0:3ed:ea48:cd92 with SMTP id t20-20020a1c7714000000b003edea48cd92mr15766885wmi.15.1680335393191;
        Sat, 01 Apr 2023 00:49:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c450f00b003ef7795e5a3sm12533678wmo.20.2023.04.01.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 00:49:52 -0700 (PDT)
Date:   Sat, 1 Apr 2023 10:49:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Edward Cree <ecree.xilinx@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] sfc: add functions to insert encap matches into the
 MAE
Message-ID: <74d0a5a7-8806-4717-9fb4-71cc80092be4@kili.mountain>
References: <e7b69fbb-370d-4b3d-a2a0-3762700fd175@kili.mountain>
 <f155a6f7-0f8e-3c2b-0d0b-1822422f8d20@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f155a6f7-0f8e-3c2b-0d0b-1822422f8d20@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 31, 2023 at 11:35:42AM +0100, Edward Cree wrote:
> On 31/03/2023 07:54, Dan Carpenter wrote:
> > Hello Edward Cree,
> > 
> > The patch 2245eb0086d8: "sfc: add functions to insert encap matches
> > into the MAE" from Mar 27, 2023, leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/net/ethernet/sfc/mae.c:1002 efx_mae_register_encap_match()
> > 	warn: this cast is a no-op
> ...
> >     998         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_ETHER_TYPE_BE_MASK,
> >     999                                 ~(__be16)0);
> > 
> > But for these ones the u16 is type promoted to int and so ~0 is negative
> > one and will be sign extended.  The cast does nothing.
> > 
> >     1000         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE,
> >     1001                                 encap->udp_dport);
> > --> 1002         MCDI_STRUCT_SET_WORD_BE(match_crit, MAE_ENC_FIELD_PAIRS_ENC_L4_DPORT_BE_MASK,
> >     1003                                 ~(__be16)0);
> > 
> > Same.
> 
> The casts are there for Sparse reasons (endianness), rather than
>  particularly caring about the size (although that conveniently
>  documents to the reader the width of the MCDI field).
> We could instead use (__be16)~0 but I believe some versions of
>  sparse will warn on this (I forget the details).
> 
> To the compiler (i.e. outside of sparse) the cast is indeed a
>  no-op, but this is fine.  I would consider this Smatch warning
>  a false positive; lmk if you disagree.

Fair enough...  I didn't know that Sparse printed a warning for this.

regards,
dan carpenter


