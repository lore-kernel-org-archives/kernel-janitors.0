From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 27 Jun 2020 05:15:09 +0000
Subject: Re: [PATCH V3] firmware: stratix10-svc: Fix some error handling code
Message-Id: <20200627051509.GC233327@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecc14c7-b4df-1890-fbe7-91307c2db398@wanadoo.fr>
 <20200626193720.949431-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200626193720.949431-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: richard.gong@linux.intel.com, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 26, 2020 at 09:37:20PM +0200, Christophe JAILLET wrote:
> Fix several error handling issues:

<snip>

When you have to list a bunch of different things you do in a driver,
that's a huge hint this needs to be broken up into multiple patches.

Please do that here.

thanks,

greg k-h
