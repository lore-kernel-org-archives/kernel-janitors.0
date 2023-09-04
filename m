Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ACEC83F33
	for <kernel-janitors@archiver.kernel.org>; Mon,  4 Sep 2023 17:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353377AbjIDR5w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 4 Sep 2023 13:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353370AbjIDR5u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 4 Sep 2023 13:57:50 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADCF1702
        for <kernel-janitors@vger.kernel.org>; Mon,  4 Sep 2023 10:57:39 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id dDpNqLclXewmQdDpNqCbJ0; Mon, 04 Sep 2023 19:57:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1693850257;
        bh=nR71hbq/PjoQgx6c1QsB9ddoM6wjPhcwxem+IF/5MAs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=DAmM/NUC9xDbqtOy08KIXOcL8tmmpXv9w0aLhvdPCW/b3pVhHp9s92Gs39idwsLOO
         uUgQN9V6cvYbGFBLFo6PaXwsP00xKZF4t5QmeRhjGoDPX6dGmUOOKeiuNYI2jOxUOK
         wTiKH4H4u25rVSTHmdJQjIS0EnRDs6dqOklCrfNIQr50dp8JRVcYmbvu7dNhZh9N/0
         qzxO81ISdmp2bUVqs7gie3KaoNksdre5yy5anbMFHWB1nFVQaM38ZDT0xiIkuCq9gn
         TBUJGCnGh2i2fKUgx/Hlmc++hm5Nly5Wzr38Ua4mGwpGus3VaAGQw+vOuAvK+x+z64
         wfek9dll6yFog==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 Sep 2023 19:57:37 +0200
X-ME-IP: 86.243.2.178
Message-ID: <858ca657-3845-f65e-b9d8-9d7700e4a069@wanadoo.fr>
Date:   Mon, 4 Sep 2023 19:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] phy: sun4i-usb: Fix a W=1 compilation failure
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <0bc81612171baaa6d5dff58c8e009debc03e1ba8.1693735840.git.christophe.jaillet@wanadoo.fr>
 <20230904005855.658819b3@slackpad.lan>
Content-Language: fr, en-GB
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230904005855.658819b3@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 04/09/2023 à 01:58, Andre Przywara a écrit :
> On Sun,  3 Sep 2023 12:11:06 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
>> With gcc 12.3.0, when this file is built, we get errors such as:
>>
>> drivers/phy/allwinner/phy-sun4i-usb.c: In function ‘sun4i_usb_phy_probe’:
>> drivers/phy/allwinner/phy-sun4i-usb.c:790:52: error: ‘_vbus’ directive output may be truncated writing 5 bytes into a region of size between 2 and 12 [-Werror=format-truncation=]
>>    790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>>        |                                                    ^~~~~
>> drivers/phy/allwinner/phy-sun4i-usb.c:790:17: note: ‘snprintf’ output between 10 and 20 bytes into a destination of size 16
>>    790 |                 snprintf(name, sizeof(name), "usb%d_vbus", i);
>>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Because of the possible value of 'i', this can't be an issue in real world
> 
> Would using "u8 i;" help? After all currently there are only 4 PHYs
> max, and in general this isn't expected to be more than a "handful", so
> 8 bits should be plenty. An unsigned is better anyway.
> It leaves a bit of a bitter taste, though, as we shouldn't do this kind
> type tweaking, especially not to work around the compiler trying to be
> clever, but then not seeing the whole picture (that "i" is bounded by
> compile time constants not exceeding "4").

data->cfg->num_phys is also an int, and having 'i' as an char is really 
unusual.

So, if changing the size of name (only to waste some stack in order to 
silence a compiler warning) is not acceptable, I think that the best is 
to leave things as-is.

CJ


> 
> Cheers,
> Andre
> 
>> application, but in order to have "make W=1" work correctly, give more
>> space for 'name'.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
>> index ec551464dd4f..e53a9a9317bc 100644
>> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
>> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
>> @@ -782,7 +782,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
>>   
>>   	for (i = 0; i < data->cfg->num_phys; i++) {
>>   		struct sun4i_usb_phy *phy = data->phys + i;
>> -		char name[16];
>> +		char name[32];
>>   
>>   		if (data->cfg->missing_phys & BIT(i))
>>   			continue;
> 
> 

