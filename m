From: Junio C Hamano <gitster@pobox.com>
Date: Fri, 23 Oct 2009 19:52:18 +0000
Subject: Re: Write and Submit Your First Kernel Patch
Message-Id: <7v8wf1c2h9.fsf@alter.siamese.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
In-Reply-To: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
 ("Kevyn-Alexandre =?utf-8?Q?Par=C3=A9=22's?= message of "Fri\, 23 Oct 2009
 14\:46\:24 -0400")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kevyn-Alexandre =?utf-8?Q?Par=C3=A9?= <kevyn.alexandre.pare@gmail.com>
Cc: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

Kevyn-Alexandre Par=C3=A9  <kevyn.alexandre.pare@gmail.com> writes:

> Just before I send my patch I got this error with:
> ./scripts/checkpatch.pl --terse --file
> 0001-Staging-comedi-driver-fix-coding-style.patch
>
> 0001-Staging-comedi-driver-fix-coding-style.patch:27: ERROR: trailing whi=
tespace
> 0001-Staging-comedi-driver-fix-coding-style.patch:35: ERROR: trailing whi=
tespace
> 0001-Staging-comedi-driver-fix-coding-style.patch:43: ERROR: trailing whi=
tespace
> 0001-Staging-comedi-driver-fix-coding-style.patch:53: ERROR: trailing whi=
tespace
>
> I have done a step by step explanation of what I have done:
> http://kapare.blogspot.com/2009/09/write-and-submit-your-first-kernel.html
>
> It seem to me that the whitespace are added after I do this command:
> git format-patch -s -n master..mybranch

"The whitespace are added after..." sounds to me that what you committed
were checkpatch compliant, and format-patch somehow broke it.  If that is
the case we need to fix format-patch.

Please check if "git show $commit" output for the commit that corresponds
to the "[Staging] comedi driver: fix coding style" patch has trailing
whitespaces.  That is what you committed.

If there already is whitespace breakage in what you committed, then we do
not have to blame format-patch and look for bugs in it to fix.

Otherwise, please send 0001-*.patch (output from format-patch) and output
from that "git show $commit" as separate attachments, so that we can debug
and fix format-patch.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
