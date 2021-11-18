Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F6EC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 09:23:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3142761B95
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 09:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245128AbhKRJZ7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 04:25:59 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39834 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241323AbhKRJZy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 04:25:54 -0500
Received: from [79.2.93.196] (port=39542 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mndd7-00075N-CT; Thu, 18 Nov 2021 10:22:53 +0100
Subject: Re: [bug report] mfd: lp87565: Handle optional reset pin
To:     Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
References: <20211117111701.GA23355@kili> <YZYQ9KtYvsP7RfzX@google.com>
 <20211118084731.GL27562@kadam> <YZYWS0N7nluXjfKA@google.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <ca9ee8e3-b996-5703-ffe0-81ccab93b872@lucaceresoli.net>
Date:   Thu, 18 Nov 2021 10:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZYWS0N7nluXjfKA@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 18/11/21 10:00, Lee Jones wrote:
> On Thu, 18 Nov 2021, Dan Carpenter wrote:
> 
>> On Thu, Nov 18, 2021 at 08:38:12AM +0000, Lee Jones wrote:
>>> On Wed, 17 Nov 2021, Dan Carpenter wrote:
>>>
>>>> Hello Luca Ceresoli,
>>>>
>>>> The patch 50e4d7a2a667: "mfd: lp87565: Handle optional reset pin"
>>>> from Feb 26, 2021, leads to the following Smatch static checker
>>>> warning:
>>>>
>>>> 	drivers/mfd/lp87565.c:76 lp87565_probe()
>>>> 	warn: 'lp87565->reset_gpio' could be an error pointer
>>>>
>>>> drivers/mfd/lp87565.c
>>>>     46 static int lp87565_probe(struct i2c_client *client,
>>>>     47                          const struct i2c_device_id *ids)
>>>>     48 {
>>>>     49         struct lp87565 *lp87565;
>>>>     50         const struct of_device_id *of_id;
>>>>     51         int ret;
>>>>     52         unsigned int otpid;
>>>>     53 
>>>>     54         lp87565 = devm_kzalloc(&client->dev, sizeof(*lp87565), GFP_KERNEL);
>>>>     55         if (!lp87565)
>>>>     56                 return -ENOMEM;
>>>>     57 
>>>>     58         lp87565->dev = &client->dev;
>>>>     59 
>>>>     60         lp87565->regmap = devm_regmap_init_i2c(client, &lp87565_regmap_config);
>>>>     61         if (IS_ERR(lp87565->regmap)) {
>>>>     62                 ret = PTR_ERR(lp87565->regmap);
>>>>     63                 dev_err(lp87565->dev,
>>>>     64                         "Failed to initialize register map: %d\n", ret);
>>>>     65                 return ret;
>>>>     66         }
>>>>     67 
>>>>     68         lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
>>>>     69                                                       GPIOD_OUT_LOW);
>>>>     70         if (IS_ERR(lp87565->reset_gpio)) {
>>>>     71                 ret = PTR_ERR(lp87565->reset_gpio);
>>>>     72                 if (ret == -EPROBE_DEFER)
>>>>     73                         return ret;
>>>>
>>>> Only "ret = -EPROBE_DEFER" is handled.  Other error pointer will lead to
>>>> a crash.
>>>>
>>>>     74         }
>>>>     75 
>>>> --> 76         if (lp87565->reset_gpio) {
>>>
>>> I guess this should be:
>>>
>>>     if (lp87565->reset_gpio >= 0)
>>>
>>> If 0 is valid, or '>' if it's not.
>>>
>>
>> lp87565->reset_gpio is a pointer so that's not going to work.
> 
> Ah, I assumed this was a GPIO #.  I missed the gpioD part.
> 
>> There are two options.  The first is to just "return ret;" for all
>> errors.
> 
> No, don't do that.  This GPIO is optional.
> 
>> The second option is to say something like:
>>
>> 	if (IS_ERR(lp87565->reset_gpio)) {
>> 		ret = dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
>> 				    "no GPIO error for ->reset_gpio");
>> 		if (ret == -EPROBE_DEFER)
>> 			return;
>> 		lp87565->reset_gpio = NULL;
>> 	}
> 
> Works for me.
> 
> Or:
> 
>     if (!IS_ERR(lp87565->reset_gpio))
> 
> Or stick it in the else.
> 

As the author of the code to blame, I wrote this patch, but just needed
a little time to test it before sending:

    lp87565->reset_gpio = devm_gpiod_get_optional(lp87565->dev, "reset",
                                                  GPIOD_OUT_LOW);
    if (IS_ERR(lp87565->reset_gpio))
        return dev_err_probe(lp87565->dev, PTR_ERR(lp87565->reset_gpio),
                             "Failed getting reset GPIO");

    if (lp87565->reset_gpio) {
    ...

I prefer to exit on any error as it would be either -EPROBE_DEFER of a
_real_ error (e.g. GPIO already in use). If there's no GPIO specified,
then devm_gpiod_get_optional() returns NULL and libgpio ignores NULL
pointers gracefully.

Would that work?

-- 
Luca
