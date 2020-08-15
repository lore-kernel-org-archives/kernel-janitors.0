From: Matthew Wilcox <willy@infradead.org>
Date: Sat, 15 Aug 2020 18:23:00 +0000
Subject: Re: [PATCH 2/2] tree-wide: rename vmemdup_user to kvmemdup_user
Message-Id: <20200815182300.GZ17456@casper.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2e717622-22ba-9947-c8df-520bdbb2e16f@web.de>
In-Reply-To: <2e717622-22ba-9947-c8df-520bdbb2e16f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-team@fb.com, Christoph Hellwig <hch@lst.de>, Coccinelle <cocci@systeme.lip6.fr>

On Sat, Aug 15, 2020 at 03:10:12PM +0200, Markus Elfring wrote:
> > This helper uses kvmalloc, not vmalloc, so rename it to kvmemdup_user to
> > make it clear we're using kvmalloc() and will need to use kvfree().
>=20
> Can the renaming of this function name trigger software updates
> for any more source files?

Why don't you find out, and if there are, submit your own patch?

> Example:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
cripts/coccinelle/api/memdup_user.cocci?id=C9c9735c46f589b9877b7fc00c89ef1b=
61a31e18#n18
>=20
> Regards,
> Markus
