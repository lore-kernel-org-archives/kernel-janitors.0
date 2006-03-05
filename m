From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 20:50:18 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in  lib/
Message-Id: <1141591818.15828.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4099005204867936=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141548097.6426.9.camel@alice>
In-Reply-To: <1141548097.6426.9.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============4099005204867936==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,
> > This will screw ia64.
> > 
> 
> I don't see how it would even compile in the first place.  But would you
> mind explaining how this would screw ia64?

thats why it would screw ia64. It seems to not get compiled on i386,
thats why my "make lib/" didnt catch it

Eric


--===============4099005204867936==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4099005204867936==--
