From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 15 Jan 2007 07:35:47 +0000
Subject: [KJ] cleaning out "dead" CONFIG variables
Message-Id: <Pine.LNX.4.64.0701150228140.4237@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  as another item on the TO DO list, what about locating and removing
apparently useless CONFIG variables?

  i wrote a short script to look for such things and here's one
example of what it found for the variable "X86_XADD" after running
"make allyesconfig":

$ grep -r X86_XADD .
./.config:CONFIG_X86_XADD=y
./arch/i386/defconfig:CONFIG_X86_XADD=y
./arch/i386/Kconfig.cpu:config X86_XADD
./arch/um/defconfig:CONFIG_X86_XADD=y

  in other words, there are a couple architectures that have that set
in their defconfig, and there is a "config" entry for it in the file
arch/i386/Kconfig.cpu, but absolutely *no one* in the entire source
tree looks at it or cares about it, so it would seem to have no effect
whatever on any kind of build.

  would it not make sense to simply delete variables like this?

rday

p.s.  as i understand it, if a variable is removed, then *eventually*
the various architecture defconfig files are rebuilt and will drop any
reference to that variable, is that right?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
