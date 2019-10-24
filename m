From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 24 Oct 2019 16:39:39 +0000
Subject: Re: [PATCH][next] net: dsa: fix dereference on ds->dev before null check error
Message-Id: <8caa0034-5cec-0032-2edf-409e4b112f5b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024103218.2592-1-colin.king@canonical.com>
In-Reply-To: <20191024103218.2592-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/24/19 3:32 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently ds->dev is dereferenced on the assignments of pdata and
> np before ds->dev is null checked, hence there is a potential null
> pointer dereference on ds->dev.  Fix this by assigning pdata and
> np after the ds->dev null pointer sanity check.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 7e99e3470172 ("net: dsa: remove dsa_switch_alloc helper")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

and while we are at it:

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

[linux-next:master 5983/6376] net/dsa/dsa2.c:849 dsa_switch_probe()
warn: variable dereferenced before check 'ds->dev' (see line 845)

> ---
>  net/dsa/dsa2.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/net/dsa/dsa2.c b/net/dsa/dsa2.c
> index 1e3ac9b56c89..214dd703b0cc 100644
> --- a/net/dsa/dsa2.c
> +++ b/net/dsa/dsa2.c
> @@ -842,13 +842,16 @@ static int dsa_switch_add(struct dsa_switch *ds)
>  
>  static int dsa_switch_probe(struct dsa_switch *ds)
>  {
> -	struct dsa_chip_data *pdata = ds->dev->platform_data;
> -	struct device_node *np = ds->dev->of_node;
> +	struct dsa_chip_data *pdata;
> +	struct device_node *np;
>  	int err;
>  
>  	if (!ds->dev)
>  		return -ENODEV;
>  
> +	pdata = ds->dev->platform_data;
> +	np = ds->dev->of_node;
> +
>  	if (!ds->num_ports)
>  		return -EINVAL;
>  
> 


-- 
Florian
