From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 15 Feb 2005 06:40:52 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][14/21] drivers/telephony/* - compile
Message-Id: <4211B594.8468.150B15@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44555399831434084=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.22902.52C0B1@localhost>
In-Reply-To: <42113C2D.22902.52C0B1@localhost>
To: kernel-janitors@vger.kernel.org

--===============44555399831434084==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 15 Feb 2005 at 1:47, Alexey Dobriyan wrote:

> On Tuesday 15 February 2005 00:02, Stephen Biggs wrote:
> 
> > --- linux-2.6.11-rc3-mm2-original/drivers/telephony/ixj.c
> > +++ linux-2.6.11-rc3-mm2/drivers/telephony/ixj.c
> 
> > -		if (copy_to_user(argp, ixj_c_revision, strlen(ixj_c_revision))) 
> > -			retval = -EFAULT;
> > +		sprintf(argp, "\nDriver version %i.%i.%i", IXJ_VER_MAJOR, IXJ_VER_MINOR, IXJ_BLD_VER);
> 
> argp is a userspace pointer. You _can't_ simply write to it.

*** ARRGGH ***  Yes... I just simply screwed up on this one... sorry for 
the noise to the list!

> 
> 	char tmpbuf[...];
> 
> 	sprintf(tmpbuf, "version %i ...", MAJOR, ...);
> 	if (copy_to_user(argp, tmpbuf, ...))
> 		...
> 
> 	Alexey
> 




--===============44555399831434084==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44555399831434084==--
