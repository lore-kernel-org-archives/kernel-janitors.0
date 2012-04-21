From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 21 Apr 2012 13:19:22 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <alpine.DEB.2.02.1204211518420.1987@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-863727080-1335014362=:1987"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain> <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com> <20120420091449.GI27101@mwanda> <87vcku9sob.fsf@purkki.adurom.net> <20120421124523.GS6498@mwanda>
In-Reply-To: <20120421124523.GS6498@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kalle Valo <kvalo@adurom.com>, Julian Calaby <julian.calaby@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-863727080-1335014362=:1987
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Apr 2012, Dan Carpenter wrote:

> On Fri, Apr 20, 2012 at 09:14:44PM +0300, Kalle Valo wrote:
>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>
>>> On Fri, Apr 20, 2012 at 06:57:00PM +1000, Julian Calaby wrote:
>>>>> - =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_phy),=
 GFP_KERNEL);
>>>>> + =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_local=
), GFP_KERNEL);
>>>>
>>>> Would it be better practice to use sizeof(*m)?
>>>>
>>>
>>> That was my temptation as well...  But I decided to make it match
>>> with the surrounding code.  I'm happy to resend if people want.
>>
>> IMHO sizeof(*m) is better and I tend to use it.
>>
>> Related to this: I have a bad habit of sometimes dropping '*' from
>> sizeof()? Is there a tool which could spot that?
>>
>
> That's what I was working on for Smatch when I sent this patch.
>
> The odd thing is that I can't find any bugs like this in the kernel.
> If sizeof(foo) is less than sizeof(*foo), which is probably the
> normal case, then these get caught early on in testing.
>
> Still I think people must have done manual audits as well...  It
> feels too clean to be natural.

I sent some patches with respect to this.  But that was probably around a=20
year ago.

julia
--8323329-863727080-1335014362=:1987--
