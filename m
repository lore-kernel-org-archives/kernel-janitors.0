From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2019 11:23:37 +0000
Subject: Re: [PATCH] wimax/i2400m: fix calculation of index, remove sizeof
Message-Id: <20190823112337.GB23408@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190823085230.6225-1-colin.king@canonical.com>
In-Reply-To: <20190823085230.6225-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 23, 2019 at 09:52:30AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The subtraction of the two pointers is automatically scaled by the
> size of the size of the object the pointers point to, so the division
> by sizeof(*i2400m->barker) is incorrect.  Fix this by removing the
> division.  Also make index an unsigned int to clean up a checkpatch
> warning.
> 
> Addresses-Coverity: ("Extra sizeof expression")
> Fixes: aba3792ac2d7 ("wimax/i2400m: rework bootrom initialization to be more flexible")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wimax/i2400m/fw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wimax/i2400m/fw.c b/drivers/net/wimax/i2400m/fw.c
> index 489cba9b284d..599a703af6eb 100644
> --- a/drivers/net/wimax/i2400m/fw.c
> +++ b/drivers/net/wimax/i2400m/fw.c
> @@ -399,8 +399,7 @@ int i2400m_is_boot_barker(struct i2400m *i2400m,
>  	 * associated with the device. */
>  	if (i2400m->barker
>  	    && !memcmp(buf, i2400m->barker, sizeof(i2400m->barker->data))) {
> -		unsigned index = (i2400m->barker - i2400m_barker_db)
> -			/ sizeof(*i2400m->barker);
> +		unsigned int index = i2400m->barker - i2400m_barker_db;
>  		d_printf(2, dev, "boot barker cache-confirmed #%u/%08x\n",
>  			 index, le32_to_cpu(i2400m->barker->data[0]));

It's only used for this debug output.  You may as well just delete it.

>  		return 0;

regards,
dan carpenter
