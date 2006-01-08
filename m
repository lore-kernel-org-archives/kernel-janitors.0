From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
Date: Sun, 08 Jan 2006 21:55:16 +0000
Subject: Re: MODULE_VERSION useless? (was Re: [KJ] adding missing MODULE_*
Message-Id: <200601081855.17723.carlos@embedded.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9377557283683009=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net> <20060108204549.GB5864@mipter.zuzino.mipt.ru>
In-Reply-To: <20060108204549.GB5864@mipter.zuzino.mipt.ru>
To: kernel-janitors@lists.osdl.org
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Kees Cook <kees@outflux.net>, linux-kernel@vger.kernel.org

--===============9377557283683009==
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone,

I have two ideas about what to do with MODULE_VERSION:
1.- Defining MODULE_VERSION = KERNEL_VERSION
2.- Schedule it for removal in one or two more versions, and automagically use 
the KERNEL_VERSION as module's version.

Any comments?

-- 
Carlos Manuel Duclos Vergara
http://www.toolchains.com/personal/blog

--===============9377557283683009==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9377557283683009==--
