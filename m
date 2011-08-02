From: Dan Carpenter <error27@gmail.com>
Date: Tue, 02 Aug 2011 21:09:22 +0000
Subject: Re: [PATCH] Use kstrdup rather than duplicating its implementation
Message-Id: <20110802210922.GC3839@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312302089.2629.15.camel@localhost.localdomain>
 <20110802180537.GB3839@shale.localdomain>
 <1312313657.2629.20.camel@localhost.localdomain>
In-Reply-To: <1312313657.2629.20.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 02, 2011 at 09:34:14PM +0200, Thomas Meyer wrote:
> Does somebody maybe have a script for doing this split of an mbox file?
> maybe this script could also call get_maintainer.pl and change the To:
> field accordingly?
> 
> Just asking...

Checking it by hand builds character.  :)  Reviewers have to check
each patch by hand for mistakes and malice so this serves as a small
test to see if it's worth bothering maintainers about it.

regards,
dan carpenter
