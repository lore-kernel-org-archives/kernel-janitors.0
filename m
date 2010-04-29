From: Greg KH <greg@kroah.com>
Date: Thu, 29 Apr 2010 23:33:07 +0000
Subject: Re: [PATCH] drivers/staging/comedi: dev_node removal
Message-Id: <20100429233307.GB6272@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1272258528.29373.7.camel@lenovo>
In-Reply-To: <1272258528.29373.7.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 26, 2010 at 01:33:57AM -0400, Javier Martinez Canillas wrote:
> This is the correct patch, I didn't notice that mi email client was wrapping the lines...sorry for the noise.
> 
> With today linux-next, I got a compilation error in
> drivers/staging/comedi.
> 
> drivers/staging/comedi/drivers/cb_das16_cs.c:719: error: ‘struct
> pcmcia_device’ has no member named ‘dev_node’
> 
> I think this patch solves the issue removing dev_node.

This should go through the pcmcia tree, please do it that way.

thanks,

greg k-h
