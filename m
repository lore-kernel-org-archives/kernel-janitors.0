Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E522C433E0
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 09:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3505964EBD
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 09:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhCNJWT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 05:22:19 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:15151 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229539AbhCNJVl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 05:21:41 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A8+ymea6n7+m5C91gIQPXwZqBI+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYhpIdcaVjYSymp0gpH3JoRwWX2wtns3FBbmYTRrnlaJdzKswGfOZXAfgsH?=
 =?us-ascii?q?a1N40K1+CJ/xTMEzDzn9QtsptIXKRzBdb5B1o/reuS2njAL/8O29+CmZrEuc77?=
 =?us-ascii?q?71NACT5ncLth6QARMGemO2l7XhNPC5Z8NLf03KV6jgGtc3gWcci3b0NtN9Trnc?=
 =?us-ascii?q?HBl57tfHc9aSIP1Q/mt1+VwY+/Ozyx7TE4Fxdm4ZJnykThuzy825Wbn5iAu3zh?=
 =?us-ascii?q?/l6Wx7B/q/3Hjv9uOeSgovU8Qw+c7zqAVcBGQL2NvDc8paWK5EwxmNfBgzpIBb?=
 =?us-ascii?q?UW11rhOluYm1/KxxTv1jYo5RbZuDmlvUc=3D?=
X-IronPort-AV: E=Sophos;i="5.81,245,1610406000"; 
   d="scan'208";a="497797467"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Mar 2021 10:21:39 +0100
Date:   Sun, 14 Mar 2021 10:21:39 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: Is it ok to propose more complex code changes?
In-Reply-To: <CAOc6etbXM7rCSovO0A0Ye+ZQ8=JUkNM_p=L_3HL2k9UASNfHkg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2103141018490.2986@hadrien>
References: <CAOc6etbXM7rCSovO0A0Ye+ZQ8=JUkNM_p=L_3HL2k9UASNfHkg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Sat, 13 Mar 2021, Edmundo Carmona Antoranz wrote:

> Hello!
>
> I just found a piece of code that I think can be improved somewhat (in
> drivers/staging/vt6655/channel.c)
>
> switch (priv->byRFType) {
> case RF_AIROHA7230:
> case RF_UW2452:
> case RF_NOTHING:
> default:
>        ch = vnt_channels_5ghz;
>
>        for (i = 0; i < ARRAY_SIZE(vnt_channels_5ghz); i++) {
>                ch[i].max_power = 0x3f;
>                ch[i].flags = IEEE80211_CHAN_NO_HT40;
>        }
>
>        priv->hw->wiphy->bands[NL80211_BAND_5GHZ] =
>                                        &vnt_supported_5ghz_band;
>        fallthrough;
> case RF_RFMD2959:
> case RF_AIROHA:
> case RF_AL2230S:
> case RF_UW2451:
> case RF_VT3226:
>        ch = vnt_channels_2ghz;
>
>        for (i = 0; i < ARRAY_SIZE(vnt_channels_2ghz); i++) {
>                ch[i].max_power = 0x3f;
>                ch[i].flags = IEEE80211_CHAN_NO_HT40;
>        }
>
>        priv->hw->wiphy->bands[NL80211_BAND_2GHZ] =
>                                        &vnt_supported_2ghz_band;
>        break;
> }
>
> There are two sections of code that could be turned into a function or
> macro so that duplication can be avoided. Is it within our "Scope of
> Work" as janitors to make this kind of proposal or it's better if we
> avoid it and start easy at first?

In principle, you can do whatever you like in staging.  If the maintainer
doesn't like your suggestion, they can reject it.  This looks not entirely
trivial, because the thing you want to abstract over is used once as a
variable and once for its address.  I guess you can pass in the address
and then dereference it, but you would have to check that that works ok
with ARRAY_SIZE, which is also a macro.  You would also need to understand
the code well enough to give this new function a resonable name.

julia
