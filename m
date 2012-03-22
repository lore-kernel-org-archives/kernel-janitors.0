From: David Miller <davem@davemloft.net>
Date: Thu, 22 Mar 2012 23:30:55 +0000
Subject: Re: [patch] RDS: use gfp flags from caller in conn_alloc()
Message-Id: <20120322.193055.1929591502119781703.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120322064409.GE7369@elgon.mountain>
	<4F6B4316.5050508@oracle.com>
In-Reply-To: <4F6B4316.5050508@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: venkat.x.venkatsubra@oracle.com
Cc: dan.carpenter@oracle.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Venkat Venkatsubra <venkat.x.venkatsubra@oracle.com>
Date: Thu, 22 Mar 2012 10:19:50 -0500

> On 3/22/2012 1:44 AM, Dan Carpenter wrote:
>> We should be using the gfp flags the caller specified here, instead of
>> GFP_KERNEL.  I think this might be a bugfix, depending on the value of
>> "sock->sk->sk_allocation" when we call rds_conn_create_outgoing() in
>> rds_sendmsg().  Otherwise, it's just a cleanup.
>>
>> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
> Acked-by: Venkat Venkatsubra <venkat.x.venkatsubra@oracle.com>

Applied.
