From: Jim Nelson <james4765@cwazy.co.uk>
Date: Tue, 08 Feb 2005 23:43:53 +0000
Subject: Re: [KJ] [PATCH] Reduction of compile warnings (Warning: long post
Message-Id: <42094EB9.10307@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60527731044587996=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420953CC.2707.A99E9B@localhost>
In-Reply-To: <420953CC.2707.A99E9B@localhost>
To: kernel-janitors@vger.kernel.org

--===============60527731044587996==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Stephen Biggs wrote:
> Greetings,
> 
> This will be my first attempt at submitting a patch, so please be 
> reasonably gentle with me :-)  I have tried to comply with all that I 
> have read, but I most likely missed something.
> 
> I attach 3 files in text/plain Ascii format; I think I understood the 
> FAQ correctly that this is the right way to do things?
> 
> My build tree consists of 
> http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.11-
> rc3.tar.bz2 with Andrew Morton's -mm patch: 
> http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-
> rc3/2.6.11-rc3-mm1/2.6.11-rc3-mm1.bz2
> 
> I am running Fedora Core 3 with gcc 3.4.2 (I THINK that is the correct 
> version number - for me to be sure, I would have to reboot back into 
> Linux, and I don't want to do this right now.)  In any case, it is a 
> fully updated vanilla Fedora Core 3 (slightly customized kernel build).
> 
> It seems that 2.6.11-rc3-mm introduced a static function in swsusp.c 
> that breaks the compile on my GCC. This .
> 
> The error I get when trying to build the original is the first 
> attachment to this post.  
> The fix for this is part of the following patch. 
> 
> My sequence of execution for the build is:
> $ cd ~/linux-2.6.11-rc3-mm
> $ make mrproper && \
> make allyesconfig && \
> make bzImage 2>&1 | tee ~/warnings.txt
> 
> I have managed to reduce the number of warnings from 229 to 88.
> 
> I arrived at these numbers by first compiling the original without any 
> modifications (except the swsusp.c fix to enable completion of build), 
> and then a copy of the original with the following patch applied.  I 
> then executed:
> $  grep "warning:" ~/warnings.txt | wc -l
> 
> The second attachment to this post is the set of build warnings that are 
> still produced with this patch, distilled from a full build output, 
> warnings.txt by using
> $ grep "^[^ ()]" warnings.txt
> 
> The warnings that remain are mostly of the "deprecated" type for pm_* 
> type warnings that I need guidence on what to do about, since I was not 
> able to find any definitive guide to converting a driver with 2.4 style 
> power management to 2.6 style power management. Thus, I left these alone. 
>  I have not seen too much traffic about this on either the kernel-
> janitors list or lkml, so this would be open territory.  Any help on this 
> would be appreciated.
> 
> Most of the other warnings are about check_region which I see is already 
> being address as far as I can tell.
> 
> The rest of the warnings left are: deprecated for inter_module_* 
> functions which seems to be already a topic of discussion in lkml (or 
> was),  mca-legacy issues which I have no idea about, a couple of warnings 
> about mcdx not being edited which are legitimate, a hardcoded "#warning" 
> in drivers/isdn/capi/capidrv.c (?), another hardcoded #warning in 
> drivers/isdn/icn/icn.c, two assembly language warnings in 
> drivers/scsi/ultrastor.c for a line of assembly language that I can't 
> identify (and I can identify quite a few!).
> 
> The third attachment to this post is the patch itself.  Please let me 
> know if this comes through ok... 
> 
> 

Nope.  Got the swsusp-nocompile.txt, but everything else was munched by the 
mailing list.

You'll definitely want to split the patch up by driver, or directory at the very 
least.  You'll also want to send the patches as inlined text, with the 
Signed-off-by: line (see Documentation/SubmittingPatches and 
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt for more pointers).

There's a few good scripts out there for sending groups of patches to mailing 
lists.  I've also hacked up something to chop up a large diff by file, but I'm 
almost embarassed to show it in public :)

Jim

--===============60527731044587996==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60527731044587996==--
