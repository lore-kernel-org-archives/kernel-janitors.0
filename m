From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Apr 2017 01:16:15 +0000
Subject: Re: [bug report] r8169: fix offloaded tx checksum for small packets.
Message-Id: <20170420011615.uoj6fn3yf4wcapvn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170419141924.i4p4bpa6qzswncxt@mwanda>
In-Reply-To: <20170419141924.i4p4bpa6qzswncxt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 20, 2017 at 02:03:17AM +0200, Francois Romieu wrote:
> Dan Carpenter <dan.carpenter@oracle.com> :
> [...]
> > The patch b423e9ae49d7: "r8169: fix offloaded tx checksum for small
> > packets." from May 18, 2013, leads to the following static checker
> > warning:
> > 
> > 	drivers/net/ethernet/realtek/r8169.c:7165 rtl8169_start_xmit()
> > 	warn: passing freed memory 'skb'
> [...]
> >   7164          if (!tp->tso_csum(tp, skb, opts)) {
> >   7165                  r8169_csum_workaround(tp, skb);
> >                                                   ^^^
> > But the caller is not expecting it to be freed.
> 
> r8169.c as of b423e9ae49d7 was fine.
> 
> The caller was introduced in e974604b453e87f8d864371786375d3d511fdf56.
> 

Ah yes.  You're right.

regards,
dan carpenter


