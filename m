From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 19 Aug 2005 21:15:17 +0000
Subject: Re: [KJ] [PATCH] mtd: remove compatmac.h
Message-Id: <20050819211517.GL3682@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14452010936786763=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
In-Reply-To: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============14452010936786763==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 20, 2005 at 12:56:32AM +0400, Alexey Dobriyan wrote:

> File is effectively empty.
>...

That's expected.

The trick is that it's non-empty in 2.4 and provides some code for 
letting 2.6 code running on 2.4 .

As long as the MTD maintainer wants to share the code between 2.4 and 
2.6 your patch makes his life much harder.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============14452010936786763==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14452010936786763==--
