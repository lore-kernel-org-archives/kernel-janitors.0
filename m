From: Doug Ledford <dledford@redhat.com>
Date: Mon, 28 Aug 2017 23:16:53 +0000
Subject: Re: [PATCH] IB/usnic: check for allocation failure
Message-Id: <1503962213.52034.8.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825083030.rga3kllp55xnr3jf@mwanda>
In-Reply-To: <20170825083030.rga3kllp55xnr3jf@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Christian Benvenuti <benve-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Upinder Malhi <umalhi-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dave Goodell <dgoodell-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, 2017-08-25 at 11:43 +0300, Dan Carpenter wrote:
> usnic_uiom_get_dev_list() can return ERR_PTR(-ENOMEM) so we should
> check
> for that.
> 
> Fixes: e3cf00d0a87f ("IB/usnic: Add Cisco VIC low-level hardware
> driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

