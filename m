From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 07 Nov 2007 09:55:36 +0000
Subject: somehow, there *must* be a cleaner "log2" rewrite of this
Message-Id: <Pine.LNX.4.64.0711070453410.26359@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  from fs/nfs/internal.h:

==/*
 * Determine the actual block size (and log2 thereof)
 */
static inline
unsigned long nfs_block_bits(unsigned long bsize, unsigned char *nrbitsp)
{
        /* make sure blocksize is a power of two */
        if ((bsize & (bsize - 1)) || nrbitsp) {
                unsigned char   nrbits;

                for (nrbits = 31; nrbits && !(bsize & (1 << nrbits)); nrbits--)
                        ;
                bsize = 1 << nrbits;
                if (nrbitsp)
                        *nrbitsp = nrbits;
        }

        return bsize;
}
==
  there *has* to be a simpler version of that using the log2 macros
from log2.h, no?  i'm just too lazy to think about it right now.

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
