From: Dan Carpenter <error27@gmail.com>
Date: Tue, 29 Jun 2010 22:33:11 +0000
Subject: Re: [patch] isdn/gigaset: add a kfree() to error path
Message-Id: <20100629223311.GR19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100628212046.GM19184@bicker> <4C2A7127.3040609@imap.cc>
In-Reply-To: <4C2A7127.3040609@imap.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tilman Schmidt <tilman@imap.cc>
Cc: Hansjoerg Lipp <hjlipp@web.de>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 30, 2010 at 12:18:15AM +0200, Tilman Schmidt wrote:
> Dan,
> 
> thanks for your patch. It is quite correct as it stands.
> There is however another problem with that error path, in
> that it also doesn't free the previously allocated channel.
> I prefer not to carry two separate patches for that, so I'm
> replacing your patch with the following augmented patch,
> which I'll submit together with my other pending patches
> for 2.6.36 soon:
> 

Good deal.

Acked-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

