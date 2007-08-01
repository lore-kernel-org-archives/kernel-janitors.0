From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 01 Aug 2007 00:16:55 +0000
Subject: Re: [PATCH 55] drivers/char/n_hdlc.c: kmalloc + memset conversion
Message-Id: <20070801011655.08e3c17b@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
	<200707312327.30692.m.kozlowski@tuxland.pl>
In-Reply-To: <200707312327.30692.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, khc@pm.waw.pl

On Tue, 31 Jul 2007 23:27:30 +0200
Mariusz Kozlowski <m.kozlowski@tuxland.pl> wrote:

> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

NAK

> -	struct n_hdlc *n_hdlc = kmalloc(sizeof(*n_hdlc), GFP_KERNEL);
> -
> +	struct n_hdlc *n_hdlc;
> +
> +	n_hdlc = kzalloc(sizeof(*n_hdlc), GFP_KERNEL);

Change looks fine but please keep the original formatting style
