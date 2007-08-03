From: Eugene Surovegin <ebs@ebshome.net>
Date: Fri, 03 Aug 2007 17:47:54 +0000
Subject: Re: [PATCH 06/13] dev->priv to netdev_priv(dev), for drivers/net/ibm_emac
Message-Id: <20070803174754.GA1352@gate.ebshome.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200708031734.TAA00777@ifs.emn.fr>
In-Reply-To: <200708031734.TAA00777@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Aug 03, 2007 at 07:34:19PM +0200, Yoann Padioleau wrote:
> 
> Replacing accesses to dev->priv to netdev_priv(dev). The replacment
> is safe when netdev_priv is used to access a private structure that is
> right next to the net_device structure in memory. Cf
> http://groups.google.com/group/comp.os.linux.development.system/browse_thread/thread/de19321bcd94dbb8/0d74a4adcd6177bd
> This is the case when the net_device structure was allocated with
> a call to alloc_netdev or one of its derivative.

NAK.

While that assumption is correct for the actual emac net device, it's 
not for MAL poll one.

You patch breaks a working driver.

-- 
Eugene

