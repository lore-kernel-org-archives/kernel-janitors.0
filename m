From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jan 2017 11:32:51 +0000
Subject: Re: [patch net-next] smc: some potential use after free bugs
Message-Id: <20170126113250.GM4201@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170126090527.GA966@mwanda>
 <d66e8e35-0be7-ea04-6e1e-7c214cc6c50b@linux.vnet.ibm.com>
In-Reply-To: <d66e8e35-0be7-ea04-6e1e-7c214cc6c50b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ursula Braun <ubraun@linux.vnet.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-s390@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 26, 2017 at 12:23:02PM +0100, Ursula Braun wrote:
> 
> On 01/26/2017 10:05 AM, Dan Carpenter wrote:
> > Say we got really unlucky and these failed on the last iteration, then
> > it could lead to a use after free bug.
> thanks for reporting this! I had already a similar patch prepared, but not
> yet submitted. It contains all your added lines plus these additional
> pre-initializations at definition time:
> 
> @@ -509,7 +509,7 @@ int smc_sndbuf_create(struct smc_sock *smc)
>         struct smc_connection *conn = &smc->conn;
>         struct smc_link_group *lgr = conn->lgr;
>         int tmp_bufsize, tmp_bufsize_short;
> -   struct smc_buf_desc *sndbuf_desc;
> + struct smc_buf_desc *sndbuf_desc = NULL;
>         int rc;
>  
>         /* use socket send buffer size (w/o overhead) as start value */
> 
> @@ -573,7 +575,7 @@ int smc_rmb_create(struct smc_sock *smc)
>         struct smc_connection *conn = &smc->conn;
>         struct smc_link_group *lgr = conn->lgr;
>         int tmp_bufsize, tmp_bufsize_short;
> -   struct smc_buf_desc *rmb_desc;
> + struct smc_buf_desc *rmb_desc = NULL;
>         int rc;
>  
>         /* use socket recv buffer size (w/o overhead) as start value */
> 
> If you do not contradict, I will post my enhanced patch version.

Those are obviously harmless changes...

My static checker knows those aren't required so it doesn't complain
about uninitialized variables.  But not all static analysis tools are as
clever.  ;)

regards,
dan carpenter

