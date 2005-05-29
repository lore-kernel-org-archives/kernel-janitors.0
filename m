From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Sun, 29 May 2005 15:44:12 +0000
Subject: Re: [KJ] GCC4 cleanup question
Message-Id: <20050529124412.207991b8.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57260157338593842=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4297ECD9.2060505@gmail.com>
In-Reply-To: <4297ECD9.2060505@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============57260157338593842==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Bongani Hlope <bonganilinux@mweb.co.za>
Sent on  Sat, 28 May 2005 08:25:54 +0200

> I don't have GCC4, the first rth is initialised inside the
> __mkroute_input function and the second one is initialised in the
> __mkroute_output function. I don't know why gcc is giving those warings. 

My guess is because it doesn't know/see that.  Wouldn't that be related to
the new interprocedural optimization?

More info, perhaps starting on:

	http://gcc.gnu.org/wiki/Interprocedural%20optimizations

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============57260157338593842==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57260157338593842==--
