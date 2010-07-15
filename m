From: David Miller <davem@davemloft.net>
Date: Thu, 15 Jul 2010 00:57:26 +0000
Subject: Re: [PATCH v2] eth16i: fix memory leak
Message-Id: <20100714.175726.112610308.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100713114347.GK5658@bicker>
	<1279050563-15759-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279050563-15759-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, miku@iki.fi, shemminger@vyatta.com, eric.dumazet@gmail.com, tj@kernel.org, jpirko@redhat.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 13 Jul 2010 23:49:23 +0400

> Free allocated netdev if no probe is expected.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
