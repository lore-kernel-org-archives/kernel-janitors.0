From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 21:34:50 +0000
Subject: Re: [kj][Patch] remove implicit sign bit on single bit
Message-Id: <20060220213450.GE29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36362986767986083=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139372248.9409.15.camel@localhost.localdomain>
In-Reply-To: <1139372248.9409.15.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============36362986767986083==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 09, 2006 at 09:21:24PM +1100, Darren Jenkins" wrote:
> --- linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c.orig
> +++ linux-2.6.16-rc2/sound/oss/via82cxxx_audio.c
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

These patches are OK, except

	unsigned int a:1;

is preferred. 


--===============36362986767986083==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36362986767986083==--
