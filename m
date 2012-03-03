From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sat, 03 Mar 2012 09:16:43 +0000
Subject: Re: [Bridge] [PATCH 2/3] netfilter: potential null derefence.
Message-Id: <CAOD=uF4qvMZ3aa+x_aXS+SvxYQ46HnQEjkvO7Mwh=sHdhoHM1A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330593434-19275-1-git-send-email-santoshprasadnayak@gmail.com>
	<20120301123004.GA7250@1984>
	<4F513C2B.6030604@pandora.be>
In-Reply-To: <4F513C2B.6030604@pandora.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org, davem@davemloft.net, bart.de.schuymer@pandora.be, netfilter-devel@vger.kernel.org, shemminger@vyatta.com

Hi Bart,
         Its good to do the testing before rolling up the patch
but code analysis shows there is a potential bug.

For cs=3DNULL the following statement will cause crash.
       i =3D cs[sp].n

The aim of this patch is to avoid possible null dereference.


Regards
Santosh

On Sat, Mar 3, 2012 at 3:01 AM, Bart De Schuymer <bdschuym@pandora.be> wrot=
e:
> Op 1/03/2012 13:30, Pablo Neira Ayuso schreef:
>
>> On Thu, Mar 01, 2012 at 02:47:14PM +0530, santosh nayak wrote:
>>>
>>> From: Santosh Nayak<santoshprasadnayak@gmail.com>
>>>
>>> I am getting following error.
>>> " net/bridge/netfilter/ebtables.c:269 ebt_do_table()
>>> =A0 error: potential null derefence 'cs'"
>>>
>>> =A0 =A0 i =3D cs[sp].n; =A0// If cs =3D Null then this will cause probl=
em.
>>
>>
>> Very sorry, I didn't see the out label.
>>
>> I'll apply this to my nf [1] once David takes my previous request for
>> pulling.
>>
>
> Hi,
>
> Has this patch been tested? Really, that code in the core firewall functi=
on
> is there for a reason, wouldn't you think?
> The chainstack is only allocated when user-defined chains are used (see
> translate_table).
> Never blindly trust a tool.
>
> Bart
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
