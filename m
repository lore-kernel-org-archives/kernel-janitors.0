From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 12:11:51 +0000
Subject: Re: [PATCH 53/56] usb: Remove void casts
Message-Id: <36ca99e90904080511r5f02717h6fbf7bc63b7ffcf9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:22, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/usb/host/ehci-dbg.c |    2 +-
>  drivers/usb/host/ehci-mem.c |    6 ++----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/usb/host/ehci-mem.c b/drivers/usb/host/ehci-mem.c
> index 10d5291..c128491 100644
> --- a/drivers/usb/host/ehci-mem.c
> +++ b/drivers/usb/host/ehci-mem.c
> @@ -212,8 +211,7 @@ static int ehci_mem_init (struct ehci_hcd *ehci, gfp_t flags)
>        }
>
>        /* Hardware periodic table */
> -       ehci->periodic = (__le32 *)
> -               dma_alloc_coherent (ehci_to_hcd(ehci)->self.controller,
> +       ehci->periodic = dma_alloc_coherent (ehci_to_hcd(ehci)->self.controller,
Hmm, I would leave this in, because of the big endian/little endian
annotation. Else sparse (the static semantic checker) could complain.


>                        ehci->periodic_size * sizeof(__le32),
>                        &ehci->periodic_dma, 0);
>        if (ehci->periodic = NULL) {

Bert
