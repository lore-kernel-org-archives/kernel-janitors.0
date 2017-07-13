From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jul 2017 07:26:21 +0000
Subject: Re: [bug report] dax: refactor dax-fs into a generic provider of 'struct dax_device' instances
Message-Id: <20170713072621.ivdwgjwvksyeopg5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711074910.r3xthhzzki4hr7tc@mwanda>
In-Reply-To: <20170711074910.r3xthhzzki4hr7tc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2017 at 01:45:26PM -0700, Dan Williams wrote:
> >    571
> >    572          dev_dax = kzalloc(sizeof(*dev_dax) + sizeof(*res) * count, GFP_KERNEL);
> >    573          if (!dev_dax)
> >    574                  return ERR_PTR(-ENOMEM);
> >    575
> >    576          for (i = 0; i < count; i++) {
> >    577                  if (!IS_ALIGNED(res[i].start, dax_region->align)
> >    578                                  || !IS_ALIGNED(resource_size(&res[i]),
> >    579                                          dax_region->align)) {
> >    580                          rc = -EINVAL;
> >    581                          break;
> >    582                  }
> >    583                  dev_dax->res[i].start = res[i].start;
> >    584                  dev_dax->res[i].end = res[i].end;
> >    585          }
> >    586
> >    587          if (i < count)
> >    588                  goto err_id;
> >
> > We return NULL here.  Probably that's intended?
> 
> No, I would expect if 'i' is less than count rc is -EINVAL. Hmm,
> unless count is 0 which it can't be, but the static analyzer would
> need to audit all callers to find that out.
> 

With Smatch, if you have cross function analysis, then it does audit the
callers.  Say you had an return path like:

	if (count = 0)
		return 0;

Then the return is recorded in the database along with a CULL_PATH
because it's impossible.

regards,
dan carpenter

