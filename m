From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 13 Mar 2007 22:14:16 +0000
Subject: Re: [KJ] anyone interested in removing dead header files?
Message-Id: <Pine.LNX.4.64.0703131805290.3737@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703100424200.25200@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703100424200.25200@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Mar 2007, Douglas Landgraf wrote:

> Hi Robert,
>
>     I'm working on that.. I think you could create an item at Wiki to
> add this sort of tool that you used.

just FYI, my stunningly primitive first attempt to find "dead" header
files is as follows:

==================================#!/bin/sh

#  This script should always be run from the *top* of the kernel
# source tree.
#
#  Typical usage:
#
#  $ dead_headers.sh sound

DIR=${1-*}

#  Make a list of all of the header files in the given directory
# structure, and rip off their basenames.

LONGHDRS=$(find ${DIR} -name "*.h")
HDRS=""

for h in ${LONGHDRS} ; do
        HDRS="${HDRS} $(basename ${h})"
done

HDRS=$(for h in ${HDRS} ; do echo $h ; done | sort -u)

for h in ${HDRS} ; do
        (grep -rw "${h}" * | grep -q include) || find . -name ${h}
done
==================================
  i'm sure you can appreciate how childishly simplistic this is:

1) given a directory name as an argument (default "*"), collect the
basename of all header files under that directory.

2) for each of those header file basenames, scan the *entire* tree
looking for *any* include reference of *any* kind to that header file
name.  if you can't find one, it's a dead header file.

  you can see how outrageously conservative this script is.  it's
absolutely *guaranteed* to miss some, but i was curious what i would
come up with.  obviously, this script can be made more intelligent.
feel free to make improvements.

  as a sample run,

  $ dead_headers.sh sound
  ./sound/pci/au88x0/au88x0_sb.h
  ./sound/pci/cs46xx/imgs/cwcemb80.h

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
