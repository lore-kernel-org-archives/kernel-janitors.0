From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 19:29:20 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <1140636560.29648.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90153495395437444=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============90153495395437444==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> > $ make allyesconfig
> > $ make fs/proc/kcore.o
> 
> How on earth did this succeed? I always, always get

works for me too... maybe there were some values
still set and not changed by allyesconfig?
if you want to compare .configs, i placed mine at
http://www.snake-basket.de/misc/config

cu Eric


--===============90153495395437444==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90153495395437444==--
