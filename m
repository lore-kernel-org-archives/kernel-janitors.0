Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAC4C41513
	for <kernel-janitors@archiver.kernel.org>; Thu,  3 Aug 2023 07:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjHCHML (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 3 Aug 2023 03:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbjHCHMJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 3 Aug 2023 03:12:09 -0400
X-Greylist: delayed 125 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 03 Aug 2023 00:12:08 PDT
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3C5194
        for <kernel-janitors@vger.kernel.org>; Thu,  3 Aug 2023 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Tm4Es6YpMOQ78FtrpipmSk0OqxRLHuMuywdKtTR77cI=;
  b=GF/Wq+NethTGNSL17sHAGhTLFZQeq6Eleh5ShSDjd0nBbIhDiRYPfE8T
   ouCjF1zBSuLy34jj4l/4FetHpUXfDPkDiWdjSy6ywWucFkGe4pHAIxOGZ
   quCtSlvO4+bwYM6inU8oo2nnE58U+Qk4F0sQATepkQVhoTClktFJWnpTt
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,251,1684792800"; 
   d="scan'208";a="62906655"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 09:08:56 +0200
Date:   Thu, 3 Aug 2023 09:08:55 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Wu Yunchuan <yunchuan@nfschina.com>
cc:     kvalo@kernel.org, yuancan@huawei.com, simon.horman@corigine.com,
        marex@denx.de, peter@n8pjl.ca, johannes.berg@intel.com,
        alexander@wetzel-home.de, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next 0/9] wifi: rsi: Remove some unnecessary
 conversions
In-Reply-To: <20230803070042.3654049-1-yunchuan@nfschina.com>
Message-ID: <alpine.DEB.2.22.394.2308030908020.3083@hadrien>
References: <20230803070042.3654049-1-yunchuan@nfschina.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Thu, 3 Aug 2023, Wu Yunchuan wrote:

> remove unnecessary (void*) conversions and other unnecessary
> conversons in the directory drivers/net/wireless/rsi.
>
> Wu Yunchuan (9):
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary conversions
>   wifi: rsi: Remove unnecessary conversions
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary (void*) conversions
>   wifi: rsi: Remove unnecessary (void*) conversions

Shouldn't these have unique subject lines?

julia

>
>  drivers/net/wireless/rsi/rsi_91x_coex.c     | 11 +++---
>  drivers/net/wireless/rsi/rsi_91x_debugfs.c  |  3 +-
>  drivers/net/wireless/rsi/rsi_91x_hal.c      |  2 +-
>  drivers/net/wireless/rsi/rsi_91x_mac80211.c |  4 +--
>  drivers/net/wireless/rsi/rsi_91x_main.c     |  4 +--
>  drivers/net/wireless/rsi/rsi_91x_sdio.c     | 39 ++++++++-------------
>  drivers/net/wireless/rsi/rsi_91x_sdio_ops.c | 15 +++-----
>  drivers/net/wireless/rsi/rsi_91x_usb.c      | 20 +++++------
>  drivers/net/wireless/rsi/rsi_91x_usb_ops.c  |  2 +-
>  9 files changed, 40 insertions(+), 60 deletions(-)
>
> --
> 2.30.2
>
>
