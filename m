From: David Vrabel <david.vrabel@citrix.com>
Date: Thu, 03 Apr 2014 11:53:09 +0000
Subject: Re: [patch] xen-pciback: silence an unwanted debug printk
Message-Id: <533D4BA5.9000001@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082459.GI25192@mwanda>
In-Reply-To: <20140328082459.GI25192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Alexander Gordeev <agordeev@redhat.com>, kernel-janitors@vger.kernel.org

On 28/03/14 08:24, Dan Carpenter wrote:
> There is a missing curly brace here so we might print some extra debug
> information.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to devel/for-linus-3.15.

Thanks.

David
