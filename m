From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Sat, 05 Mar 2005 10:07:39 +0000
Subject: Re: [KJ] compile warnings due to change of pci resource element type
Message-Id: <200503051306.05937.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39879878394033419=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42287935.30573.366952@localhost>
In-Reply-To: <42287935.30573.366952@localhost>
To: kernel-janitors@vger.kernel.org

--===============39879878394033419==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Saturday 05 March 2005 11:33, Stephen Biggs wrote:

> >  But you need to convert: 
> > 	"%lx", resource_variable
> >  to:
> > 	"%llx", (unsigned long long)resource_variable
> > 
> > to make it work on all platforms.
> 
> Shouldn't it be (u64) instead of (unsigned long long)?  

No. Otherwise it will generate warnings on 64-bit machines. Ie:

drivers/block/aoe/aoeblk.c:245: warning: long long unsigned int format, u64 arg (arg 2)
drivers/block/aoe/aoeblk.c:31: warning: long long unsigned int format, u64 arg (arg 4)

	Alexey

--===============39879878394033419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39879878394033419==--
