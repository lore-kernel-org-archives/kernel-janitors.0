From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 10 Mar 2007 13:35:10 +0000
Subject: Re: [KJ] semaphores versus mutexes
Message-Id: <Pine.LNX.4.64.0703100834110.7045@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1442216924-1173533710=:7045"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703082031050.14629@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703082031050.14629@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1442216924-1173533710=:7045
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Mar 2007, Artur D'Assump=E7=E3o wrote:

> Hi Robert,
>
> Mutexes are a relatively recent addon to the kernel (2.6.16 I think).
>
> In the old days of the linux kernel, I think semaphores where almost the =
only
> blockable syncronization primitive available. Meanwhile, many other
> implementations have appeared, that offered more optimization for specific
> situations, previously covered by semaphores, for instance:
>    - R/W Semaphores
>    - Completions (kernel 2.4 ?)
>    - And recently mutexes.
>
> Has you can imagine, most of the semaphores usage, where to cover these
> previsous situations. Mutexes are no exception. I don't think there is mu=
ch
> code using semaphores for allowing more than one process inside the criti=
cal
> region, and if there is, it should be possible to port it to one of the
> available alternatives.
>
> With the appearing of a specific Mutex implementation (the missing link),
> unless i'm missing something, i believe that the semaphore API should be =
in
> it's way out of the kernel soon. So, code that uses semaphores has a mutu=
al
> exclusion primitive or even, to sincronize multiple execution flows, shou=
ld be
> ported to the mutex and completion API, respectively.
>
> Check here: http://lwn.net/Articles/167034/
>
> Hope i've helped,

yes, you have, thanks.  although i suspect we'll see satan ice skating
to work before all of the current semaphore occurrences are replaced
by their newer alternatives.

rday
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--0-1442216924-1173533710=:7045
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1442216924-1173533710=:7045--
