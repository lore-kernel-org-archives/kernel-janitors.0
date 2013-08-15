From: David Miller <davem@davemloft.net>
Date: Thu, 15 Aug 2013 21:51:49 +0000
Subject: Re: [patch] tun: signedness bug in tun_get_user()
Message-Id: <20130815.145149.39135968046365706.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130815125257.GA16932@elgon.mountain>
	<20130815200834.GE20294@hmsreliant.think-freely.org>
In-Reply-To: <20130815200834.GE20294@hmsreliant.think-freely.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nhorman@tuxdriver.com
Cc: dan.carpenter@oracle.com, jasowang@redhat.com, mst@redhat.com, edumazet@google.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Neil Horman <nhorman@tuxdriver.com>
Date: Thu, 15 Aug 2013 16:08:35 -0400

> On Thu, Aug 15, 2013 at 03:52:57PM +0300, Dan Carpenter wrote:
>> The recent fix d9bf5f1309 "tun: compare with 0 instead of total_len" is
>> not totally correct.  Because "len" and "sizeof()" are size_t type, that
>> means they are never less than zero.
>> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
 ...
> Acked-by: Neil Horman <nhorman@tuxdriver.com>

Applied, thanks everyone.
