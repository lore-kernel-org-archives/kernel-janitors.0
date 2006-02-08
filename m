From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 08 Feb 2006 04:39:36 +0000
Subject: Re: [kj][Patch] remove implicit sign bit on single bit
Message-Id: <20060207203936.14b1146f.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============011334399135912498=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139372248.9409.15.camel@localhost.localdomain>
In-Reply-To: <1139372248.9409.15.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============011334399135912498==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 08 Feb 2006 15:17:27 +1100 Darren Jenkins\\ wrote:

> Hi,
> 
> This is my first patch so I hope I get everything right.
> 
> http://linuxicc.sourceforge.net/
> 
> Warnings/Error while compiling with Intel C Compiler
> 
> Says there is a Warning #108: implictly-signed bit field of length 1
> 
> in sound/oss/viacXXX_audio.c @ line number 310
> 
> looking at the code it seems like it is supposed to be a single bit
> field used as a lock. This just makes it unsigned.

BTW, sparse also complains about this one (and other problems in
general and "signed 1-bit fields" in many places):
sound/oss/via82cxxx_audio.c:310:21: error: dubious one-bit signed bitfield


> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> 
> --- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig	2006-02-08
> 13:43:27.000000000 +1100
> +++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c	2006-02-08
> 13:45:39.000000000 +1100
> @@ -306,9 +306,8 @@ struct via_info {
>  	unsigned intmask: 1;	/* Needs int bits */
>  	unsigned sixchannel: 1;	/* 8233/35 with 6 channel support */
>  	unsigned volume: 1;
> +	unsigned locked_rate : 1;
>  
> -	int locked_rate : 1;
> -	
>  	int mixer_vol;		/* 8233/35 volume  - not yet implemented */
>  
>  	struct semaphore syscall_sem;


---
~Randy

--===============011334399135912498==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============011334399135912498==--
