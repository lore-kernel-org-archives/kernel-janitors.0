From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 11 Jul 2020 09:34:29 +0000
Subject: Re: [PATCH] rsxx: switch from 'pci_free_consistent()' to 'dma_free_coherent()'
Message-Id: <65ed731b-8582-cc1c-5591-13feef1d134d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711064336.247502-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711064336.247502-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, Josh Morris <josh.h.morris@us.ibm.com>, Philip Kelleher <pjk1939@linux.ibm.com>

> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script bellow.

* I suggest to avoid a typo in a word at the sentence end.

* The script for the semantic patch language could be a bit nicer
  by the application of a disjunction instead of separate SmPL rules.
  Would you become interested in any further adjustments?

Regards,
Markus
