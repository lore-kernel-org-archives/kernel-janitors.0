From: Joe Perches <joe@perches.com>
Date: Wed, 19 Jun 2013 16:15:04 +0000
Subject: Re: [patch -next] FMC: NULL dereference on allocation failure
Message-Id: <1371658504.2038.25.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130619160101.GA29108@mwanda>
In-Reply-To: <20130619160101.GA29108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alessandro Rubini <rubini@gnudd.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2013-06-19 at 19:01 +0300, Dan Carpenter wrote:
> If we don't allocate "arr" then the cleanup path will dereference it and
> oops.
[]
> diff --git a/drivers/fmc/fmc-sdb.c b/drivers/fmc/fmc-sdb.c
[]
> @@ -46,16 +46,17 @@ static struct sdb_array *__fmc_scan_sdb_tree(struct fmc_device *fmc,
[]
> -		arr->record = kzalloc(sizeof(arr->record[0]) * n, GFP_KERNEL);
> -		arr->subtree = kzalloc(sizeof(arr->subtree[0]) * n, GFP_KERNEL);
[]
> +	arr->record = kzalloc(sizeof(arr->record[0]) * n, GFP_KERNEL);
> +	arr->subtree = kzalloc(sizeof(arr->subtree[0]) * n, GFP_KERNEL);

n comes from the hardware no?
Maybe make these kcalloc too.


