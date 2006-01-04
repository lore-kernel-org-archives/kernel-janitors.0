From: Greg KH <greg@kroah.com>
Date: Wed, 04 Jan 2006 17:26:35 +0000
Subject: Re: [KJ] [PATCH 2/2] Remove LINUX_VERSION_CODE check in pwc/pwc-if.c
Message-Id: <20060104172635.GA9044@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48139211191054798=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136394751.4692.6.camel@localhost>
In-Reply-To: <1136394751.4692.6.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============48139211191054798==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2006 at 06:12:30PM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this patch removes the LINUX_VERSION check in
> drivers/usb/media/pwc/pwc-if.c
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

How about redoing this and take out the #include <linux/version.h> at
the same time, as it should no longer be needed?

And do the same thing for the pwc-ctrl.c file perhaps?

thanks,

greg k-h

--===============48139211191054798==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48139211191054798==--
