From: mahesh krishnan k <maheshkrishnan.k@gmail.com>
Date: Fri, 05 Mar 2010 17:02:14 +0000
Subject: Re: [patch linux-next] ipmi: remove voidp casts
Message-Id: <fc8156581003050902x1a5e2062o8ce02402ee075e96@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc8156581003042210p25fcd11v4616b42fbcf87699@mail.gmail.com>
In-Reply-To: <fc8156581003042210p25fcd11v4616b42fbcf87699@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

My apologies... As you said, i think (void *) is necessary here to
convert (unsigned long) to pointer. Please ignore the patch. Should we
still keep (void *) if we have had a pointer in place of (unsigned
long)?

Thanks,
Mahesh

On Fri, Mar 5, 2010 at 1:49 AM, Julia Lawall <julia@diku.dk> wrote:
> On Fri, 5 Mar 2010, Mahesh Kalappattil wrote:
>
>> This trivial patch removes the (void *) conversion as per the kernel
>> janitor TODO list.
>
> Does that work if the original type is not a pointer type (unsigned long
> here)?
>
> julia
>
>> Signed-off-by: Mahesh Kalappattil <mahesh.lkml@gmail.com>
>>
>> --- linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
>> +++ linux-2.6.33/drivers/char/ipmi/ipmi_si_intf.c
>> @@ -2483,11 +2483,11 @@ static int __devexit ipmi_of_remove(stru
>> =A0static struct of_device_id ipmi_match[] >> =A0{
>> =A0 =A0 =A0 =A0 { .type =3D "ipmi", .compatible =3D "ipmi-kcs",
>> - =A0 =A0 =A0 =A0 .data =3D (void *)(unsigned long) SI_KCS },
>> + =A0 =A0 =A0 =A0 .data =3D (unsigned long) SI_KCS },
>> =A0 =A0 =A0 =A0 { .type =3D "ipmi", .compatible =3D "ipmi-smic",
>> - =A0 =A0 =A0 =A0 .data =3D (void *)(unsigned long) SI_SMIC },
>> + =A0 =A0 =A0 =A0 .data =3D (unsigned long) SI_SMIC },
>> =A0 =A0 =A0 =A0 { .type =3D "ipmi", .compatible =3D "ipmi-bt",
>> - =A0 =A0 =A0 =A0 .data =3D (void *)(unsigned long) SI_BT },
>> + =A0 =A0 =A0 =A0 .data =3D (unsigned long) SI_BT },
>> =A0 =A0 =A0 =A0 {},
>> =A0};
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitor=
s" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
