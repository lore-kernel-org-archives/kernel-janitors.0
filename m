From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 29 Jul 2009 00:28:01 +0000
Subject: Re: [PATCH] Shut off pci_find_device warnings when the deprecated
Message-Id: <20090729002801.GR15310@basil.fritz.box>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090724094115.GA18450@basil.fritz.box> <20090728095552.72c41525@jbarnes-g45> <20090729001613.GA19369@ldl.fc.hp.com>
In-Reply-To: <20090729001613.GA19369@ldl.fc.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Chiang <achiang@hp.com>
Cc: Jesse Barnes <jesse.barnes@intel.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kernelnewbies@nl.linux.org

> Maybe it's too late now, but I thought those warnings were
> supposed to motivate people to convert old, buggy drivers to get
> off the deprecated interface.

Yes they are, but this warning instance was not for a old driver,
but for the EXPORT_SYMBOL defining the legacy function.

If any driver uses it it'll still warn.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
