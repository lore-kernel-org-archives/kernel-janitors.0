From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 08 Jan 2006 22:03:07 +0000
Subject: Re: MODULE_VERSION useless? (was Re: [KJ] adding missing MODULE_*
Message-Id: <20060108220307.GJ19769@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17710517745752297=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net> <20060108204549.GB5864@mipter.zuzino.mipt.ru> <200601081855.17723.carlos@embedded.cl>
In-Reply-To: <200601081855.17723.carlos@embedded.cl>
To: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
Cc: kernel-janitors@lists.osdl.org, Kees Cook <kees@outflux.net>, linux-kernel@vger.kernel.org

--===============17710517745752297==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2006 at 06:55:16PM -0300, Carlos Manuel Duclos Vergara wrote:
> I have two ideas about what to do with MODULE_VERSION:
> 1.- Defining MODULE_VERSION = KERNEL_VERSION
> 2.- Schedule it for removal in one or two more versions, and automagically use 
> the KERNEL_VERSION as module's version.
> 
> Any comments?

Do neither.  Just because some people don't use it properly is no reason
to remove it.


--===============17710517745752297==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17710517745752297==--
