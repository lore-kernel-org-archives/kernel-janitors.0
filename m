From: Gustavo Franco <stratus@acm.org>
Date: Wed, 08 Dec 2004 17:05:20 +0000
Subject: Re: [KJ] patches: delete 75 unused files
Message-Id: <1102525520.18918.20.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19913255702747779=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041208155439.GC31550@nd47.coderock.org>
In-Reply-To: <20041208155439.GC31550@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============19913255702747779==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-12-08 at 08:08 -0800, Greg KH wrote:
> On Wed, Dec 08, 2004 at 04:54:39PM +0100, Domen Puncer wrote:
> >  drivers/pci/hotplug/pcihp_skeleton.c
> 
> This is a "skeleton" driver, and is in the tree to be used as an example
> for others who want to write a pci hotplug driver.  It should stay.
> 
> Along those lines, how come you didn't include the usb-skeleton.c file
> in your list (it too should stay, but it isn't part of the build...)?
> 

Hi Greg,

Why these drivers are under the build tree and not in Documentation/
directory? Is it documented anywhere? I'm just curious.

Thanks,
Gustavo Franco -- <stratus@acm.org>


--===============19913255702747779==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19913255702747779==--
