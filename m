From: Alex Elder <elder@inktank.com>
Date: Tue, 19 Jun 2012 13:27:19 +0000
Subject: Re: [patch -next] libceph: fix NULL dereference in reset_connection()
Message-Id: <4FE07E37.7000203@inktank.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120619103339.GB7596@elgon.mountain>
In-Reply-To: <20120619103339.GB7596@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/19/2012 05:33 AM, Dan Carpenter wrote:
> We dereference "con->in_msg" on the line after it was set to NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yikes.

Actually I think I prefer a different fix, which is
simply to call ceph_con_put(con) in the same spot
it was called with con->in_msg->con before.  I'd
rather drop the message reference before dropping
the connection reference.  I.e.:

@@ -440,7 +440,7 @@ static void reset_connection(struct ceph_connection
*con)
 		con->in_msg->con = NULL;
 		ceph_msg_put(con->in_msg);
 		con->in_msg = NULL;
-		ceph_con_put(con->in_msg->con);
+		ceph_con_put(con);
 	}

 	con->connect_seq = 0;

(I crafted that manually--it may not work...)

I will re-post that fix and will credit you with it.  Please acknowledge
it's OK with you though.  Thanks a lot.

					-Alex

> diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
> index 5e9f61d..6aa671c 100644
> --- a/net/ceph/messenger.c
> +++ b/net/ceph/messenger.c
> @@ -437,10 +437,10 @@ static void reset_connection(struct ceph_connection *con)
>  
>  	if (con->in_msg) {
>  		BUG_ON(con->in_msg->con != con);
> +		ceph_con_put(con->in_msg->con);
>  		con->in_msg->con = NULL;
>  		ceph_msg_put(con->in_msg);
>  		con->in_msg = NULL;
> -		ceph_con_put(con->in_msg->con);
>  	}
>  
>  	con->connect_seq = 0;
> 

