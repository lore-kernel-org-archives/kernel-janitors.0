From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 15:29:00 +0000
Subject: Re: [PATCH 01/10] firewire-net: Use kmalloc_array() in fwnet_broadcast_start()
Message-Id: <3b7dacb0-6387-5214-e112-19d51b053e19@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
 <d0a380d4-a0a5-137c-054f-ac14d441f2af@users.sourceforge.net>
 <20160924134110.35e63471@kant>
In-Reply-To: <20160924134110.35e63471@kant>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: linux1394-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

>> @@ -1103,8 +1103,7 @@ static int fwnet_broadcast_start(struct fwnet_devi=
ce *dev)
>> =20
>>  	max_receive =3D 1U << (dev->card->max_receive + 1);
>>  	num_packets =3D (FWNET_ISO_PAGE_COUNT * PAGE_SIZE) / max_receive;
>> -
>> -	ptrptr =3D kmalloc(sizeof(void *) * num_packets, GFP_KERNEL);
>> +	ptrptr =3D kmalloc_array(num_packets, sizeof(*ptrptr), GFP_KERNEL);
>>  	if (!ptrptr) {
>>  		retval =3D -ENOMEM;
>>  		goto failed;
>=20
> Coccinelle enabled you to determine that kmalloc_array /could/ be used he=
re.

A script for the semantic patch language pointed hundreds of source files o=
ut
with such software update opportunities.


> But whether it /should/ be used here is another question, and it is
> not addressed in your changelog.

I can expand the corresponding description when it will be desired.


> (You state that there is an "issue" but do not explain.)

Do you prefer an other wording for such an update candidate?


> kmalloc_array is a kmalloc wrapper which adds an inline check for integer
> overflow.  So, can sizeof(void *) * num_packets ever overflow size_t?
>=20
> If yes,

Is there a probability that the calculated number of packets will become
too big for the preferred system limits anyhow?


> 	do we want a runtime check here (which kmalloc_array provides),

Did you notice the information from the commit "mm: faster kmalloc_array(),=
 kcalloc()"
(from 2016-07-26) already?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=
=91c6a05f72a996bee5133e76374ab3ad7d3b9b72


> 	or do we want a compile-time check?

I guess that some software developers and subsystem maintainers are looking
for a bit more clarification around involved design dependencies.


> If no,
> 	then the remaining benefit of the patch is that it is more obvious
> 	to the reader that dev->broadcast_rcv_buffer_ptrs is an array,

How do you value such a kind of source code annotation?


> 	but possibly at the cost of superfluous code.

How do you think about to care for a bit more consistent use of Linux progr=
amming interfaces?


> 	Is gcc's optimizer able to resolve kmalloc_array's check at compile time
> 	as always false, such that the superfluous code is eliminated as dead co=
de?

Which versions of compiler implementations would you like to check further?


> I believe I know answers to this but prefer to hear what you as the patch
> author think about it.

I presented another update suggestion also for this software module as a re=
sult
from a general source code search pattern.
The corresponding change acceptance varies and is evolving as usual.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
