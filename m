Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E885C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 09:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 199B664FE2
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 Mar 2021 09:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhCEJkK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 Mar 2021 04:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32229 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229464AbhCEJkB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 Mar 2021 04:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614937200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q6N/JHvwR3DDe0EEB+dV0FhguwPKEzi443GmKZ0bZ4c=;
        b=GjdkFIN7ENSy6+Y8eq9bXUFN/bt5mCO5OPKgq/QEy5VV8abqGEHkyaw63ohvRd351aggtV
        jomPZ8+9OQQN1zlRj/jeDpp/mIxREgs/sUugRuBC9nbSseiKgOcWpwXdXIzh9GFvtgpgHf
        3uEdyoS8tb5AxyEY8R+ZJUFo/dQoODo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-dgJAmS8ZNp2A4lgOGFa89w-1; Fri, 05 Mar 2021 04:39:56 -0500
X-MC-Unique: dgJAmS8ZNp2A4lgOGFa89w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F4B108BD06;
        Fri,  5 Mar 2021 09:39:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-10.ams2.redhat.com [10.36.114.10])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E051002382;
        Fri,  5 Mar 2021 09:39:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 5BEA018000AE; Fri,  5 Mar 2021 09:22:41 +0100 (CET)
Date:   Fri, 5 Mar 2021 09:22:41 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qxl: Fix uninitialised struct field head.surface_id
Message-ID: <20210305082241.dt53hczrvds3qoz2@sirius.home.kraxel.org>
References: <20210304094928.2280722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304094928.2280722-1-colin.king@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Mar 04, 2021 at 09:49:28AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The surface_id struct field in head is not being initialized and
> static analysis warns that this is being passed through to
> dev->monitors_config->heads[i] on an assignment. Clear up this
> warning by initializing it to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: a6d3c4d79822 ("qxl: hook monitors_config updates into crtc, not encoder.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Pushed to drm-misc-fixes.

thanks,
  Gerd

