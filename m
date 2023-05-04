Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146D9C7EE23
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 11:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjEDLkv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 07:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjEDLkv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 07:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4F844BB
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683200401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1dAUD/YyKYtBDGXLrqbHGpjW1303Qwg+dgZM70sjvJ4=;
        b=hRgB8GGQHUWvOU+tk4Zfk9YKnBvbGRSYi58nHesN+9EzKW+WmBqLuO+XXIfcxue66rXOA9
        qIo/I75XcNOuc5boxeCCij8sRMgAKjamy6TDUzTxp8jF56HtPX7n264d5J4F3k+chI/jhJ
        hkXWja2k9o1hHB8q5LLqq+Vq1qvEUBk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-cG2_F2BuMC6YfxNPbe4UPA-1; Thu, 04 May 2023 07:40:00 -0400
X-MC-Unique: cG2_F2BuMC6YfxNPbe4UPA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f08900caadso579905e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 04:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683200399; x=1685792399;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dAUD/YyKYtBDGXLrqbHGpjW1303Qwg+dgZM70sjvJ4=;
        b=AH2UKHl1KfYXeT7Gg8c02YPkkkLZ9UDq/wzxXwr9YcBJFOxkBDxQ1oVgy1NBmeisuW
         S6vi5srkP60RoFhuONRoPvd4gUsL1j0cM3nqSusuftCVgw0uTCp7nLW5LOGXUBVwjf7i
         zKoSXCyl26A1amvXaOw9OihcITuHL7is7A670j/PHW0xw8FtLnqvnfoWp/ed8nQHkLvg
         drLGyn9DrmOcriAT8JqDK7y5fApQvU5pHwosxCALImVbK9LwqTVMlNuUSS+I0qVmjSay
         RVzHNM2osg84D9yOeOB/n7bZO6g9JuEgVwYKgKpT+M1ISBH8Xym6MVOsnwiIKSGZIO0h
         OK1A==
X-Gm-Message-State: AC+VfDypyRx84HyMFjhfgoZvv4Daim5oY3AOosZORQMuBCAOwTwHWS+H
        937aP5Io24+9NOAUDSRWfwpry61xTOtaXRInL+V5ie4SrSjz5q17kjKhIaTMXD9QaT/uZUbBai/
        WH4unLc5cqaKbCiIFbNCnUDcCI1q/
X-Received: by 2002:a05:600c:538d:b0:3f1:7332:40d9 with SMTP id hg13-20020a05600c538d00b003f1733240d9mr6738151wmb.0.1683200399088;
        Thu, 04 May 2023 04:39:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63AwDBCWc4WjL+ZzpDQNmewmPocR+z2qi0OemrHZ1uXpPUOdx5ljTHrrhKdYb/UlwjpVFolg==
X-Received: by 2002:a05:600c:538d:b0:3f1:7332:40d9 with SMTP id hg13-20020a05600c538d00b003f1733240d9mr6738133wmb.0.1683200398753;
        Thu, 04 May 2023 04:39:58 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-79.dyn.eolo.it. [146.241.244.79])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c290600b003f18992079dsm4610657wmd.42.2023.05.04.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:39:58 -0700 (PDT)
Message-ID: <19409d2b4222b3a5c6fc0cedbfa7844b6eb3440f.camel@redhat.com>
Subject: Re: [PATCH] atlantic: Remove unnecessary (void*) conversions
From:   Paolo Abeni <pabeni@redhat.com>
To:     Leon Romanovsky <leon@kernel.org>, wuych <yunchuan@nfschina.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        irusskikh@marvell.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 04 May 2023 13:39:57 +0200
In-Reply-To: <20230504110304.GX525452@unreal>
References: <20230504100253.74932-1-yunchuan@nfschina.com>
         <20230504110304.GX525452@unreal>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2023-05-04 at 14:03 +0300, Leon Romanovsky wrote:
> On Thu, May 04, 2023 at 06:02:53PM +0800, wuych wrote:
> > Pointer variables of void * type do not require type cast.
> >=20
> > Signed-off-by: wuych <yunchuan@nfschina.com>
> > ---
> >  .../net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> There is same thing in drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_=
atl2_utils_fw.c too.

Also this looks like material for net-next: the next version will have
to wait a bit, see below.

Next time please include the target tree into the email subj, thanks!

## Form letter - net-next-closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after May 8th.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#develop=
ment-cycle

