From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Sun, 13 Feb 2005 18:57:24 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <420FBF34.27097.150F1D@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============607580468565732=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
To: kernel-janitors@vger.kernel.org

--===============607580468565732==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 11 Feb 2005 at 13:51, Christoph Hellwig wrote:

> On Fri, Feb 11, 2005 at 02:45:20PM +0100, walter harms wrote:
> > void __iomem *)ioaddr->feature_addr);
> 
> this bit looks very wrong.  What type is ioaddr->feature_addr?  It really
> should be a pointer to <whatever> __iomem and not cast would be needed.
> 
> 
It is declared as "unsigned long".  If you do a findall and grep for 
feature_addr, you will find that it is used in a lot of math before being 
stored.

So, if you change the declarations of this and the other *_addr structure 
elements to "volatile void __iomem *" then casting would need to be done 
on them in the arithmetic statements, which makes less sense because 
arithmetic is being done on "void *".

It's 6 of one, half a dozen of the other.  IMHO, my solution is a bit 
cleaner.



--===============607580468565732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============607580468565732==--
