From: David Miller <davem@davemloft.net>
Date: Mon, 24 Jun 2013 20:01:45 +0000
Subject: Re: [patch] tehuti: using uninitialized data in bdx_ioctl_priv()
Message-Id: <20130624.130145.1513695698751905735.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130624160503.GC31984@elgon.mountain>
In-Reply-To: <20130624160503.GC31984@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andy@greyhouse.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2013 19:05:03 +0300

> If we "cmd = SIOCDEVPRIVATE" then we use data[] without initializing
> it.  The most common case is that we would return -EOPNOTSUPP.  The
> other case is that we'd end up reading and writing to randomish places.
> This requires CAP_SYS_RAWIO so it's not very bad.
> 
> The fix is to not allow SIOCDEVPRIVATE because it doesn't work.  I
> returned -EOPNOTSUPP instead of -ENOTTY because that's what is used in
> the rest of the file.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I think the intention is to only allow SIOCDEVPRIVATE, rather than
accept any and all values other than it which are inside of the
private ioctl range.

The 'cmd' validation is one step, and it determines the interpretation
of data[0].
