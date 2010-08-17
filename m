From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 18:53:56 +0000
Subject: Re: [PATCH] ether3: Use net_device_stats from struct net_device
Message-Id: <20100817185356.GG15670@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061733-19700-1-git-send-email-tklauser@distanz.ch>
	<20100817183551.GI645@bicker>
In-Reply-To: <20100817183551.GI645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 2010-08-17 at 20:35:52 +0200, Dan Carpenter <error27@gmail.com> wrote:
> On Tue, Aug 17, 2010 at 06:15:33PM +0200, Tobias Klauser wrote:
> > struct net_device has its own struct net_device_stats member, so use
> > this one instead of a private copy in the ether1_priv struct.
> > 
> 
> Two were missed, one from ether3_init_for_open()
> 
> 	memset(&priv(dev)->stats, 0, sizeof(struct net_device_stats));
> 
> and another from ether3_rx().
> 
> 	struct net_device_stats *stats = &priv(dev)->stats;

Thanks a lot again. I'll send an updated patch. Please disregard this
one.

(I wasn't able to cross-compile-test the patch here, otherwise these
would hopefully have been caught by the compiler).

  Tobias
