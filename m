From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 01 Jun 2020 11:31:23 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <a2e34c9a-676f-d83f-f395-7428af038c16@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 <87h7vvb1s3.fsf@belgarion.home>
In-Reply-To: <87h7vvb1s3.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linus.walleij@linaro.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, haojian.zhuang@gmail.com, linux-gpio@vger.kernel.org, daniel@zonque.org, linux-arm-kernel@lists.infradead.org

Le 01/06/2020 à 10:58, Robert Jarzmik a écrit :
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
>
>> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
>> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
>> 'pxa2xx_pinctrl_init()'.
>> However, the corresponding 'pinctrl_unregister()' call in
>> 'pxa2xx_pinctrl_exit()' has not been removed.
>>
>> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
>> Remove it now to avoid some wondering in the future and save a few LoC.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Would be even a better patch with a :
> Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")

I was wondering it was was needed in this case.
The patch does not really fix anything, as the function is unused. Or it 
fixes things on a theoretical point of view.

CJ


> Cheers.
>
> --
> Robert
>
