From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 03 Aug 2011 06:50:24 +0000
Subject: Re: [PATCH] Use resource_size()
Message-Id: <20110803065024.GL4587@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312303347.2629.17.camel@localhost.localdomain>
In-Reply-To: <1312303347.2629.17.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 2011-08-02 at 18:42:24 +0200, Thomas Meyer <thomas@m3y3r.de> wrote:
>  Use resource_size function on resource object
>  instead of explicit computation.
> 
>  The semantic patch that makes this output is available
>  in scripts/coccinelle/api/resource_size.cocci.
> 
>  More information about semantic patching is available at
>  http://coccinelle.lip6.fr/

You might want to split these up per driver or by subsystem and send it
to the respective maintainer.

Cheers Tobias
