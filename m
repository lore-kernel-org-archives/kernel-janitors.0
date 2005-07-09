From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Sat, 09 Jul 2005 04:27:04 +0000
Subject: Re: [KJ] [PATCH 5/15] FlashPoint: remove UINT
Message-Id: <20050709012704.084995f2.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57739932814321038=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507070304.01967.adobriyan@gmail.com>
In-Reply-To: <200507070304.01967.adobriyan@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============57739932814321038==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Alexey Dobriyan <adobriyan@gmail.com>
Sent on  Thu, 7 Jul 2005 03:04:01 +0400

>     ULONG count,addr,tmpSGCnt;
> -   UINT sg_index;
> +   unsigned int sg_index;

I'm just curious: is there any reason to go from UINT to unsigned int and
not (also) from ULONG to unsigned long?

Thanks in advance :)

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============57739932814321038==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57739932814321038==--
