From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 14:02:39 +0000
Subject: Re: [KJ] [PATCH] net/sunrpc string * to [] fix
Message-Id: <20050526110239.6e563c48.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85046330989222563=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050525183354.2ba9953a.rnsanchez@terra.com.br>
In-Reply-To: <20050525183354.2ba9953a.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============85046330989222563==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Domen Puncer <domen@coderock.org>
Sent on  Thu, 26 May 2005 08:15:42 +0200

> Care to resend disk.c patch, as it's missing Signed-off-by (and
> this seems to be the only thing wrong with it).

After taking a new look over the code, I noticed that this patch would
break stuff.  As the string is modified afterwards (with an assignment), it
would compile fail.  I surely overlooked it.  Sorry :)

So, my very first patch is broken :)
Please disregard (and/or drop) it.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============85046330989222563==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85046330989222563==--
