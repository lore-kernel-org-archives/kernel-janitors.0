From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Mon, 30 Aug 2010 08:31:05 +0000
Subject: Re: [patch] pcmcia: comedi: fix compile error
Message-Id: <20100830083105.GA1295@isilmar-3.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100830081231.GL9832@bicker>
In-Reply-To: <20100830081231.GL9832@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Marcel Holtmann <marcel@holtmann.org>, Alexander Kurz <linux@kbdbabel.org>, Andrea Gelmini <andrea.gelmini@gelma.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan,

On Mon, Aug 30, 2010 at 10:14:45AM +0200, Dan Carpenter wrote:
> We changed struct pcmcia_device in 90abdc3b973229 "pcmcia: do not use
> io_req_t when calling pcmcia_request_io()".  The rest of this file got
> updated to the new API but this line was missed so my config doesn't
> compile.

a similar patch is already in my queue -- will send it to Linus for -rc4...

Thanks,
	Dominik
