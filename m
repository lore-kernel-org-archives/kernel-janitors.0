From: Dan Carpenter <error27@gmail.com>
Date: Tue, 17 Aug 2010 18:32:05 +0000
Subject: Re: [PATCH] ether1: Use net_device_stats from struct net_device
Message-Id: <20100817183205.GH645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Aug 17, 2010 at 06:15:19PM +0200, Tobias Klauser wrote:
> struct net_device has its own struct net_device_stats member, so use
> this one instead of a private copy in the ether1_priv struct.
> 

You missed one in ether1_open().

        memset (&priv(dev)->stats, 0, sizeof (struct net_device_stats));

regards,
dan carpenter


