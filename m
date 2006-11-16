From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 16 Nov 2006 07:37:29 +0000
Subject: Re: [KJ] [PATCH] Fixed some errors in User Mode Linux documentation
Message-Id: <20061115233729.df9b8a07.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <454A4F89.3000006@gmail.com>
In-Reply-To: <454A4F89.3000006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 02 Nov 2006 12:05:29 -0800 David KOENIG wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I made a few fixes in the User Mode Linux documentation, but these can't
> be fixed because git doesn't detect some of the problems.  (For example,
> it doesn't realise that there are some stray backspaces that got
> injected into the file somehow.)  You can use the following commands to
> reformat everything correctly:
> 
> sed -i -e 's/\n{3,}/\n\n/g' Documentation/uml/UserModeLinux-HOWTO.txt
> sed -i -e 's/.\b//g' Documentation/uml/UserModeLinux-HOWTO.txt

It appears to be a generated file (from what source, Jeff?).

The backspaces produce underlines or strikeover (composed)
characters on printers that support such positioning.

It's a bit much for the kernel Documentation/ directory IMHO. :)

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
