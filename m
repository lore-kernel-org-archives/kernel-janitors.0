From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 14 Oct 2004 21:10:54 +0000
Subject: Re: [KJ] [Patch 2.6] resend of macro to go through all pci devices
Message-Id: <20041014211054.GW16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68387440614841299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <250830000.1097787576@w-hlinder.beaverton.ibm.com>
In-Reply-To: <250830000.1097787576@w-hlinder.beaverton.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============68387440614841299==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 14, 2004 at 01:59:36PM -0700, Hanna Linder wrote:
> I wrote this macro last week and was recently asked to resend it in case people
> missed the original submission. I have been using it during my conversion to
> pci_get_device and it seems to be fine.

Why not:

#define for_each_pci_dev(d, v, p) while ((d = pci_get_device(v, p, d)) != NULL)

That seems more generally useful to me.


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============68387440614841299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68387440614841299==--
