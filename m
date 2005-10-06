From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 06 Oct 2005 18:32:23 +0000
Subject: Re: [KJ] [PATCH] cris: kgdb: remove double_this()
Message-Id: <20051006153223.c17a808b.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97910491609499983=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005204541.GB27229@mipter.zuzino.mipt.ru>
In-Reply-To: <20051005204541.GB27229@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============97910491609499983==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Alexey Dobriyan <adobriyan@gmail.com>
Sent on  Thu, 6 Oct 2005 00:45:41 +0400

Hello,

> -int
> -double_this(int x)
> -{
> -        return 2 * x;
> -}

I'm wondering why this "2*x" wrapper was ever made.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============97910491609499983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97910491609499983==--
