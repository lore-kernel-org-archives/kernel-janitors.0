From: Dan Carpenter <error27@gmail.com>
Date: Wed, 06 Oct 2010 04:34:10 +0000
Subject: Re: [PATCH 19/28] Staging: comedi: drivers: adl_pci9111.c: Edit
Message-Id: <20101006043409.GA5409@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com> <1286326843-6170-19-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-19-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracey Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 05, 2010 at 09:00:34PM -0400, Tracey Dent wrote:
>  
>  #define pci9111_ai_channel_get()					\
> -  (inb(PCI9111_IO_BASE+PCI9111_REGISTER_AD_CHANNEL_READBACK)		\
> -   &PCI9111_CHANNEL_MASK)
> +	(inb(PCI9111_IO_BASE+PCI9111_REGISTER_AD_CHANNEL_READBACK)		\
> +		&PCI9111_CHANNEL_MASK)
                                                                               ^^^

That slash used to line up nicely with the slash from the line before.

regards,
dan carpenter

