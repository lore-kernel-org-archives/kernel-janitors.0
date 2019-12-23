From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Dec 2019 11:52:04 +0000
Subject: Re: [PATCH][next] thunderbolt: fix memory leak of object sw
Message-Id: <20191223115204.GA107995@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191220220526.11307-1-colin.king@canonical.com>
 <20191223101317.GF2628@lahna.fi.intel.com>
In-Reply-To: <20191223101317.GF2628@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Colin King <colin.king@canonical.com>, Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, Rajmohan Mani <rajmohan.mani@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 23, 2019 at 12:13:17PM +0200, Mika Westerberg wrote:
> On Fri, Dec 20, 2019 at 10:05:26PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > In the case where the call tb_switch_exceeds_max_depth is true
> > the error reurn path leaks memory in sw.  Fix this by setting
> > the return error code to -EADDRNOTAVAIL and returning via the
> > error exit path err_free_sw_ports to free sw. sw has been kzalloc'd
> > so the free of the NULL sw->ports is fine.
> >
> > Addresses-Coverity: ("Resource leak")
> > Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Greg, can you take this to your usb-next branch where the rest of the
> USB4 stuff is?

Will do, thanks.

greg k-h
