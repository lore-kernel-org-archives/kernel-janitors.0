From: David Miller <davem@davemloft.net>
Date: Wed, 27 Jun 2012 08:17:05 +0000
Subject: Re: [patch -next] 6lowpan: double unlock on an error path
Message-Id: <20120627.011705.1325190861280829179.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627065309.GA25774@elgon.mountain>
	<CAJmB2rCwYo1KR_gOQFrvMn2A2px1mPEN5DV+KGtjV914p-o7NA@mail.gmail.com>
In-Reply-To: <CAJmB2rCwYo1KR_gOQFrvMn2A2px1mPEN5DV+KGtjV914p-o7NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: alex.bluesman.smirnov@gmail.com
Cc: dan.carpenter@oracle.com, dbaryshkov@gmail.com, slapin@ossfans.org, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Wed, 27 Jun 2012 10:57:18 +0400

> 2012/6/27 Dan Carpenter <dan.carpenter@oracle.com>:
>> We already unlocked a few lines earlier here, so we can go directly to
>> drop without passing through unlock. =A0This was introduced recently in
>> c5d3687f6c ('6lowpan: read data from skb safely').
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
 ...
> Acked-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
