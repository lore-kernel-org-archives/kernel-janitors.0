Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F21C433E0
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B36164EC0
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Mar 2021 06:15:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354890AbhCCGHi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 01:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575621AbhCBWrv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 2 Mar 2021 17:47:51 -0500
X-Greylist: delayed 1686 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Mar 2021 14:47:09 PST
Received: from esgaroth.petrovitsch.at (unknown [IPv6:2a01:4f8:120:527b:6876:2a4f:a044:62ad])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB1CC061756;
        Tue,  2 Mar 2021 14:47:09 -0800 (PST)
Received: from thorin.petrovitsch.priv.at (80-110-91-187.cgn.dynamic.surfer.at [80.110.91.187])
        (authenticated bits=0)
        by esgaroth.petrovitsch.at (8.16.1/8.16.1) with ESMTPSA id 122MIGmL914592
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
        Tue, 2 Mar 2021 23:18:16 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 esgaroth.petrovitsch.at 122MIGmL914592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=petrovitsch.priv.at;
        s=default; t=1614723497;
        bh=+MVoVMUVm8capWlNcUWJStxtBvOtui4ewlEULmYwlXE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fS0wk1Xm132rltWm/1oyGznxEdWPToAqz2hoNZC11FcfHkqVTyx9yXdHBtk/KQgYu
         CUW9zFrgfDiXTM+mo+IlrHMlPPr9NFHKgyMAaMTebilLaUnd2681oIcofQtw1oWtZW
         WSq3taGbZHYFOVrfZvd+8Y37Sy4pPgxmVrownKX4=
X-Info-sendmail: I was here
Subject: Re: linux-kernel janitorial RFP: Mark static arrays as const
To:     Joe Perches <joe@perches.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        cocci <cocci@systeme.lip6.fr>
References: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Bimi-Selector: v=BIMI1; s=default
Message-ID: <22d22edd-4213-0f57-d801-1c570f04ec05@petrovitsch.priv.at>
Date:   Tue, 2 Mar 2021 23:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <053b06c47f08631675c295b5c893b90be4248347.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-x.dcc-servers-Metrics: esgaroth.petrovitsch.priv.at 104; Body=5 Fuz1=5
        Fuz2=5
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi all!

On 02/03/2021 18:42, Joe Perches wrote:
[...]
> ------------- For instance: (head -10 of the git grep for file statics)
> 
> drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };
> drivers/accessibility/speakup/keyhelp.c:26:static u_char funcvals[] = {
> drivers/accessibility/speakup/main.c:2059:static spkup_hand spkup_handler[] = {
> drivers/accessibility/speakup/speakup_acntpc.c:35:static unsigned int synth_portlist[] = { 0x2a8, 0 };
> drivers/accessibility/speakup/speakup_decpc.c:133:static int synth_portlist[] = { 0x340, 0x350, 0x240, 0x250, 0 };
> drivers/accessibility/speakup/speakup_dectlk.c:110:static int ap_defaults[] = {122, 89, 155, 110, 208, 240, 200, 106, 306};
> drivers/accessibility/speakup/speakup_dectlk.c:111:static int g5_defaults[] = {86, 81, 86, 84, 81, 80, 83, 83, 73};
> drivers/accessibility/speakup/speakup_dtlk.c:34:static unsigned int synth_portlist[] = {
> drivers/accessibility/speakup/speakup_keypc.c:34:static unsigned int synth_portlist[] = { 0x2a8, 0 };
> drivers/acpi/ac.c:137:static enum power_supply_property ac_props[] = {
> 
> For drivers/accessibility/speakup/keyhelp.c:18:static u_short masks[] = { 32, 16, 8, 4, 2, 1 };

Looking at the examples: Just s/^static /static const / in the lines
reported by the grep's above and see if it compiles (and save space)?

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
     There is NO CLOUD, just other people's computers. - FSFE
                     LUGA : http://www.luga.at
