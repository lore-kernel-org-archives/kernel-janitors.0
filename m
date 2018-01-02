From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 02 Jan 2018 14:43:01 +0000
Subject: =?UTF-8?Q?Re=3A_Rename_the_SmPL_script_=E2=80=9Ckzalloc-=E2=80=A6=2Ecocci=E2=80=9D=3F?=
Message-Id: <alpine.DEB.2.20.1801021541070.24055@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1008439410-1514904181=:24055"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ae67a02e-7257-c7e0-f4a1-bdf35a3bb2d0@users.sourceforge.net>
 <alpine.DEB.2.20.1801021528160.24055@hadrien>
 <96aee198-15b2-dc96-a349-d8a70d06dc67@users.sourceforge.net>
In-Reply-To: <96aee198-15b2-dc96-a349-d8a70d06dc67@users.sourceforge.net>
To: cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1008439410-1514904181=:24055
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 2 Jan 2018, SF Markus Elfring wrote:

> >> Now I find that it became more advanced than the previous version.
> >> How do you think about to update also the corresponding file name
> >> (instead of keeping the word “simple” there)?
> >
> > Why not send a patch for it yourself?
>
> * I would like to check your views around renaming of such files.
>
> * I am unsure which name will be better finally.
>   Would we like to achieve another permalink here?

Actually, according to th original name choice it is stillsimple, becaue
it doesn't account for the possibility of many statement between the alloc
and the memset and it doesn't account for different ways of expressing the
size between the two calls.

If you want to be more general than kzalloc, then perhaps
zalloc-simple.cocci would be ok.

julia
--8323329-1008439410-1514904181=:24055--
