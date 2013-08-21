From: Daniel Mack <zonque@gmail.com>
Date: Wed, 21 Aug 2013 09:18:20 +0000
Subject: Re: USB: Add EHCI support for MX27 and MX31 based boards
Message-Id: <521485DC.8050701@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821083922.GJ5240@elgon.mountain>
In-Reply-To: <20130821083922.GJ5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 21.08.2013 10:39, Dan Carpenter wrote:
> [ This warning is very old actually ]
> 
> Hello Daniel Mack,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 7e8d5cd93fac: "USB: Add EHCI support for MX27 and MX31 
> based boards" from Oct 28, 2009, leads to the following Smatch 
> complaint:

Indeed, that's quite old. I just sent out a patch to fix this.

Thanks for spotting!


Daniel

