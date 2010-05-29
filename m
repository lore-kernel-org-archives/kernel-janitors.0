From: David Miller <davem@davemloft.net>
Date: Sat, 29 May 2010 07:20:10 +0000
Subject: Re: [patch 1/2] be2net: add unlock on error path
Message-Id: <20100529.002010.123974681.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100526144634.GL22515@bicker>
In-Reply-To: <20100526144634.GL22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: sathyap@serverengines.com, subbus@serverengines.com, sarveshwarb@serverengines.com, ajitk@serverengines.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 16:46:35 +0200

> The unlock accidentally got removed from the error path in dd131e76e5:
> "be2net: Bug fix to avoid disabling bottom half during firmware upgrade."
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
