From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 04 May 2006 17:01:00 +0000
Subject: Re: [KJ] 720KB Floppy on 64bit Linux
Message-Id: <20060504100100.2f22854f.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54386928267396195=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4457C938.1070601@nachtwindheim.de>
In-Reply-To: <4457C938.1070601@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============54386928267396195==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 04 May 2006 11:27:30 +0200 Henne wrote:

> Randy.Dunlap wrote:
> >> Henne wrote:
> >>> Mounting it Kernel says:
> >>> FAT: invalid media value (0x44)
> >>> VFS: Can't find a valid FAT filesystem on dev fd0
> >> I found out something interesting:
> >> I made an image of my old disk with dd and here's the hexdump of the bootsector:
> >>
> >> 00000000  eb 3c 90 4d 53 44 4f 53  35 2e 90 6e 02 02 7f cf  |.<.MSDOS5..n....|
> >> 00000010  eb 3c 90 4d 53 44 4f 53  35 2e 30 00 02 02 01 00  |.<.MSDOS5.0.....|
> >> 00000020  02 70 00 a0 05 f9 03 00  09 00 02 00 00 00 00 00  |.p..............|
> >> 00000030  00 00 00 00 00 00 29 dc  1c 2c 02 00 53 41 00 00  |......)..,..SA..|
> >>
> >> You may notice, that the media invalid media value (0x44) is that from offset 0x15.
> > 
> > Yes, but part of that line looks wrong (like duplicated from above).
> > Suspicious.
> > 
> >> But on the disk image the correct value is on offset 0x25 (the 0xf9), so struct fat_boot_sector
> >> must start on 0x10 to work correctly.
> > 
> > Yes, looks weird.
> > 
> >> IN THIS CASE!
> >>
> >> "Normal" 1.44MB FAT disks have a bootsector like this one:
> >>
> >> 00000000  eb 3c 90 4d 53 44 4f 53  35 33 79 00 02 01 01 00  |.<.MSDOS53y.....|
> >> 00000010  02 e0 00 40 0b f0 09 00  12 00 02 00 00 00 00 00  |...@............|
> >> 00000020  00 00 00 00 00 00 29 45  49 53 41 53 59 53 52 4f  |......)EISASYSRO|
> >> 00000030  4d 35 20 20 20 20 46 41  54 31 32 20 20 20 fa 33  |M5    FAT12   .3|
> >>
> >> So there everything is allright!
> >>
> >> But why everything works under i386 and not under x86_64?
> > 
> > I tested on x86_64 with no problems.  Formatted a 720 KB floppy
> > and a 1.4 MB floppy using both mkdosfs and kfloppy, mounted and
> > read them both fine.
> 
> But I don't understand why a slackware10.2/2.6.17-rc3(selfcompiled) got it,
> and Suse10.0_64/2.6.17-rc3(selfcompiled) got it not.
> I have also FREEDOS on my i386 which got it too. Strange..
> The disks are 3.5 inch with no hole on the left side, are purchased by EBay and seem to be original.
> They are from the game "Das schwarze Auge-Schicksalsklinge" which is the german original of "Realms of arkania-Blade of destiny".
> And if the work under FREEDOS and i386 I can't belive that the disks are broken.
> Nevertheless it is not critical for me, since I got the files from my i386 and moved it to my x86_64.

Good for you, glad to hear that you worked around it, whatever "it" is.
But if there is a more general/global problem, I would think that we
would have heard about it by now...

Please compare your boot sector(s) with this:
  http://www.win.tue.nl/~aeb/linux/fs/fat/fat-1.html#ss1.2

> It's nice to see how you can bypass the install routine with open-source tools and a little knowledge how to use them :) .
> 
> But the main question is: Why does it not work?
> Can you send the first 5 lines of the disks you formatted, please?
> And also try to format a 1.44 disk to 720.

I cannot successfully format a 1.4 MB floppy to 720 KB -- it always
has I/O errors.

Here's is boot sector from a 720 KB floppy:

000000 eb 3c 90 6d 6b 64 6f 73 66 73 00 00 02 02 01 00  >.<.mkdosfs......<
000010 02 70 00 a0 05 f9 03 00 09 00 02 00 00 00 00 00  >.p..............<
000020 00 00 00 00 00 00 29 ad 47 59 44 4b 44 45 20 46  >......).GYDKDE F<
000030 6c 6f 70 70 79 20 46 41 54 31 32 20 20 20 0e 1f  >loppy FAT12   ..<
000040 be 5b 7c ac 22 c0 74 0b 56 b4 0e bb 07 00 cd 10  >.[|.".t.V.......<

and from a 1.4 MB floppy:

000000 eb 3c 90 6d 6b 64 6f 73 66 73 00 00 02 01 01 00  >.<.mkdosfs......<
000010 02 e0 00 40 0b f0 09 00 12 00 02 00 00 00 00 00  >...@............<
000020 00 00 00 00 00 00 29 f9 47 59 44 4b 44 45 20 46  >......).GYDKDE F<
000030 6c 6f 70 70 79 20 46 41 54 31 32 20 20 20 0e 1f  >loppy FAT12   ..<
000040 be 5b 7c ac 22 c0 74 0b 56 b4 0e bb 07 00 cd 10  >.[|.".t.V.......<


---
~Randy

--===============54386928267396195==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54386928267396195==--
