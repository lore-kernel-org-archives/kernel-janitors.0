From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 14 Feb 2005 15:12:44 +0000
Subject: Re: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <20050214151244.GF29917@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53729145864795225=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150111.GH20620@rhum.iomeda.fr>
In-Reply-To: <20050214150111.GH20620@rhum.iomeda.fr>
To: Christophe Lucas <c.lucas@ifrance.com>
Cc: kernel-janitors@lists.osdl.org, Jeff Garzik <jgarzik@pobox.com>, linux-kernel@vger.kernel.org

--===============53729145864795225==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 04:01:11PM +0100, Christophe Lucas wrote:
> If PCI request regions fails, then someone else is using the
> hardware we wish to use. For that one case, calling
> pci_disable_device() is rather rude.
> See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Actually, that isn't necessarily true.  If the request_regions call fails,
that can mean there's a resource conflict.  If so, leaving the device
enabled is the worst possible thing to do as we'll now have two devices
trying to respond to the same io accesses.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============53729145864795225==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53729145864795225==--
