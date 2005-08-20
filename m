From: Christoph Hellwig <hch@infradead.org>
Date: Sat, 20 Aug 2005 09:09:10 +0000
Subject: Re: [KJ] [PATCH] mtd: remove compatmac.h
Message-Id: <20050820090910.GA21698@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68550692417600834=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
In-Reply-To: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============68550692417600834==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 19, 2005 at 11:15:17PM +0200, Adrian Bunk wrote:
> On Sat, Aug 20, 2005 at 12:56:32AM +0400, Alexey Dobriyan wrote:
> 
> > File is effectively empty.
> >...
> 
> That's expected.
> 
> The trick is that it's non-empty in 2.4 and provides some code for 
> letting 2.6 code running on 2.4 .
> 
> As long as the MTD maintainer wants to share the code between 2.4 and 
> 2.6 your patch makes his life much harder.

AFAIK mtd has branched for 2.4.x.  You might want to run this past the
maintainer.


--===============68550692417600834==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68550692417600834==--
