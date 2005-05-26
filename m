From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 17:29:57 +0000
Subject: Re: [KJ] [PATCH 2.6.11.10] arch/arm: fixes static strings declaration
Message-Id: <20050526142957.0aaa7f49.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81598615755664061=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526120724.5f1552fb.rnsanchez@terra.com.br>
In-Reply-To: <20050526120724.5f1552fb.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============81598615755664061==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Sent on  Thu, 26 May 2005 12:07:24 -0300

> o Fixes strings declaration from char *str = ""; to char str[] = "";,
>   avoiding the extra pointer, as noted by Jeff Garzik.  The strings'
>   contents are not changed after declared.

Domen pointed me that this patch is likely to be incorrect, and in fact is.

Please drop this, I'll try to fix this and then submit a new patch.

Sorry for the noise.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============81598615755664061==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81598615755664061==--
