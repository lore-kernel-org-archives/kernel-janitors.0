From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 11 Jul 2020 10:04:52 +0000
Subject: Re: [PATCH] RDMA/usnic: switch from 'pci_' to 'dma_' API
Message-Id: <e0f440ce-7f0d-efbe-5419-763a97aad68a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711073120.249146-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200711073120.249146-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Benvenuti <benve@cisco.com>, Christoph Hellwig <hch@infradead.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Nelson Escobar <neescoba@cisco.com>, Parvi Kaustubhi <pkaustub@cisco.com>

> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script bellow.

* I suggest to avoid a typo in a word at the sentence end.

* The script for the semantic patch language could be a bit nicer
  by the application of disjunctions instead of separate SmPL rules.
  Would you become interested in any further adjustments?


=E2=80=A6
>@@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)

I find the last function parameter questionable.
An other flag was specified in a corresponding diff hunk.

Regards,
Markus
