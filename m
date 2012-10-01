From: David Miller <davem@davemloft.net>
Date: Mon, 01 Oct 2012 21:15:31 +0000
Subject: Re: [patch] net/key/af_key.c: add range checks on ->sadb_x_policy_len
Message-Id: <20121001.171531.1225138780751285845.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120928082119.GA32008@elgon.mountain>
In-Reply-To: <20120928082119.GA32008@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ebiederm@xmission.com, eric.dumazet@gmail.com, shemminger@vyatta.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Sep 2012 11:21:19 +0300

> Because sizeof() is size_t then if "len" is negative, it counts as a
> large positive value.
> 
> The call tree looks like:
> pfkey_sendmsg()
> -> pfkey_process()
>    -> pfkey_spdadd()
>       -> parse_ipsecrequests()
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static checker fix.  I'm not very familiar with this code.
> I think if we were to hit this then we would try to parse invalid data
> and it would return -EINVAL or similar error code pretty quickly.

Applied and queued up for -stable, thanks Dan.
