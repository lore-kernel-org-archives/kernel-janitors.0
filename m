Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC003C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Nov 2021 23:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237727AbhKYACE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Nov 2021 19:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52543 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236146AbhKYACD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Nov 2021 19:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637798333;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sm4004y9B1V+tnHfPgzjYss0IWvCFu8ljdIxWHi+//4=;
        b=BQ2S4p0jNnQXY/+rhlnHihedsSFcGHt9x/U/Y/davXY8TcvKaet2/ta+8QikDK8cHE/DVd
        dLOXTj3GTNHlUD0ghN8ss37qvUKOHCIOvPLJHUVU8fFfltY52WpL9PO54WlkSOPvUr+XK/
        0FoODR8TjspiXx95y2INHZgR2Ep3iT8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-sJl0qLj7NYqAoSIofWrKnA-1; Wed, 24 Nov 2021 18:58:51 -0500
X-MC-Unique: sJl0qLj7NYqAoSIofWrKnA-1
Received: by mail-ed1-f72.google.com with SMTP id w18-20020a056402071200b003e61cbafdb4so3810483edx.4
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Nov 2021 15:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sm4004y9B1V+tnHfPgzjYss0IWvCFu8ljdIxWHi+//4=;
        b=b5AbKtFMMUiltHSNS22zoAgM0ACuweaEEbqlIcVkgO0iJicU42qjIBKOYhBTO0Nm2v
         OVa/a2/e3PFkAyM3ukhMgAmCM5y7//Kgl53q1RCXgRf5rP7kOm/BBk8kOlegU9vVW/iC
         og/5LZPmzk+PUr833GrOa9clDCdzg0H3jPQzOpuBbwig304KTbLW0snb9sls/eBdsX5L
         KW1h/fPWTYB4aKgkdLmmUCd7SYGQcAQmzGcPOV/ar07fxr8xymLUH6laCeiZXj3IfSh9
         UbRYen3NgO+SLKpM+ZxNq5W2uv7LFg1vqD+hu+Wgbt+VxXGZDv7FCfoaraqs09X306oW
         thpg==
X-Gm-Message-State: AOAM532LLzDQj2SEMsi82DRW18yJIKJMT0l2z1lLjSWWeFaE4/R5Pwhc
        o+OqijuEiy1Gnk1jMk9La3fSEg/Qn95qopZGngcVA1I73IAfVMDOql51Xg8mBVk6HvHHXI6ndZh
        JjmnI5m9XIeSn9QM8zDufhV9Vax0o
X-Received: by 2002:a17:906:8c3:: with SMTP id o3mr26240452eje.10.1637798330717;
        Wed, 24 Nov 2021 15:58:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysCDZ92JnLx5p8B8EgDT3JbOAJxcL7cO996KXojwt2y2dxDKYm/THtO3luW2U+EJQ7p/PYcw==
X-Received: by 2002:a17:906:8c3:: with SMTP id o3mr26240417eje.10.1637798330482;
        Wed, 24 Nov 2021 15:58:50 -0800 (PST)
Received: from redhat.com ([2a0e:1c80:14::66])
        by smtp.gmail.com with ESMTPSA id hc16sm593664ejc.12.2021.11.24.15.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:58:49 -0800 (PST)
Date:   Wed, 24 Nov 2021 18:58:43 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Wu Zongyong <wuzongyong@linux.alibaba.com>
Subject: Re: [PATCH 1/2] eni_vdpa: Fix an error handling path in
 'eni_vdpa_probe()'
Message-ID: <20211124185834-mutt-send-email-mst@kernel.org>
References: <f6b2d087ca3840604b4e711a208d35b5d6285cb4.1636301587.git.christophe.jaillet@wanadoo.fr>
 <CACGkMEvN0cgFQhJmLF3xDXHt_EyZ-TnfBM8CnpNwA9sKcwpzBg@mail.gmail.com>
 <393fb7b7-653b-eae6-16bd-5ffc7d600619@wanadoo.fr>
 <CACGkMEt3yA+fkFJxKfrXyui-rYVSk78=1AqrT0TYQqzcqTJVyg@mail.gmail.com>
 <069ed3fb-ef99-ff36-136d-a0221ba85a96@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <069ed3fb-ef99-ff36-136d-a0221ba85a96@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 09, 2021 at 10:21:44PM +0100, Christophe JAILLET wrote:
> Le 09/11/2021 à 03:54, Jason Wang a écrit :
> > On Tue, Nov 9, 2021 at 3:32 AM Christophe JAILLET
> > <christophe.jaillet@wanadoo.fr> wrote:
> > > 
> > > Le 08/11/2021 à 06:55, Jason Wang a écrit :
> > > > On Mon, Nov 8, 2021 at 12:15 AM Christophe JAILLET
> > > > <christophe.jaillet@wanadoo.fr> wrote:
> > > > > 
> > > > > In the error handling path, a successful 'vp_legacy_probe()' should be
> > > > > balanced by a corresponding 'vp_legacy_remove()' call, as already done in
> > > > > the remove function.
> > > > > 
> > > > > Add the missing call and update gotos accordingly.
> > > > > 
> > > > > Fixes: e85087beedca ("eni_vdpa: add vDPA driver for Alibaba ENI")
> > > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > > ---
> > > > >    drivers/vdpa/alibaba/eni_vdpa.c | 6 ++++--
> > > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> > > > > index 3f788794571a..12b3db6b4517 100644
> > > > > --- a/drivers/vdpa/alibaba/eni_vdpa.c
> > > > > +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> > > > > @@ -501,7 +501,7 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > > >           if (!eni_vdpa->vring) {
> > > > >                   ret = -ENOMEM;
> > > > >                   ENI_ERR(pdev, "failed to allocate virtqueues\n");
> > > > > -               goto err;
> > > > > +               goto err_remove_vp_legacy;
> > > > >           }
> > > > > 
> > > > >           for (i = 0; i < eni_vdpa->queues; i++) {
> > > > > @@ -513,11 +513,13 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > > >           ret = vdpa_register_device(&eni_vdpa->vdpa, eni_vdpa->queues);
> > > > >           if (ret) {
> > > > >                   ENI_ERR(pdev, "failed to register to vdpa bus\n");
> > > > > -               goto err;
> > > > > +               goto err_remove_vp_legacy;
> > > > >           }
> > > > > 
> > > > >           return 0;
> > > > > 
> > > > > +err_remove_vp_legacy:
> > > > > +       vp_legacy_remove(&eni_vdpa->ldev);
> > > > 
> > > > Won't vp_legacy_remove() be triggered by the put_devic() below?
> > > 
> > > Hi, I'm sorry but i don't see how.
> > > 
> > > My understanding is that:
> > >     - on "put_device(&eni_vdpa->vdpa.dev);", the corresponding release
> > > function will be called.
> > > 
> > >     - This release function is the one recorded in the
> > > '__vdpa_alloc_device()' function.
> > > 
> > >     - So it should be 'vdpa_release_dev()'.
> > > 
> > >     - This function, AFAIU, has no knowledge of 'vp_legacy_remove()' or
> > > anything that could call it.
> > > 
> > > 
> > > Unless I misread something or miss something obvious, I don't see how
> > > 'vp_legacy_remove() would be called.
> > > 
> > > 
> > > Could you elaborate?
> > 
> > I think the device should release the driver (see
> > device_release_driver()) during during its deleting.
> 
> Hi, I still don't follow the logic and I don't understand how
> 'vp_legacy_remove()' will finely be called, but it is not that important.
> 
> If it's fine for you, it's fine for me :)
> 
> CJ

So pls post just patch 2?

> > 
> > Thanks
> > 
> > > 
> > > CJ
> > > 
> > > > 
> > > > Thanks
> > > > 
> > > > >    err:
> > > > >           put_device(&eni_vdpa->vdpa.dev);
> > > > >           return ret;
> > > > > --
> > > > > 2.30.2
> > > > > 
> > > > 
> > > > 
> > > 
> > 
> > _______________________________________________
> > Virtualization mailing list
> > Virtualization@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/virtualization
> > 

