From: Christoph Hellwig <hch@infradead.org>
Date: Fri, 24 Sep 2004 19:02:31 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm2] Create new function to
Message-Id: <20040924200231.A30391@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============00063341461457078196=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com>
In-Reply-To: <2480000.1095978400@w-hlinder.beaverton.ibm.com>; from hannal@us.ibm.com on Thu, Sep 23, 2004 at 03:26:40PM -0700
To: Hanna Linder <hannal@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, greg@kroah.com, kernel-janitors@lists.osdl.org, davej@codemonkey.org.uk, hpa@zytor.com

--===============00063341461457078196==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 23, 2004 at 03:26:40PM -0700, Hanna Linder wrote:
> 
> Greg asked in a previous janitors thread:
> "What we need is a simple "Is this pci device present right now" type
> function, to solve the mess that logic like this needs."
> 
> OK. How about this one? It uses pci_get_device but instead of returning
> the dev it returns 1 if the device is present and 0 if it isnt. This take the
> burdon off the driver from having to know when to use pci_dev_put or
> not and should be cleaner for future maintenance work.
> 
> Ive tested it with two patches that will follow.

Please include subdevice/subvendor id


--===============00063341461457078196==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============00063341461457078196==--
