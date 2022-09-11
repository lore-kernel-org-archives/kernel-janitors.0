Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AB9ECAAD3
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Sep 2022 13:22:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiIKNWA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Sep 2022 09:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiIKNV7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Sep 2022 09:21:59 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677B527FD9
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Sep 2022 06:21:57 -0700 (PDT)
Received: from [192.168.1.18] ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id XMuIol8dXLFqbXMuIofNot; Sun, 11 Sep 2022 15:21:56 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Sep 2022 15:21:56 +0200
X-ME-IP: 90.11.190.129
Message-ID: <fac99d27-2e28-3c08-4cf3-c97afec99b77@wanadoo.fr>
Date:   Sun, 11 Sep 2022 15:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] checkpatch: Check check for places where
 dev_err_probe() would likely be better than dev_err()
Content-Language: en-US
To:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <3cdc2e776dea77b07c75694ba1410bd21e8ed749.1662902045.git.christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <3cdc2e776dea77b07c75694ba1410bd21e8ed749.1662902045.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 11/09/2022 à 15:15, Christophe JAILLET a écrit :
> Some functions are known to potentially return -EPROBE_DEFER. In such a
> case, it is likely that dev_err_probe() is a better choice than err_err().
> 
> dev_err_probe():
>    - is usually less verbose
>    - generates smaller .o files
>    - handles -EPROBE_DEFER so that logs are not spammed
>    - automatically log the error code in a human readable way
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is only a PoC to see if there is some interest in such a new
> check.
> The hard coded '5 lines of context' has been chosen because a typical
> pattern is:
> 
> 	clk = devm_clk_get(dev, "clk_lcd");
> 	if (IS_ERR(clk) {
> 		dev_err(dev, "Error meesage\n");
> 		return PTR_ERR(clk);
> 	}

(adding Linus Walleij)


I forgot to say that this patch is a try to address the comment from 
Linus Walleij at [1].

It would not help "fixing a gazillion dev_err_probe()", but it could 
help not having more to fix later :)

CJ

[1]: 
https://lore.kernel.org/all/CACRpkdZEcTD1A3tR=d4fDF89ECMDfchVPW921v6X6ARiPXHEMQ@mail.gmail.com/


> ---
>   scripts/checkpatch.pl | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2737e4ced574..88365749ed2e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2625,6 +2625,9 @@ sub process {
>   	my $last_blank_line = 0;
>   	my $last_coalesced_string_linenr = -1;
>   
> +	my $last_function_that_return_defer = "";
> +	my $last_function_that_return_defer_linenr = 0;
> +
>   	our @report = ();
>   	our $cnt_lines = 0;
>   	our $cnt_error = 0;
> @@ -7459,6 +7462,17 @@ sub process {
>   			WARN("DUPLICATED_SYSCTL_CONST",
>   				"duplicated sysctl range checking value '$1', consider using the shared one in include/linux/sysctl.h\n" . $herecurr);
>   		}
> +
> +# check for places where dev_err_probe() would likely be better than dev_err()
> +		if ($line =~ /((?:devm_)?clk_get)s*\(/) {
> +			$last_function_that_return_defer = $1;
> +			$last_function_that_return_defer_linenr = $linenr;
> +		}
> +		if ($last_function_that_return_defer_linenr >= ($linenr - 5) &&
> +		    $line =~ /dev_err[^_]/) {
> +			WARN("LIKELY_DEV_ERR_PROBE",
> +				"dev_err_probe() is likely a better choice than err_err() after a " . $last_function_that_return_defer . "() call\n" . $herecurr);
> +		}
>   	}
>   
>   	# If we have no input at all, then there is nothing to report on

