From: Adrian Hunter <adrian.hunter@nokia.com>
Date: Mon, 20 Jul 2009 12:43:07 +0000
Subject: Re: [PATCH 9/10] drivers/mmc: Move a dereference below a NULL test
Message-Id: <4A64665B.9000504@nokia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191729580.16542@ask.diku.dk>	 <4A642458.6080008@nokia.com> <c656a4d20907200533t1cbe1476l62d8a51fdb796c70@mail.gmail.com>
In-Reply-To: <c656a4d20907200533t1cbe1476l62d8a51fdb796c70@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: arun c <arun.edarath@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, "Lavinen Jarkko (Nokia-D/Helsinki)" <jarkko.lavinen@nokia.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

arun c wrote:
> On Mon, Jul 20, 2009 at 1:31 PM, Adrian Hunter<adrian.hunter@nokia.com> w=
rote:
>> Julia Lawall wrote:
>>> From: Julia Lawall <julia@diku.dk>
>>>
>>> If the NULL test is necessary, then the dereference should be moved bel=
ow
>>> the NULL test.
>>>
>>> The semantic patch that makes this change is as follows:
>>> (http://www.emn.fr/x-info/coccinelle/)
>>>
>>> // <smpl>
>>> @@
>>> type T;
>>> expression E,E1;
>>> identifier i,fld;
>>> statement S;
>>> @@
>>>
>>> - T i =3D E->fld;
>>> + T i;
>>>  ... when !=3D E=E1
>>>      when !=3D i
>>>  BUG_ON (E =3D NULL||
>>> -     i
>>> +     E->fld
>>>       =3D NULL || ...);
>>> + i =3D E->fld;
>>> // </smpl>
>>>
>>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>>
>>> ---
>>>  drivers/mmc/host/omap.c             |    5 +++--
>>>  1 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
>>> index e7a331d..89281ab 100644
>>> --- a/drivers/mmc/host/omap.c
>>> +++ b/drivers/mmc/host/omap.c
>>> @@ -255,11 +255,12 @@ static void mmc_omap_slot_release_work(struct
>>> work_struct *work)
>>>   static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int
>>> clk_enabled)
>>>  {
>>> -       struct mmc_omap_host *host =3D slot->host;
>>> +       struct mmc_omap_host *host;
>>>        unsigned long flags;
>>>        int i;
>>>  -       BUG_ON(slot =3D NULL || host->mmc =3D NULL);
>>> +       BUG_ON(slot =3D NULL || slot->host->mmc =3D NULL);
>>> +       host =3D slot->host;
>>>          if (clk_enabled)
>>>                /* Keeps clock running for at least 8 cycles on valid fr=
eq
>>> */
>>> --
>> If slot is NULL it will oops anyway, so the following is better IMHO:
>>
>> static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int
>> clk_enabled)
>> {
>>        struct mmc_omap_host *host =3D slot->host;
>>        unsigned long flags;
>>        int i;
>>
>>> -       BUG_ON(slot =3D NULL || host->mmc =3D NULL);
>>> +       BUG_ON(host->mmc =3D NULL);
>>        if (clk_enabled)
>>                /* Keeps clock running for at least 8 cycles on valid fre=
q */
>> --
>=20
> According to http://isc.sans.org/diary.html?storyidh20&rss "NULL check"
> must be done before assigning the values. Does Julia Lawall's version
> is the more correct one??
>=20
> Arun

It is not a "NULL check" it is an assertion, which can be compiled out.
On some platforms BUG is implemented as a null dereference anyway
e.g. on ARM  it is *(int *)0 =3D 0;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
