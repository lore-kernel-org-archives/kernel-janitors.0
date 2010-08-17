From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 18:34:09 +0000
Subject: Re: [PATCH] ether1: Use net_device_stats from struct net_device
Message-Id: <20100817183409.GF15670@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
	<20100817183205.GH645@bicker>
In-Reply-To: <20100817183205.GH645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 2010-08-17 at 20:32:05 +0200, Dan Carpenter <error27@gmail.com> wrote:
> On Tue, Aug 17, 2010 at 06:15:19PM +0200, Tobias Klauser wrote:
> > struct net_device has its own struct net_device_stats member, so use
> > this one instead of a private copy in the ether1_priv struct.
> > 
> 
> You missed one in ether1_open().
> 
>         memset (&priv(dev)->stats, 0, sizeof (struct net_device_stats));

Thanks. I'll send an updated patch.

Tobias
