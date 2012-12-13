From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Dec 2012 08:16:57 +0000
Subject: Re: [PATCH] drivers: nouveau: Bool tests don't need comparison
Message-Id: <20121213081657.GV6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355320451-23292-1-git-send-email-laurent.navet@gmail.com>
In-Reply-To: <1355320451-23292-1-git-send-email-laurent.navet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Navet <laurent.navet@gmail.com>
Cc: linux-kernel@vger.kernel.org, bskeggs@redhat.com, dri-devel@lists.freedesktops.org, airlied@linux.ie, kernel-janitors@vger.kernel.org

On Wed, Dec 12, 2012 at 02:54:10PM +0100, Laurent Navet wrote:
>  Bool initializations should use true and false.  Bool tests don't need
>  comparisons.  Based on contributions from Joe Perches, Rusty Russell
>  and Bruce W Allan.
> 
>  The semantic patch that makes this output is available
>  in scripts/coccinelle/misc/boolinit.cocci.
> 
>  More information about semantic patching is available at
>  http://coccinelle.lip6.fr/
> 

For some reason the commit message is indented by one space.  Don't
do whatever caused that.

regards,
dan carpenter

