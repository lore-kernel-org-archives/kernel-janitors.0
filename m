From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 18 Aug 2013 05:49:54 +0000
Subject: Re: [PATCH 5/6] for fixing xhci_readl call in xhci_hub.c after removing xhci_hcd from function defin
Message-Id: <alpine.DEB.2.02.1308180748400.2032@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816192434.GG7975@xanatos>
In-Reply-To: <20130816192434.GG7975@xanatos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 17 Aug 2013, Dan Carpenter wrote:

> Wait what?  Why did we break the build in the first place?

Kumar didn't understand the relation between "one issue one patch" and 
"thou shalt not break the build".  I believe he either has sent or will 
send a new patch set that makes both changes at once.

julia
