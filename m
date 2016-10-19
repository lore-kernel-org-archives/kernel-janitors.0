From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 13:50:23 +0000
Subject: Re: [PATCH 4/5] [media] winbond-cir: One variable and its check less in wbcir_shutdown() after error
Message-Id: <4e23f3bc-3185-862d-e2e5-5a54620fe5e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7fe65702-ac76-39f2-edea-eba007a3ee96@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
 <84757ae3-24d2-cf9b-2217-fd9793b86078@users.sourceforge.net>
 <20161015132956.GA3393@gofer.mess.org>
 <403be317930e0915cbe98c15cd6adf66@hardeman.nu>
In-Reply-To: <403be317930e0915cbe98c15cd6adf66@hardeman.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>>> + /* Set CEIR_EN */
>>>> + wbcir_set_bits(data->wbase + WBCIR_REG_WCEIR_CTL, 0x01, 0x01);
>>>> +set_irqmask:
>>>> /*
>>>> * ACPI will set the HW disable bit for SP3 which means that the
>>>> * output signals are left in an undefined state which may cause
>>>> @@ -876,6 +858,14 @@ wbcir_shutdown(struct pnp_dev *device)
>>>> */
>>>> wbcir_set_irqmask(data, WBCIR_IRQ_NONE);
>>>> disable_irq(data->irq);
>>>> + return;
>>>> +clear_bits:
>>>> + /* Clear BUFF_EN, Clear END_EN, Clear MATCH_EN */
>>>> + wbcir_set_bits(data->wbase + WBCIR_REG_WCEIR_EV_EN, 0x00, 0x07);
>>>> +
>>>> + /* Clear CEIR_EN */
>>>> + wbcir_set_bits(data->wbase + WBCIR_REG_WCEIR_CTL, 0x00, 0x01);
>>>> + goto set_irqmask;
>>>
>>> I'm not convinced that adding a goto which goes backwards is making this
>>> code any more readible, just so that a local variable can be dropped.
>>
>> Thanks for your feedback.
>>
>> Is such a "backward jump" usual and finally required when you would like
>> to move a bit of common error handling code to the end without using extra
>> local variables and a few statements should still be performed after it?
>>
> 
> I'm sorry, I can't parse this.

Can an other update suggestion like "[PATCH 6/6] crypto-caamhash:
Move common error handling code in two functions" explain this technique
a bit better in principle?
https://patchwork.kernel.org/patch/9333861/
https://lkml.kernel.org/r/<baa5db91-27e7-ecab-f2c9-29e549b6e5f0@users.sourceforge.net>

Regards,
Markus
