From: Greg KH <greg@kroah.com>
Date: Wed, 08 Dec 2004 16:08:09 +0000
Subject: Re: [KJ] patches: delete 75 unused files
Message-Id: <20041208160809.GA26212@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19248866704752365=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041208155439.GC31550@nd47.coderock.org>
In-Reply-To: <20041208155439.GC31550@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============19248866704752365==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2004 at 04:54:39PM +0100, Domen Puncer wrote:
>  drivers/pci/hotplug/pcihp_skeleton.c

This is a "skeleton" driver, and is in the tree to be used as an example
for others who want to write a pci hotplug driver.  It should stay.

Along those lines, how come you didn't include the usb-skeleton.c file
in your list (it too should stay, but it isn't part of the build...)?

thanks,

greg k-h

--===============19248866704752365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19248866704752365==--
