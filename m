From: Dan Carpenter <error27@gmail.com>
Date: Thu, 06 May 2010 10:45:36 +0000
Subject: Re: [PATCH] net: emaclite: Use resource_size
Message-Id: <20100506104536.GL27064@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 06, 2010 at 12:07:05PM +0200, Dan Carpenter wrote:
> Since you're doing this, here are some smatch warnings with potential
> off-by-one bugs:
> 

Btw.  The heuristic that smatch uses here is if the parameter is (x - y)
and neither x nor y is a sizeof() then complain.  Don't complain about
more complicated expressions like x - y - z.

If it's a simple assignment expression like:
foo = x - y;
ioremap_nocache(x, foo);
The smatch check tries to catch those as well.

Smatch checks the parameters to: ioremap_nocache(), ioremap(),
__request_region(), __release_region(), __devm_request_region(), and
__devm_release_region().

The test has a couple false positives:
drivers/net/netxen/netxen_nic_main.c +633 netxen_setup_pci_map(27) warn:
	consider using resource_size() here

Most people use x - y where both x and y are valid registers but netxen
does x - y where x is one past the end.  It does this consistently.

drivers/parport/parport_pc.c +2530 parport_pc_unregister_port(17) warn:
	consider using resource_size() here

The paraport driver frees part of the resources here and the rest a
couple lines down depending on if it's in PARPORT_MODE_ECP.

regards,
dan carpenter

