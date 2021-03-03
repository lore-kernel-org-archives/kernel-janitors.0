Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47529C4332E
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25F2464E90
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355231AbhCDAVY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:24 -0500
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:3599 "EHLO
        mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234197AbhCCL3c (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 06:29:32 -0500
X-IronPort-AV: E=Sophos;i="5.81,219,1610406000"; 
   d="scan'208";a="374603122"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Mar 2021 09:36:19 +0100
Date:   Wed, 3 Mar 2021 09:36:19 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>
cc:     Joe Perches <joe@perches.com>, cocci <cocci@systeme.lip6.fr>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: [Cocci] linux-kernel janitorial RFP: Mark static arrays as
 const
In-Reply-To: <22d22edd-4213-0f57-d801-1c570f04ec05@petrovitsch.priv.at>
Message-ID: <alpine.DEB.2.22.394.2103030935020.2980@hadrien>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com> <22d22edd-4213-0f57-d801-1c570f04ec05@petrovitsch.priv.at>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Tue, 2 Mar 2021, Bernd Petrovitsch wrote:

> Hi all!
>
> On 02/03/2021 18:42, Joe Perches wrote:
> [...]
> > ------------- For instance: (head -10 of the git grep for file statics)
> >
> > drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };
> > drivers/accessibility/speakup/keyhelp.c:26:static u_char funcvals[] = {
> > drivers/accessibility/speakup/main.c:2059:static spkup_hand spkup_handler[] = {
> > drivers/accessibility/speakup/speakup_acntpc.c:35:static unsigned int synth_portlist[] = { 0x2a8, 0 };
> > drivers/accessibility/speakup/speakup_decpc.c:133:static int synth_portlist[] = { 0x340, 0x350, 0x240, 0x250, 0 };
> > drivers/accessibility/speakup/speakup_dectlk.c:110:static int ap_defaults[] = {122, 89, 155, 110, 208, 240, 200, 106, 306};
> > drivers/accessibility/speakup/speakup_dectlk.c:111:static int g5_defaults[] = {86, 81, 86, 84, 81, 80, 83, 83, 73};
> > drivers/accessibility/speakup/speakup_dtlk.c:34:static unsigned int synth_portlist[] = {
> > drivers/accessibility/speakup/speakup_keypc.c:34:static unsigned int synth_portlist[] = { 0x2a8, 0 };
> > drivers/acpi/ac.c:137:static enum power_supply_property ac_props[] = {
> >
> > For drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };
>
> Looking at the examples: Just s/^static /static const / in the lines
> reported by the grep's above and see if it compiles (and save space)?

There is a small risk with compiling that there may be a problem for a
configuration you haven't considered.

julia
