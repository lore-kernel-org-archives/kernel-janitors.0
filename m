From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 03 Mar 2005 15:44:07 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <200503031841.20013.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============024726893930112404=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============024726893930112404==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 02 March 2005 11:57, Domen Puncer wrote:

> remove_old_strings-drivers_telephony_ixj.patch
>   From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
>   Subject: [KJ] [PATCH]  ixj* - compile warning cleanup

drivers/telephony/ixj.c:6172:11: warning: incorrect type in argument 1 (different address spaces)
drivers/telephony/ixj.c:6172:11:    expected char *buf
drivers/telephony/ixj.c:6172:11:    got void [noderef] *argp<asn:1>

-               if (copy_to_user(argp, ixj_c_revision, strlen(ixj_c_revision)))
-                       retval = -EFAULT;
+               sprintf(argp, "\nDriver version %i.%i.%i", IXJ_VER_MAJOR, IXJ_VER_MINOR, IXJ_BLD_VER);

> int_sleep_on-drivers_cdrom_mcdx.patch
>   From: Nishanth Aravamudan <nacc@us.ibm.com>
>   Subject: [KJ] [PATCH 16/20] cdrom/mcdx: remove 	interruptible_sleep_on_timeout() usage

drivers/cdrom/mcdx.c:844:2: warning: mixing declarations and code
drivers/cdrom/mcdx.c: In function `mcdx_delay':
drivers/cdrom/mcdx.c:844: warning: ISO C90 forbids mixed declarations and code

	Alexey

--===============024726893930112404==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============024726893930112404==--
