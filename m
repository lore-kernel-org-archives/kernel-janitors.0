From: Tejun Heo <tj@kernel.org>
Date: Tue, 03 Feb 2015 12:48:14 +0000
Subject: Re: [PATCH 2/2] sata_mv: More error handling for phy_power_off() in mv_platform_remove()
Message-Id: <20150203124814.GE19463@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54D08871.6030304@users.sourceforge.net>
In-Reply-To: <54D08871.6030304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 03, 2015 at 01:32:10PM +0100, walter harms wrote:
> maybe this can be changed into
>   (void) phy_power_off(hpriv->port_phys[port]);
> 
> that would tell the compiler and other readers that this is intentional.

That's too anal to be helpful and too spurious to become even remotely
consistent.  Things like that are actualy harmful.  Note that we have
an annotation marking the other way - __must_check.  Balance is to be
found towards that direction, not this, so please stop.

Thanks.

-- 
tejun
