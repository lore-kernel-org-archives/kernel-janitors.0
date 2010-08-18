From: Stephen Hemminger <shemminger@vyatta.com>
Date: Wed, 18 Aug 2010 15:33:04 +0000
Subject: Re: [PATCH v2] ether1: Use net_device_stats from struct net_device
Message-Id: <20100818083304.2ef2eea4@nehalam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061719-19645-1-git-send-email-tklauser@distanz.ch>
	<1282115064-3701-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282115064-3701-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, 18 Aug 2010 09:04:24 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

>  
> -	memset (&priv(dev)->stats, 0, sizeof (struct net_device_stats));
> +	memset(&dev->stats, 0, sizeof(struct net_device_stats));

This is incorrect, just remove the memset.  The stats are initialized
when device is created.  The Linux device driver convention is to
keep stats when device is set down and brought back up; that is what
the majority of other drivers do.

-- 
