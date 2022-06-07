Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CC0C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 09:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbiFGJzu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240182AbiFGJzg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 05:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9F96CDFD0D
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654595734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n7hfgQiB1fvAohjSL+LX1HTZTS0xE+mT9eAbQ5SA/1g=;
        b=MihyX/iSOfdBU8KnYBBvw+f/By5mDk2JeGv4aWjTkaNkri/TqZddndcrYhMyiu2+LJrXE6
        gxrnnIr5Oaecf1yxFEhFF4D+0ecM8t5cWGZafMi/pLJKOVUSBz2iuM9iipFK2Dbl7xBpUO
        dWX4A6KCVh01KaYKMTBD29iaOi0QCCc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-j0fW7vTLMnqDtREkwSnRog-1; Tue, 07 Jun 2022 05:55:33 -0400
X-MC-Unique: j0fW7vTLMnqDtREkwSnRog-1
Received: by mail-wr1-f71.google.com with SMTP id r13-20020adff10d000000b002160e9d64f8so2226621wro.0
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jun 2022 02:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n7hfgQiB1fvAohjSL+LX1HTZTS0xE+mT9eAbQ5SA/1g=;
        b=00pTMlrnP0edQiSUo4sdl9AAcD0AYcSlpDSn31OuvnyRdHO2tNr7c1XQ+0JNuK4dCa
         i3+fAAf4PLOZaTE3zw5sK7x483s4KVOJJ52edi9B0esdSwYxfR0G+DaZnKbEGWhmaGir
         CsPLlZf/0jP6nhjTDdTMJMTNrnLGu7kM93ClEsmlP+Ld0QzoI5KUQksCnd2FEntWWsX/
         ogHsyep42UKNbXXBwLjwTv7Af3e9r+q/WCju5+RA4NWTH+NGTfo7xZ9/7ICOlw1eU/Wc
         vrQ7UXhwHyrARFhupuSyCfK0j8ZhtQQ7I7v9ikJC3P7zZFIwTNOpBpZIFU7xYLM0sAnZ
         n1uQ==
X-Gm-Message-State: AOAM533jQatUfZc2EV2a1JGblGAJRuQRufrEO8ru4ZJiphQCYbT7wwEI
        8qIGo+3k48hBm4QunieFlWGYpojlPeBvLS0Y4+57350REiAXlQYu23KixBM0aHAj8dwSGe7zFwz
        +kAx/b38vaTSopxrFoPK1GBb/U2tb
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id o2-20020a5d58c2000000b002102baa52b8mr26772073wrf.20.1654595732392;
        Tue, 07 Jun 2022 02:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmQQjkSNT69Gzr83bM10Ninlkk05aLiBs5DvzsVAimhJHJr7sP1/XRhlCUmbBJ6Rae13u6jQ==
X-Received: by 2002:a5d:58c2:0:b0:210:2baa:52b8 with SMTP id o2-20020a5d58c2000000b002102baa52b8mr26772049wrf.20.1654595732186;
        Tue, 07 Jun 2022 02:55:32 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-112-184.dyn.eolo.it. [146.241.112.184])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0039c3ecdca66sm12636741wmb.23.2022.06.07.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:55:31 -0700 (PDT)
Message-ID: <abbda3f0e47a2b2a3a8304cc0486a7c1304581d9.camel@redhat.com>
Subject: Re: [PATCH] stmmac: intel: Fix an error handling path in
 intel_eth_pci_probe()
From:   Paolo Abeni <pabeni@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Date:   Tue, 07 Jun 2022 11:55:30 +0200
In-Reply-To: <75b293bd-ec8d-8c90-ffe5-afa49d6a218d@wanadoo.fr>
References: <1ac9b6787b0db83b0095711882c55c77c8ea8da0.1654462241.git.christophe.jaillet@wanadoo.fr>
         <20220606062650.GA31937@linux.intel.com>
         <75b293bd-ec8d-8c90-ffe5-afa49d6a218d@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 2022-06-06 at 22:42 +0200, Christophe JAILLET wrote:
> Le 06/06/2022 à 08:26, Wong Vee Khee a écrit :
> > On Sun, Jun 05, 2022 at 10:50:48PM +0200, Christophe JAILLET wrote:
> > > When the managed API is used, there is no need to explicitly call
> > > pci_free_irq_vectors().
> > > 
> > > This looks to be a left-over from the commit in the Fixes tag. Only the
> > > .remove() function had been updated.
> > > 
> > > So remove this unused function call and update goto label accordingly.
> > > 
> > > Fixes: 8accc467758e ("stmmac: intel: use managed PCI function on probe and resume")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > 
> > LGTM
> > 
> > Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> > 
> > 
> 
> Hi,
> 
> I've looked at it again.
> 
> I still think that the patch is good, but pcim_release() has changed in 
> 5.18 since commit 3f35d2cf9fbc ("PCI/MSI: Decouple MSI[-X] disable from 
> pcim_release()")
> 
> I guess that all the mechanic is in place so that everything is 
> registered when needed, but I've not been able to figure it out in the 
> case of dwmac-intel.c.
> 
> So, double check :).

AFACIS:

stmmac_config_{single,multi}_msi -> pci_alloc_irq_vectors ->
pci_alloc_irq_vectors_affinity -> __pci_enable_msix_range ->
pcim_setup_msi_release

So LGTM, thanks!

Paolo

