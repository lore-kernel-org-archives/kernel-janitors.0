From: Matthew Wilcox <willy@debian.org>
Date: Tue, 11 May 2004 17:33:17 +0000
Subject: Re: [Kernel-janitors] Patches for check_region -> request_region
Message-Id: <20040511173317.GA6278@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16989387766463793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <RACHAELrp3Ui9DGWnFn0000121a@rachael.letnet.net>
In-Reply-To: <RACHAELrp3Ui9DGWnFn0000121a@rachael.letnet.net>
To: kernel-janitors@vger.kernel.org

--===============16989387766463793==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2004 at 04:52:31PM +0000, lukemauldin@letu.edu wrote:
> This is my first attempt at kernel janitor work.  Any feedback would be  
> appreicated. 

It would be good if you learned what the different semantics
are for check_region and request_region and why it's not a simple
search-and-replace.  For a PCI driver such as trm290.c, it should
probably use pci_request_regions() instead.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============16989387766463793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16989387766463793==--
