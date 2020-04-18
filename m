From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Apr 2020 20:55:00 +0000
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
Message-Id: <ea3d9b35-4409-fb86-8855-0ddb73989829@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
In-Reply-To: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>, linux-m68k@lists.linux-m68k.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

Le 18/04/2020 =C3=A0 22:00, Markus Elfring a =C3=A9crit=C2=A0:
>> If 'ioremap' fails, we must free 'bridge', as done in other error handli=
ng
>> path bellow.
> I suggest to improve this change description.

I suggest you stop proposing over and over useless comments.
Please just ignore my proposals as I do for your boring, never=20
constructing, replies.


> * Please avoid a typo.
>
> * Is an imperative wording preferred?
>
* is Melissa still around?

> =E2=80=A6
>> +++ b/arch/m68k/coldfire/pci.c
>> @@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
> =E2=80=A6
>
> I propose to move the pci_free_host_bridge() call for the desired

I propose to let patch submitter and maintainer decide about it.
I don't need your point of view. I guess that maintainers don't either.

No need to waste time trying to engage any discussion with me.
This is the first and very last exchange we will ever have.

Best regards,
CJ


> exception handling to the end of this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?id=C0d73a868d9b411bd2d0c8e5ff9d98bfa8=
563cb1#n450
>
> Regards,
> Markus
>
