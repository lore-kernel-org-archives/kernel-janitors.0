From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 02 Dec 2014 13:56:39 +0000
Subject: Re: [patch] CodingStyle: add some more error handling guidelines
Message-Id: <20141202085639.43080af0@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141202085950.GA13434@mwanda>
 <alpine.DEB.2.10.1412021007560.2483@hadrien>
In-Reply-To: <alpine.DEB.2.10.1412021007560.2483@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Tue, 2 Dec 2014 10:09:02 +0100 (CET)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> kmalloc actually takes two arguments.  Perhaps it would be better to show
> something that looks like a valid call.

Agreed; I took the liberty of sticking in a GFP_KERNEL as I applied the
patch with Julia's ack.

Thanks,

jon
