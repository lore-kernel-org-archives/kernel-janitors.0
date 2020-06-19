From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jun 2020 13:25:34 +0000
Subject: Re: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x ports
Message-Id: <20200619132534.GX4151@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619100907.GA246319@mwanda>
In-Reply-To: <20200619100907.GA246319@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jun 19, 2020 at 04:01:47PM +0300, Ido Schimmel wrote:
> On Fri, Jun 19, 2020 at 01:09:07PM +0300, Dan Carpenter wrote:
> > Hello Ido Schimmel,
> > 
> > The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
> > 8x ports" from Jun 16, 2020, leads to the following static checker
> > warning:
> 
> Thanks for the report, Dan.
> 
> Colin already reported it to me and I have the below patch in my queue
> to address the issue. WDYT?

Looks good.  Thanks!

regards,
dan carpenter
