From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 08 Dec 2004 16:55:50 +0000
Subject: Re: [KJ] patches: delete 75 unused files
Message-Id: <20041208165549.GF5496@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39115131484575949=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041208155439.GC31550@nd47.coderock.org>
In-Reply-To: <20041208155439.GC31550@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============39115131484575949==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2004 at 08:08:09AM -0800, Greg KH wrote:
> On Wed, Dec 08, 2004 at 04:54:39PM +0100, Domen Puncer wrote:
> >  drivers/pci/hotplug/pcihp_skeleton.c
> 
> This is a "skeleton" driver, and is in the tree to be used as an example
> for others who want to write a pci hotplug driver.  It should stay.
> 
> Along those lines, how come you didn't include the usb-skeleton.c file
> in your list (it too should stay, but it isn't part of the build...)?

If I understand Domen's mail correctly, the mentioning of usb-skeleton 
in Documentation/DocBook/writing_usb_driver.tmpl and 
drivers/usb/input/xpad.c should be enough for preventing listing it.

> thanks,
> 
> greg k-h

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============39115131484575949==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39115131484575949==--
