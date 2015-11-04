From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 18:23:43 +0000
Subject: Re: [patch] vfio: make an array larger
Message-Id: <20151104182343.GO18797@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132624.GC20966@mwanda>
 <1446655219.21133.48.camel@perches.com>
In-Reply-To: <1446655219.21133.48.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Frank Blaschka <frank.blaschka@de.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 04, 2015 at 08:40:19AM -0800, Joe Perches wrote:
> Doesn't the same thing happen with pci_ext_cap_length?

pci_ext_cap_length is fine as-is but you're right that we probably
should make the size explicit as well.  I will fix and resend.

> Both array declarations might be better as const.

Sure.  I will do this as well.

regards,
dan carpenter

