From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 26 Sep 2020 14:55:21 +0000
Subject: Re: [PATCH] iio: temperature: ltc2983: fix leak of device node iterator
Message-Id: <20200926155521.3b75342f@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b5eca237-b7ea-e4ca-3936-8c32892e49b5@web.de>
In-Reply-To: <b5eca237-b7ea-e4ca-3936-8c32892e49b5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tobias Jordan <kernel@cdqe.de>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Nuno Sa <nuno.sa@analog.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>

On Sat, 26 Sep 2020 16:45:56 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> > Thought about adding an "goto err_of_node_put" instead, but as the error
> > paths are quite divergent, I'm not sure if that wouldn't complicate
> > things.  
> 
> Please add jump targets like “e_inval” and “put_node” so that a bit of
> common exception handling code can be better reused for this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=7c7ec3226f5f33f9c050d85ec20f18419c622ad6#n475

On this one I think readability would perhaps be hurt a little by
doing so, particular as we need to do the of_put_node in some but
not all non error paths.  

It is a close run thing between the two options however.

I considered another option of suggesting factoring out this whole
per node block, but to do that we would have to do something a bit
odd with the return value as we have 3 options.
* error
* do not parse any more children.
* continue to parse children.

So I think in this case Tobias' solution is the best one available.

Thanks,

Jonathan

> 
> Regards,
> Markus
