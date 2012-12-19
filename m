From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Dec 2012 16:39:14 +0000
Subject: Re: [PATCH 5/5] spi: fix return value check in hspi_probe().
Message-Id: <20121219163914.GN5032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
	<1355271894-5284-6-git-send-email-tipecaml@gmail.com>
	<87txrsqf7f.wl%kuninori.morimoto.gx@renesas.com>
	<20121219151154.937EC3E0AD7@localhost>
In-Reply-To: <20121219151154.937EC3E0AD7@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyril Roelandt <tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Dec 19, 2012 at 03:11:54PM +0000, Grant Likely wrote:
> On Tue, 11 Dec 2012 16:36:27 -0800 (PST), Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> > 
> > Hi
> > 
> > > According to its documentation, clk_get() returns a "valid IS_ERR() condition
> > > containing errno", so we should call IS_ERR() rather than a NULL check.
> > > 
> > > Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> > 
> > Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Applied, thanks.

In another thread, we were just talking about who clk_get() can
return a NULL if !CONFIG_HAVE_CLK.  That might change to match the
documentation later...  Not sure.

regards,
dan carpenter

