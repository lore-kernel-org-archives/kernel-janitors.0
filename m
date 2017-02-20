From: Lars-Peter Clausen <lars@metafoo.de>
Date: Mon, 20 Feb 2017 20:58:39 +0000
Subject: Re: [PATCH] iio: adc: xilinx: Fix error handling
Message-Id: <83cb9e79-bf21-0c15-2086-4da4da484b18@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219202928.20296-1-christophe.jaillet@wanadoo.fr>
 <63f3a01d-4b78-f069-5aa1-c7f703b4e78e@wanadoo.fr>
In-Reply-To: <63f3a01d-4b78-f069-5aa1-c7f703b4e78e@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On 02/20/2017 09:25 PM, Christophe JAILLET wrote:
> Le 20/02/2017 =E0 09:35, Lars-Peter Clausen a =E9crit :
>> On 02/19/2017 09:29 PM, Christophe JAILLET wrote:
>>> Reorder error handling labels in order to match the way resources have
>>> been allocated.
>>>
>>> Signed-off-by: Christophe JAILLET
>>> <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
>> Thanks, looks good.
>>
>> Acked-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.o=
rg>
>>
>> I think there is one more issue
>>
>>      ret =3D xadc->ops->setup(pdev, indio_dev, irq);
>>      if (ret)
>>          goto err_free_samplerate_trigger;
>>
>> should be
>>
>>     goto err_clk_disable_unprepare;
>>
> I agree.
>=20
> Would you like me to send a V2 with both fixes or a sepparate patch?

Up to you.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
