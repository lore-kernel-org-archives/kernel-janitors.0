From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 07 Dec 2014 20:43:33 +0000
Subject: Re: [PATCH 3/20] PCI: fix misspelling of current function in string
Message-Id: <alpine.DEB.2.02.1412072143170.2235@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr> <1417980062-25151-4-git-send-email-Julia.Lawall@lip6.fr> <87lhmj42h3.fsf@rasmusvillemoes.dk>
In-Reply-To: <87lhmj42h3.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kernel-janitors@vger.kernel.org, joe@perches.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org



On Sun, 7 Dec 2014, Rasmus Villemoes wrote:

> On Sun, Dec 07 2014, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> 
> > Replace a misspelled function name by %s and then __func__.
> >
> > The function name begins with pci, not cpci.
> ...
> >  	result = cpci_hotplug_init(debug);
> >  	if (result) {
> > -		err("cpci_hotplug_init with error %d\n", result);
> > +		err("%s with error %d\n", __func__, result);
> >  		return result;
> >  	}
> 
> This one seems to be a false positive; I think the err() is reporting on
> the result from the call of the function which is indeed called
> cpci_hotplug_init.

Agreed.  Thanks.

julia
