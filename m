From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 20 Oct 2004 22:03:47 +0000
Subject: Re: [KJ] [RFT 2.6] intel-agp.c: replace pci_find_device with
Message-Id: <20041020220347.GZ16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89544502034912998=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <17420000.1098298334@w-hlinder.beaverton.ibm.com>
In-Reply-To: <17420000.1098298334@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, davej@codemonkey.org.uk

--===============89544502034912998==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2004 at 11:52:14AM -0700, Hanna Linder wrote:
> 
> As pci_find_device is going away soon I have converted this file to use
> pci_get_device instead. I have compile tested it. If anyone has this hardware
> and could test it that would be great.

Should be converted to the pci_driver API.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============89544502034912998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89544502034912998==--
