From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 14 Feb 2005 18:26:37 +0000
Subject: Re: [KJ] [PATCH 12/18] drivers/scsi/ remove pci_find_{device, subsys}
Message-Id: <20050214182636.GI29917@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21083540512295795=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141140.33642.amitg@calsoftinc.com>
In-Reply-To: <200502141140.33642.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============21083540512295795==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:40:32AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys

Almost all of these drivers should be converted to use the pci_driver
model, not converted like this mechanical substitution.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============21083540512295795==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21083540512295795==--
