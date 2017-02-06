From: Felix Manlunas <felix.manlunas@cavium.com>
Date: Mon, 06 Feb 2017 22:27:21 +0000
Subject: Re: [bug report] liquidio: fix for iq and droq cnts going negative
Message-Id: <20170206222721.GA9632@felix.cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170206090845.GA14504@mwanda>
In-Reply-To: <20170206090845.GA14504@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 06, 2017 at 1:23AM -0800, Dan Carpenter wrote:
> Also the other one in lio_vf_main.c
> 
> drivers/net/ethernet/cavium/liquidio/lio_vf_main.c:1635 liquidio_napi_poll()
> error: we previously assumed 'iq' could be null (see line 1621)
> 
> regards,
> dan carpenter
> 
> On Mon, Feb 06, 2017 at 12:08:45PM +0300, Dan Carpenter wrote:
> > Hello Satanand Burla,
> > 
> > This is a semi-automatic email about new static checker warnings.
> > 
> > The patch cdb478e5e413: "liquidio: fix for iq and droq cnts going 
> > negative" from Jan 31, 2017, leads to the following Smatch complaint:
> > 
> > drivers/net/ethernet/cavium/liquidio/lio_main.c:2450 liquidio_napi_poll()
> > 	 error: we previously assumed 'iq' could be null (see line 2436)

Thanks, Dan.  We will fix this.
