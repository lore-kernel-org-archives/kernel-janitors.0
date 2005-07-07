From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 07 Jul 2005 19:25:56 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes
Message-Id: <20050707192556.GB14906@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35843264188169766=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707010526.GA5406@garfield.casa.sp.br>
In-Reply-To: <20050707010526.GA5406@garfield.casa.sp.br>
To: kernel-janitors@vger.kernel.org

--===============35843264188169766==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 07, 2005 at 12:01:38PM -0700, Greg KH wrote:
> Please read the description of how pci_get_device() works.  In short it
> increments the reference count of the pci_dev that is returned.  Later
> on in this function, that pointer is saved off into a structure, which
> is fine.  Problem happens when that larger structure is freed when the
> device or driver is removed.  You need to decrement the usage count of
> that structure at that point in time.
> 
> Care to redo this?

Have we given up on getting people to convert drivers to the pci_driver
model then?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============35843264188169766==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35843264188169766==--
