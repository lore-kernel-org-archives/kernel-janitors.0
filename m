From: Greg KH <greg@kroah.com>
Date: Sun, 08 Jan 2006 21:58:00 +0000
Subject: Re: MODULE_VERSION useless? (was Re: [KJ] adding missing MODULE_*
Message-Id: <20060108215800.GA31398@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41413466428478252=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net> <20060108204549.GB5864@mipter.zuzino.mipt.ru> <200601081855.17723.carlos@embedded.cl>
In-Reply-To: <200601081855.17723.carlos@embedded.cl>
To: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
Cc: kernel-janitors@lists.osdl.org, Kees Cook <kees@outflux.net>, linux-kernel@vger.kernel.org

--===============41413466428478252==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2006 at 06:55:16PM -0300, Carlos Manuel Duclos Vergara wrote:
> Hi everyone,
> 
> I have two ideas about what to do with MODULE_VERSION:
> 1.- Defining MODULE_VERSION = KERNEL_VERSION

No.

> 2.- Schedule it for removal in one or two more versions, and automagically use 
> the KERNEL_VERSION as module's version.

No, just let the authors of the different drivers that want to use
MODULE_VERSION use it (for some people it does matter, and they keep it
up to date.)  Everyone else, just don't add it if you don't care about
it.

> Any comments?

In short, leave it alone :)

thanks,

greg k-h

--===============41413466428478252==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41413466428478252==--
