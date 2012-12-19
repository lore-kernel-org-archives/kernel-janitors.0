From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 19 Dec 2012 15:11:54 +0000
Subject: Re: [PATCH 5/5] spi: fix return value check in hspi_probe().
Message-Id: <20121219151154.937EC3E0AD7@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
	<1355271894-5284-6-git-send-email-tipecaml@gmail.com>
	<87txrsqf7f.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87txrsqf7f.wl%kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Cyril Roelandt <tipecaml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 11 Dec 2012 16:36:27 -0800 (PST), Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:
> 
> Hi
> 
> > According to its documentation, clk_get() returns a "valid IS_ERR() condition
> > containing errno", so we should call IS_ERR() rather than a NULL check.
> > 
> > Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Applied, thanks.

g.

