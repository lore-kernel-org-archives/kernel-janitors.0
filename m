Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F774C38145
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Sep 2022 20:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiIHUSB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 16:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiIHUR4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 16:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98CD103015
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Sep 2022 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662668264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GikWZTxGj/63HCy54SuFQr3ZFtzXKVCYYeh8Zi7wQj0=;
        b=WDX2yQO4lTzRmwXbEERh6hHkWLjZZuxdaSY96bpnbl7ci3wVNzrFJ9ft5uFmVUrcYpZLJ6
        NtOb6VdjoGVV+rCYYs+d47M1GYiWvS7isvlbTBarlHnK8E57XHWRDbN/kQermpwCRvDogo
        BUAinVs9PqYE5Jacv+fwAgdb/3pyhzY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-hHoi3F9aNBSvn2JTcJbyIA-1; Thu, 08 Sep 2022 16:17:40 -0400
X-MC-Unique: hHoi3F9aNBSvn2JTcJbyIA-1
Received: by mail-io1-f71.google.com with SMTP id t18-20020a5d8852000000b0068832d2b28eso11968001ios.2
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Sep 2022 13:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GikWZTxGj/63HCy54SuFQr3ZFtzXKVCYYeh8Zi7wQj0=;
        b=XOS0OkoYLcNJCSakGR3oPRHrmCHv1nMEENZp/XmjDBj2QmFsrtvXRYJF4JYwfd5hZL
         W+mCu8rrBeq5qviZloXlCfTpBzuPpssYavzEsAeBlv4RExu52WHI+77x3FKSuEBYMW03
         QQoY7aLHMKxAYydDuYah6ObU6cmUocaDvmKQtHoKjd97dog0QuOvMK/3u+rYscP6w5Xr
         ADmAgorutxMXxrB/qq/kXWHFWsbzXqRLTshbqzza9EEyy1BfZtr1F2PBVbRL1+98juE2
         TeTylVKoj9MKcsknhRPiPvo23TXL/4vH3lgNaj9piI+NOJCbySHGrWP7fyokFKlkJETL
         lHgg==
X-Gm-Message-State: ACgBeo1yUkA8FBsSwbQjE8XqJuumxNR47xZdtIH0HdAmWsVq4uH6WWPh
        qky9yfDbNEVz4tv46ZB4SNyKEzLSN3iQOofi/wgn2nim8K+gCUPCg0Ns8TImQpTZATOiXyVrqlg
        8sYmZogOaLYqoInNFOOKVLAjRUHJy
X-Received: by 2002:a05:6638:1450:b0:346:8a18:737c with SMTP id l16-20020a056638145000b003468a18737cmr5866075jad.149.1662668260204;
        Thu, 08 Sep 2022 13:17:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bf3RGZy+4hv8eZB5owi2SQBjkJww84tNK4SaY69049bB9OXpEkDKFHS1lXlnWgZWIpF29XQ==
X-Received: by 2002:a05:6638:1450:b0:346:8a18:737c with SMTP id l16-20020a056638145000b003468a18737cmr5866067jad.149.1662668260023;
        Thu, 08 Sep 2022 13:17:40 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id p5-20020a02b005000000b003583d27d258sm1125812jah.105.2022.09.08.13.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:17:39 -0700 (PDT)
Date:   Thu, 8 Sep 2022 14:17:33 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Diana Craciun <diana.craciun@oss.nxp.com>,
        Cornelia Huck <cohuck@redhat.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        kvm@vger.kernel.org
Subject: Re: [PATCH v3] vfio/fsl-mc: Fix a typo in a message
Message-ID: <20220908141733.1af63ac3.alex.williamson@redhat.com>
In-Reply-To: <a7c1394346725b7435792628c8d4c06a0a745e0b.1662134821.git.christophe.jaillet@wanadoo.fr>
References: <a7c1394346725b7435792628c8d4c06a0a745e0b.1662134821.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri,  2 Sep 2022 18:07:54 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> L and S are swapped in the message.
> s/VFIO_FLS_MC/VFIO_FSL_MC/
> 
> Also use 'ret' instead of 'WARN_ON(ret)' to avoid a duplicated message.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v3:
>   * Remove WARN_ON() and WARN() and only keep dev_warn()   [Diana Madalina Craciun <diana.craciun@oss.nxp.com>]

Applied to vfio next branch for v6.1.  Thanks,

Alex

