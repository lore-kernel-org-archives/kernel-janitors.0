From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Wed, 28 Sep 2005 18:20:50 +0000
Subject: Re: [KJ] Need to get some very basic things sorted out
Message-Id: <20050928152050.4ac2ba6f.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99232812936935133=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433AB34E.90509@users.sourceforge.net>
In-Reply-To: <433AB34E.90509@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============99232812936935133==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Alexey Dobriyan <adobriyan@gmail.com>
Sent on  Wed, 28 Sep 2005 21:56:14 +0400

Hello,

> 	buf = kmalloc(256, GFP_KERNEL);
> 	if (!buf)
> 		return -ENOMEM;
> 	buf[0] = 'L';

*please* correct me if I'm wrong, but I remember reading somewhere a Linus'
message stating that one should not use "if (!pointer)" for pointers when
it is intended to do "if (pointer == NULL)".  in short, what I remember is
that one should not assume that NULL == 0, thus the explicit NULL checking.

a quick search revealed these:

	http://lwn.net/Articles/93574/
	http://lwn.net/Articles/93577/

are these still valid?  (I presume yes, but...)

Regards.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============99232812936935133==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99232812936935133==--
