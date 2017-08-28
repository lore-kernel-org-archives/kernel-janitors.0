From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 28 Aug 2017 11:19:23 +0000
Subject: Re: [PATCH] powerpc/44x: mask and shift to zero bug
Message-Id: <87lgm4ueh0.fsf@concordia.ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825103340.op3uphrv3eyeutiz@mwanda>
 <1503809791.3814.43.camel@kernel.crashing.org>
 <20170828075705.dxyoqyxgmd3ila3g@mwanda>
In-Reply-To: <20170828075705.dxyoqyxgmd3ila3g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Matthias Fuchs <matthias.fuchs@esd-electronics.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Sun, Aug 27, 2017 at 02:56:31PM +1000, Benjamin Herrenschmidt wrote:
>> On Fri, 2017-08-25 at 13:33 +0300, Dan Carpenter wrote:
>> > My static checker complains that 0x00001800 >> 13 is zero.  Looking at
>> > the context, it seems like a copy and paste bug from the line below and
>> > probably 0x3 << 13 or 0x00006000 was intended.
>> >=20
>> > Fixes: 2af59f7d5c3e ("[POWERPC] 4xx: Add 405GPr and 405EP support in b=
oot wrapper")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> > Not tested!
>> >=20
>> > diff --git a/arch/powerpc/boot/4xx.c b/arch/powerpc/boot/4xx.c
>> > index 9d3bd4c45a24..f7da65169124 100644
>> > --- a/arch/powerpc/boot/4xx.c
>> > +++ b/arch/powerpc/boot/4xx.c
>> > @@ -564,7 +564,7 @@ void ibm405gp_fixup_clocks(unsigned int sys_clk, u=
nsigned int ser_clk)
>> >  		fbdv =3D 16;
>> >  	cbdv =3D ((pllmr & 0x00060000) >> 17) + 1; /* CPU:PLB */
>> >  	opdv =3D ((pllmr & 0x00018000) >> 15) + 1; /* PLB:OPB */
>> > -	ppdv =3D ((pllmr & 0x00001800) >> 13) + 1; /* PLB:PCI */
>> > +	ppdv =3D ((pllmr & 0x00006000) >> 13) + 1; /* PLB:PCI */
>> >  	epdv =3D ((pllmr & 0x00001800) >> 11) + 2; /* PLB:EBC */
>> >  	udiv =3D ((cpc0_cr0 & 0x3e) >> 1) + 1;=20
>>=20
>> That rings a bell... Is this something we tried to fix before and had
>> problems ? The thing is when I opened the 405GP and EP manual PDF,
>> evince had memorized that this register was the last page I looked at
>> :-) And I don't remember how many years ago that is.
>>=20
>> According to the 405gp spec ppdv is IBM bits 17,18 so your patch is
>> correct.
>>=20
>> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> Hm...  I did a search through my mailbox and you're right we discussed
> this before.
>
> [bug report] [POWERPC] 4xx: Add 405GPr and 405EP support in boot wrapper
>
> I sent this email during kernel summit and neither of us could send a
> patch at the time and we both problem forgot.  I definitely forgot.

If you send a patch with the report, like you did this time, then it
will be remembered in patchwork. That doesn't mean we won't forget it,
but it makes is *less likely* we'll forget it :)

http://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=9327&state=
=3D%2A&archive=3Dboth

cheers
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
