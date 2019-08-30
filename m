From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Aug 2019 11:40:29 +0000
Subject: Re: [PATCH][V2] wimax/i2400m: remove debug containing bogus calculation of index
Message-Id: <20190830114029.GM23584@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830090711.15300-1-colin.king@canonical.com>
In-Reply-To: <20190830090711.15300-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 30, 2019 at 10:07:11AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The subtraction of the two pointers is automatically scaled by the
> size of the size of the object the pointers point to, so the division
> by sizeof(*i2400m->barker) is incorrect.  This has been broken since
> day one of the driver and is only debug, so remove the debug completely.
> 
> Also move && in condition to clean up a checkpatch warning.
> 
> Addresses-Coverity: ("Extra sizeof expression")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
