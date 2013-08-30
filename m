From: David Miller <davem@davemloft.net>
Date: Fri, 30 Aug 2013 21:53:49 +0000
Subject: Re: [patch] mISDN: return -EINVAL on error in dsp_control_req()
Message-Id: <20130830.175349.2106772870180002395.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130829084700.GF14334@elgon.mountain>
In-Reply-To: <20130829084700.GF14334@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, khlebnikov@openvz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 11:47:00 +0300

> If skb->len is too short then we should return an error.  Otherwise we
> read beyond the end of skb->data for several bytes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
