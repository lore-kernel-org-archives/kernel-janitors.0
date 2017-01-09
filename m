From: Shiraz Saleem <shiraz.saleem@intel.com>
Date: Mon, 09 Jan 2017 20:31:13 +0000
Subject: Re: [patch v2] i40iw: fix some indenting in i40iw_sc_vsi_init()
Message-Id: <20170109203112.GA42952@ssaleem-MOBL4.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170109194127.GA42156@ssaleem-MOBL4.amr.corp.intel.com>
 <20170109201216.GA3055@mwanda>
In-Reply-To: <20170109201216.GA3055@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Chien Tin Tung <chien.tin.tung-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Jan 09, 2017 at 11:12:16PM +0300, Dan Carpenter wrote:
> The debug printk was indented more than it should have been and we
> can remove an unnecessary line break.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: I accidentally had a tab instead of a space.

Thank you for the patch Dan.

Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
 
