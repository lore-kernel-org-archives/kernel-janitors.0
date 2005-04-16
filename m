From: Domen Puncer <domen@coderock.org>
Date: Sat, 16 Apr 2005 11:56:59 +0000
Subject: Re: [KJ] [patch] net/8139too: use iomap interface
Message-Id: <20050416115659.GA18554@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10956489726325458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050415205832.GA3880@masina.coderock.org>
In-Reply-To: <20050415205832.GA3880@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============10956489726325458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/04/05 14:35 +0000, Alexey Dobriyan wrote:
> On 22:58 Fri 15 Apr 2005, Domen Puncer wrote:
> > Convert to iomap and add __iomem annotations.
> 
> > --- c/drivers/net/8139too.c
> > +++ a/drivers/net/8139too.c
> 
> In netdev-2.6 tree:

Maybe someday I'll learn to check the -mm tree first.

Thanks Alexey!


	Domen

--===============10956489726325458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10956489726325458==--
