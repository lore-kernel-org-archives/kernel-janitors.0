From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Mon, 14 Feb 2005 22:51:59 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][14/21] drivers/telephony/* - compile
Message-Id: <200502150147.03591.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33637630213293601=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.22902.52C0B1@localhost>
In-Reply-To: <42113C2D.22902.52C0B1@localhost>
To: kernel-janitors@vger.kernel.org

--===============33637630213293601==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 15 February 2005 00:02, Stephen Biggs wrote:

> --- linux-2.6.11-rc3-mm2-original/drivers/telephony/ixj.c
> +++ linux-2.6.11-rc3-mm2/drivers/telephony/ixj.c

> -		if (copy_to_user(argp, ixj_c_revision, strlen(ixj_c_revision))) 
> -			retval = -EFAULT;
> +		sprintf(argp, "\nDriver version %i.%i.%i", IXJ_VER_MAJOR, IXJ_VER_MINOR, IXJ_BLD_VER);

argp is a userspace pointer. You _can't_ simply write to it.

	char tmpbuf[...];

	sprintf(tmpbuf, "version %i ...", MAJOR, ...);
	if (copy_to_user(argp, tmpbuf, ...))
		...

	Alexey

--===============33637630213293601==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33637630213293601==--
