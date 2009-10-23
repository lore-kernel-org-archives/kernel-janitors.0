From: Junio C Hamano <gitster@pobox.com>
Date: Fri, 23 Oct 2009 20:58:05 +0000
Subject: Re: Write and Submit Your First Kernel Patch
Message-Id: <7vskd9akv6.fsf@alter.siamese.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
 <alpine.LNX.2.00.0910231621550.14365@iabervon.org>
In-Reply-To: <alpine.LNX.2.00.0910231621550.14365@iabervon.org> (Daniel
 Barkalow's message of "Fri\, 23 Oct 2009 16\:33\:04 -0400 \(EDT\)")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel Barkalow <barkalow@iabervon.org>
Cc: Kevyn-Alexandre =?utf-8?Q?Par=C3=A9?= <kevyn.alexandre.pare@gmail.com>, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

Daniel Barkalow <barkalow@iabervon.org> writes:

> On Fri, 23 Oct 2009, Kevyn-Alexandre Par=C3=A9 wrote:
>
>> Just before I send my patch I got this error with:
>> ./scripts/checkpatch.pl --terse --file
>> 0001-Staging-comedi-driver-fix-coding-style.patch
>
> You're using checkpatch --file on a patch. I hope you don't intend your=20
> patch to be added to the kernel source as a file, but rather applied to=20
> the kernel source, changing other files. (I bet "gcc 0001-Staging*.patch"=
=20
> will get interesting errors, too...) The patch format adds a single=20
> character at the beginning of each line to say whether it's a addition, a=
=20
> deletion, or a context line, and the context lines are identified by a=20
> space character. This means that a blank context line consists of just=20
> this space character, which is therefore a trailing space. We get the sam=
e=20
> type of complaints when we have expected diff output in our test scripts.
>
> I'm kind of surprised that checkpatch doesn't completely blow up when it'=
s=20
> expecting a source file and getting a patch (and maybe tell you what=20
> you've done). But that's the source of your errors, anyway.

Ah, your analysis is correct.  This is a usage error of checkpatch script
and there is nothing for us to worry about.

Thanks; I also failed to spot --file option when I responded.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
