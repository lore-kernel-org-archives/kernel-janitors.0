From: Joe Perches <joe@perches.com>
Date: Wed, 18 Sep 2013 15:33:05 +0000
Subject: Re: [PATCH 003/007] WAN Drivers: Update farsync driver and introduce fsflex driver
Message-Id: <1379518385.1787.28.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CAAAA787DA2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CAAAA787DA2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Curtis <Kevin.Curtis@farsite.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Dermot Smith <dermot.smith@farsite.com>

On Wed, 2013-09-18 at 11:12 +0100, Kevin Curtis wrote:
> Farsite Communications FarSync driver update

> diff -uprN -X linux-3.10.1/Documentation/dontdiff linux-3.10.1/drivers/net/wan/fscmn.h linux-3.10.1_new/drivers/net/wan/fscmn.h
[]
> +#ifdef UINT32
> +#define u32 UINT32
> +#define u16 UINT16
> +#define u8  UCHAR
> +#endif
> +
> +#ifdef USSTYPES_H
> +#define u32 U32
> +#define u16 U16
> +#define u8  U8
> +#endif

Unpretty.

Why aren't the typedefs from
include/asm-generic good enough?

> +typedef struct _FSCMN_TXRX_PREAMBLE {
[]
> +} FSCMN_TXRX_PREAMBLE, *PFSCMN_TXRX_PREAMBLE;

More typedefs


