From: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 15 Sep 2020 08:41:54 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <14193442-3b41-29f2-4380-e2cbcc00e5d4@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
In-Reply-To: <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: David Woodhouse <dwmw2@infradead.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>



On 14/09/2020 16:12, David Woodhouse wrote:
> On Mon, 2020-09-14 at 16:01 +0200, Lukas Bulwahn wrote:
>>>> I am not subscribed to linux-mediatek. When I sent an email to the lis=
t,
>>>> it showed up really seconds later in the lore.kernel.org of the
>>>> linux-mediatek public-inbox repository. So, either it was delivered
>>>> quickly as it is not moderated or my check with lore.kernel.org is wro=
ng,
>>>> e.g., mails show up in the lore.kernel.org archive, even they were not
>>>> yet permitted on the actual list.
>>>>
>>>
>>> I'm the moderator and I get requests to moderate emails. I suppose I ad=
ded you
>>> to the accepted list because of earlier emails you send.
>>>
>>
>> Okay, I see. I did send some clean-up patch in the past, but I completely
>> forgot that, but my mailbox did not forget. So, now it is clear to me why
>> that mail showed up so quickly.
>>
>> Thanks for the explanation.
>=20
> AFAICT the linux-mediatek list isn't configured to automatically
> moderate messages from non-subscribers. Its generic_nonmember_action
> setting is 'Accept'. That is the default setting for lists on
> infradead.org and I strongly encourage list maintainers to leave it
> that way.

Ok, thanks for clarification. I never bothered too much with all the=20
configuration option of the list. :|

>=20
> Lukas, I don't see your address in the allowlist either.

I tried to find that in the web interface, but wasn't able to find the list.

Regards,
Matthias

>=20
> There are other reasons why some messages get might trapped for
> moderation =E2=80=94 the message size, number of recipients, spam score, =
etc.
>=20
> The mere fact that *some* messages are moderated does not mean that the
> list is "moderated for non-subscribers" in the sense that the
> MAINTAINERS file lists.
>=20
>> Bjorn, with that confirmation and Reviewed-by from Matthias, could you
>> please pick this patch?
>=20
> I think we should be fixing the ones that *do* say it's moderated for
> non-subscribers, not the one that correctly didn't :)
>=20
