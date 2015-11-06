From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Nov 2015 20:04:44 +0000
Subject: Re: [patch 2/2] xprtrdma: checking for NULL instead of IS_ERR()
Message-Id: <20151106200444.GO7289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151105083952.GB19405@mwanda>
 <563CF2CA.5050409@Netapp.com>
In-Reply-To: <563CF2CA.5050409@Netapp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anna Schumaker <Anna.Schumaker@netapp.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@poochiereds.net>, Sagi Grimberg <sagig@mellanox.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 06, 2015 at 01:34:50PM -0500, Anna Schumaker wrote:
> On 11/05/2015 03:39 AM, Dan Carpenter wrote:
> > The rpcrdma_create_req() function returns error pointers or success.  It
> > never returns NULL.
> > 
> > Fixes: f531a5dbc451 ('xprtrdma: Pre-allocate backward rpc_rqst and send/receive buffers')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, Dan! These patches don't look urgent, so if it's okay with you then I'll save them for 4.5.

To be honest, I only ever care about linux-next and not released
versions.  :P  As long as it's in linux-next I'll be happy.

regards,
dan carpenter

