From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 25 Jan 2005 18:54:16 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <200501252151.08873.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0075777394882230453=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============0075777394882230453==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 25 January 2005 16:28, Domen Puncer wrote:

> --- TODO-1.26
> +++ TODO-1.27

> +E: example patch

Really like this.

> +- get rid of verify_area with copy_*_user get/put_user

verify_area is semi-deprecated. At least nobody objected. 

http://marc.theaimsgroup.com/?t=110506109900003&r=1&w=2
http://marc.theaimsgroup.com/?l=linux-kernel&m=110557975201349&w=2

> +- printk() calls should include appropriate KERN_* constant

> http://linux.bkbits.net:8080/linux-2.5/patch@1.1555

Lets look at it more closely:

	-		if (i < 3)
	-			if (ZERO) printk ("%d: 0x%8.8x\n", i, leptr);
	+		if (i < 3 && ZERO)
	+			printk(KERN_DEBUG "%d: 0x%8.8x\n", i, leptr);

Technically leptr is int which is made from pointer through macro obfuscation. 
And one shouldn't printk pointers in a non portable way. Quote from Al Viro:

	One more thing: folks, please stop using crap like "%08x", (int)pointer.
	It's not only non-portable (consider 64bit boxen), it's extra work for
	no good reason.  "%p" is standard and will do the right thing with less
	PITA.

> +- fix warnings/errors
> +  [D: http://developer.osdl.org/~cherry/compile/]
> +  [D: http://www.osdl.org/projects/26lnxstblztn/results/]

> +- Fix gcc 4 warnings.

Also sparse warnings? Use -Wbitwise for _even more_ janitor work. :-)

Today somebody mentioned "make randconfig" on lkml. What about

	$ make randconfig
	Find out why it doesn't build. Don't forget to save .config.	?

I can add these three in a couple of days.

	Alexey

--===============0075777394882230453==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0075777394882230453==--
