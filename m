From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 30 May 2005 06:17:06 +0000
Subject: Re: [KJ] [PATCH] - nicstar gcc 4 warnings
Message-Id: <200505301017.06916.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <429A7583.4010201@gmail.com>
In-Reply-To: <429A7583.4010201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 30 May 2005 06:08, Chuck Short wrote:
> This patch fixes gcc4 warnings when compiling the nicstar driver.

> --- linux-source-2.6.12-2.6.11.93.orig/drivers/atm/nicstar.c
> +++ linux-source-2.6.12-2.6.11.93/drivers/atm/nicstar.c

> static void process_rsq(ns_dev *card)
> {
> -   ns_rsqe *previous;
> +   ns_rsqe *previous = NULL;

FWIW, this warning is bogus too.
======================================
#define ns_rsqe_valid(ns_rsqep) \
        (le32_to_cpu((ns_rsqep)->word_4) & NS_RSQE_VALID)

static void process_rsq(ns_dev *card)
{
	ns_rsqe *previous;

	if (!ns_rsqe_valid(card->rsq.next))
		return;
	/* now ns_rsqe_valid(card->rsq.next) = true */
	while (ns_rsqe_valid(card->rsq.next)) {
		dequeue_rx(card, card->rsq.next);
		ns_rsqe_init(card->rsq.next);
		/* previous is initialized */
		previous = card->rsq.next;
		if (card->rsq.next = card->rsq.last)
			card->rsq.next = card->rsq.base;
		else
			card->rsq.next++;
	}
	writel((((u32) previous) - ((u32) card->rsq.base)),
			card->membase + RSQH);
}
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
