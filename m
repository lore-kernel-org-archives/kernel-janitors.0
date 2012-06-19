From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jun 2012 13:33:16 +0000
Subject: Re: [patch -next] libceph: fix NULL dereference in reset_connection()
Message-Id: <20120619133316.GR4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120619103339.GB7596@elgon.mountain>
 <4FE07E37.7000203@inktank.com>
In-Reply-To: <4FE07E37.7000203@inktank.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@inktank.com>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 19, 2012 at 08:27:19AM -0500, Alex Elder wrote:
> On 06/19/2012 05:33 AM, Dan Carpenter wrote:
> > We dereference "con->in_msg" on the line after it was set to NULL.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Yikes.
> 
> Actually I think I prefer a different fix, which is
> simply to call ceph_con_put(con) in the same spot
> it was called with con->in_msg->con before.  I'd
> rather drop the message reference before dropping
> the connection reference.  I.e.:
> 
> @@ -440,7 +440,7 @@ static void reset_connection(struct ceph_connection
> *con)
>  		con->in_msg->con = NULL;
>  		ceph_msg_put(con->in_msg);
>  		con->in_msg = NULL;
> -		ceph_con_put(con->in_msg->con);
> +		ceph_con_put(con);
>  	}
> 
>  	con->connect_seq = 0;
> 
> (I crafted that manually--it may not work...)
> 
> I will re-post that fix and will credit you with it.  Please acknowledge
> it's OK with you though.  Thanks a lot.
> 

Yep.  We already know that con->in_msg->con and con are the same
from the BUG_ON() so this works.  Thanks.

regards,
dan carpenter

