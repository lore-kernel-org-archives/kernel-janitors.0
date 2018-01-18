From: Corey Minyard <tcminyard@gmail.com>
Date: Thu, 18 Jan 2018 14:05:22 +0000
Subject: Re: [PATCH -next] ipmi/powernv: Fix error return code in ipmi_powernv_probe()
Message-Id: <6ab96d83-5ec3-e882-7bfc-fe072c101666@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516188311-144227-1-git-send-email-weiyongjun1@huawei.com>
 <fb154ee5-4934-f6f8-dae5-168c03f0d3a5@ozlabs.ru>
In-Reply-To: <fb154ee5-4934-f6f8-dae5-168c03f0d3a5@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Wei Yongjun <weiyongjun1@huawei.com>, Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/17/2018 10:04 PM, Alexey Kardashevskiy wrote:
> On 17/01/18 22:25, Wei Yongjun wrote:
>> Fix to return a negative error code from the request_irq() error
>> handling case instead of 0, as done elsewhere in this function.
>>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Queued for next release.=C2=A0 Thanks!

-corey

>
>
>> ---
>>   drivers/char/ipmi/ipmi_powernv.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/ipmi_powernv.c b/drivers/char/ipmi/ipmi_p=
owernv.c
>> index c687c8d..bcf493d 100644
>> --- a/drivers/char/ipmi/ipmi_powernv.c
>> +++ b/drivers/char/ipmi/ipmi_powernv.c
>> @@ -250,8 +250,9 @@ static int ipmi_powernv_probe(struct platform_device=
 *pdev)
>>   		ipmi->irq =3D opal_event_request(prop);
>>   	}
>>  =20
>> -	if (request_irq(ipmi->irq, ipmi_opal_event, IRQ_TYPE_LEVEL_HIGH,
>> -				"opal-ipmi", ipmi)) {
>> +	rc =3D request_irq(ipmi->irq, ipmi_opal_event, IRQ_TYPE_LEVEL_HIGH,
>> +			 "opal-ipmi", ipmi);
>> +	if (rc) {
>>   		dev_warn(dev, "Unable to request irq\n");
>>   		goto err_dispose;
>>   	}
>>
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
