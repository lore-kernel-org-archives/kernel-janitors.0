From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 03 Jan 2008 20:24:07 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning
Message-Id: <1199391847.7291.17.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Thu, 2008-01-03 at 18:12 +0100, Leonardo Potenza wrote:
> I thought that at least the user should be aware that something went
> wrong in the driver initialization and that not all the features 
> will be available at run-time. 
> That's why I tried to add a specific warning message.
> 
> Anyway, I didn't intend to waste so much of your time with my patch
> submission.

The warning is annoying... see if you can find the shortest way in term
of code bloat to get rid of it...

Cheers,
Ben.


