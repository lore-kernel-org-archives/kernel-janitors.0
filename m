From: Oleg Verych <olecom@flower.upol.cz>
Date: Fri, 16 Feb 2007 16:13:22 +0000
Subject: Nack Re: [KJ] [PATCH] is_power_of_2 in ia64mm
Message-Id: <slrnetbmim.fkn.olecom@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

> From: Vignesh Babu BM
> Newsgroups: gmane.linux.kernel.janitors,gmane.linux.kernel.mm,gmane.linux=
.ports.ia64,gmane.linux.kernel
> Subject: [KJ] [PATCH] is_power_of_2 in ia64mm
> Date: Fri, 16 Feb 2007 17:33:55 +0530

[]
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2

And this may be
* not_odd()
* ! odd()
* even()
* etc.

So, let's do not turn C in English, huh?

____


-------------------------------------------------------------------------
Take Surveys. Earn Cash. Influence the Future of IT
Join SourceForge.net's Techsay panel and you'll get the chance to share your
opinions on IT & business topics through brief surveys-and earn cash
http://www.techsay.com/default.php?page=3Djoin.php&p=3Dsourceforge&CID=DEVD=
EV
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
