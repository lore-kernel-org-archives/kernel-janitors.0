From: Oleg Verych <olecom@flower.upol.cz>
Date: Fri, 16 Feb 2007 17:10:03 +0000
Subject: Re: [KJ] how do config options disappear from the "defconfig" files?
Message-Id: <slrnetbpsv.fkn.olecom@flower.upol.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

> From: "Robert P. J. Day"
> Newsgroups: gmane.linux.kernel.janitors
> Subject: [KJ] how do config options disappear from the "defconfig" files?
> Date: Fri, 16 Feb 2007 09:40:46 -0500 (EST)

>   i just want to clarify one point about all of the defconfig files in
> the source tree.  if a CONFIG option is removed from the Kconfig
> infrastructure, does that corresponding entry eventually disappear
> from all of the defconfig files based on an automatic build at some
> point?  thanks.

AFAIK defconfigs are generated and updated by ARCH maintainers.

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
