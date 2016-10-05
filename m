From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 05 Oct 2016 21:40:04 +0000
Subject: Re: [PATCH 01/15 v2] UBIFS: improve function-level documentation
Message-Id: <CAFLxGvxHuosxhrwW0N63jJOatpn3nNE79o_UqBkdUWRepUNfaA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1610012252190.3445@hadrien>
In-Reply-To: <alpine.DEB.2.10.1610012252190.3445@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Richard Weinberger <richard@nod.at>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>

On Sat, Oct 1, 2016 at 10:53 PM, Julia Lawall <julia.lawall@lip6.fr> wrote:
> Fix various inconsistencies in the documentation associated with various
> functions.
>
> In the case of fs/ubifs/lprops.c, the second parameter of
> ubifs_get_lp_stats was renamed from st to lst in commit 84abf972ccff
> ("UBIFS: add re-mount debugging checks")
>
> In the case of fs/ubifs/lpt_commit.c, the excess variables have never
> existed in the associated functions since the code was introduced into the
> kernel.
>
> The others appear to be straightforward typos.
>
> Issues detected using Coccinelle (http://coccinelle.lip6.fr/)
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

-- 
Thanks,
//richard
