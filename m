From: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
Date: Thu, 22 Apr 2010 22:56:43 +0000
Subject: Re: [patch] wimax: checking ERR_PTR vs null
Message-Id: <1271977003.2867.12.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095010.GN29647@bicker>
In-Reply-To: <20100422095010.GN29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "wimax@linuxwimax.org" <wimax@linuxwimax.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Paulius Zaleckas <paulius.zaleckas@teltonika.lt>, Alexey Dobriyan <adobriyan@gmail.com>

On Thu, 2010-04-22 at 02:50 -0700, Dan Carpenter wrote: 
> stch_skb is allocated with wimax_gnl_re_state_change_alloc().  That
> function returns ERR_PTRs on failure and doesn't return NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

ACK, thanks [and thanks to davem for reminding me]


