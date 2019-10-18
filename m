From: Ira Weiny <ira.weiny@intel.com>
Date: Fri, 18 Oct 2019 19:12:14 +0000
Subject: Re: [PATCH] acpi/nfit: unlock on error in scrub_show()
Message-Id: <20191018191214.GB10455@iweiny-DESK2.sc.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191018123534.GA6549@mwanda>
In-Reply-To: <20191018123534.GA6549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, Keith Busch <keith.busch@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-nvdimm@lists.01.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 18, 2019 at 03:35:34PM +0300, Dan Carpenter wrote:
> We change the locking in this function and forgot to update this error
> path so we are accidentally still holding the "dev->lockdep_mutex".
> 
> Fixes: 87a30e1f05d7 ("driver-core, libnvdimm: Let device subsystems add local lockdep coverage")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/acpi/nfit/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
> index 1413324982f0..14e68f202f81 100644
> --- a/drivers/acpi/nfit/core.c
> +++ b/drivers/acpi/nfit/core.c
> @@ -1322,7 +1322,7 @@ static ssize_t scrub_show(struct device *dev,
>  	nfit_device_lock(dev);
>  	nd_desc = dev_get_drvdata(dev);
>  	if (!nd_desc) {
> -		device_unlock(dev);
> +		nfit_device_unlock(dev);
>  		return rc;
>  	}
>  	acpi_desc = to_acpi_desc(nd_desc);
> -- 
> 2.20.1
> 
