From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 14 Oct 2004 08:34:10 +0000
Subject: Re: [KJ] [PATCH 2.6] fore200e.c replace pci_find_device with
Message-Id: <20041014083410.GA7747@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58879594730309015=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <194130000.1097705759@w-hlinder.beaverton.ibm.com> <196790000.1097705910@w-hlinder.beaverton.ibm.com>
In-Reply-To: <196790000.1097705910@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, chas@cmf.nrl.navy.mil, greg@kroah.com

--===============58879594730309015==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 13, 2004 at 03:18:30PM -0700, Hanna Linder wrote:
> 
> 
> As pci_find_device is going away soon I have converted this file to use
> pci_get_device instead. I have compile tested it. If anyone has this ATM card
> and could test it that would be great.

Again this driver should be converted to pci_driver.  What you did didn't
plug the hotplug races anyway.



--===============58879594730309015==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58879594730309015==--
