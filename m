From: Domen Puncer <domen@coderock.org>
Date: Wed, 08 Dec 2004 16:56:51 +0000
Subject: [KJ] Re: patches: delete 75 unused files
Message-Id: <20041208165651.GD31550@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21525594691777394=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21525594691777394==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/12/04 08:08 -0800, Greg KH wrote:
> On Wed, Dec 08, 2004 at 04:54:39PM +0100, Domen Puncer wrote:
> >  drivers/pci/hotplug/pcihp_skeleton.c
> 
> This is a "skeleton" driver, and is in the tree to be used as an example
> for others who want to write a pci hotplug driver.  It should stay.
Ok.

> Along those lines, how come you didn't include the usb-skeleton.c file
> in your list (it too should stay, but it isn't part of the build...)?
Probably because i first generated a list of "filenames" in kernel
(not just Makefile, #includes... everything), and "usb-skeleton.c"
appears in some file.

Yes, that misses some files, but also makes quite sure file isn't used.


	Domen

--===============21525594691777394==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21525594691777394==--
