Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C99DC678D4
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Mar 2023 10:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjCGK4a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Mar 2023 05:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjCGK4E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Mar 2023 05:56:04 -0500
X-Greylist: delayed 2357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Mar 2023 02:56:00 PST
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F33D4A1FD
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Mar 2023 02:55:59 -0800 (PST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.138.246])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4C1D81FEC7
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Mar 2023 09:41:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jr9mk (unknown [10.110.208.235])
        by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 011EC1FDEE;
        Tue,  7 Mar 2023 09:41:15 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
        by ghost-submission-6684bf9d7b-jr9mk with ESMTPSA
        id UzyDO7sGB2STSQEALa529g
        (envelope-from <rafal@milecki.pl>); Tue, 07 Mar 2023 09:41:15 +0000
MIME-Version: 1.0
Date:   Tue, 07 Mar 2023 10:41:15 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org,
        William Zhang <william.zhang@broadcom.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: bcm63138: refer to ARCH_BCMBCA instead of
 ARCH_BCM4908
In-Reply-To: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
References: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9e448d3d42b4b3029e4b8993f2272e4c@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 485262861866281947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeetheelfefgjedutdeivdduvdethffhhedulefggeeitdejudfhkeetjeekieejgfenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefpdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023-03-07 09:29, Lukas Bulwahn wrote:
> diff --git a/drivers/leds/blink/Kconfig b/drivers/leds/blink/Kconfig
> index 945c84286a4e..bdcb7377cd4e 100644
> --- a/drivers/leds/blink/Kconfig
> +++ b/drivers/leds/blink/Kconfig
> @@ -1,10 +1,10 @@
>  config LEDS_BCM63138
>  	tristate "LED Support for Broadcom BCM63138 SoC"
>  	depends on LEDS_CLASS
> -	depends on ARCH_BCM4908 || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
> +	depends on ARCH_BCMBCA || ARCH_BCM_5301X || BCM63XX || COMPILE_TEST
>  	depends on HAS_IOMEM
>  	depends on OF
> -	default ARCH_BCM4908
> +	default ARCH_BCMBCA
>  	help
>  	  This option enables support for LED controller that is part of
>  	  BCM63138 SoC. The same hardware block is known to be also used

William: do we want LEDS_BCM63138 default on all BCMBCA devices?
