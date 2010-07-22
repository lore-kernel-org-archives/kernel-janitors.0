From: Joe Perches <joe@perches.com>
Date: Thu, 22 Jul 2010 18:51:27 +0000
Subject: Re: [PATCH 09/11] staging: comedi: formatting of pointers in
Message-Id: <1279824687.1909.55.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279176172-5609-1-git-send-email-segooon@gmail.com>
	 <4C3EAEC5.8080908@gmail.com>  <20100722184557.GC32116@kroah.com>
In-Reply-To: <20100722184557.GC32116@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, Javier Martinez Canillas <martinez.javier@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>

On Thu, 2010-07-22 at 11:45 -0700, Greg KH wrote:
> On Thu, Jul 15, 2010 at 08:46:29AM +0200, Jiri Slaby wrote:
> > On 07/15/2010 08:42 AM, Kulikov Vasiliy wrote:
> > The name and parameters suggest to remove the function completely. (And
> > use print_hex_dump_bytes instead.)
> I agree, Kulikov, can you make that chagne instead?

The function isn't used at all and should simply be removed.

