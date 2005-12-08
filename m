From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Thu, 08 Dec 2005 10:13:31 +0000
Subject: [KJ] TODO list addition (struct optimization)
Message-Id: <20051208101331.GA21327@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82323993917259042=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82323993917259042==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

please add (something like) the following text to
http://janitor.kernelnewbies.org/TODO :

----------
Examine struct definitions used in kernel files and kernel driver files
on whether they have optimized layout.
Very frequently accessed struct member variables (e.g. locks or I/O address
base values) should be at the first struct position.
This will save additional asm opcodes (at least on x86) and code will thus
be faster and smaller.

Silly but simple example code making use of a struct:

void lock(void **lock)
{ ... }

...
  lock(&lck.mylock);
...

** The BAD Case **

typedef struct {
  char *name;
  void *mylock; <--- not at first position, thus inefficient!
} lock_t;

resulting x86 asm:

 8048444:       8d 45 f8                lea    0xfffffff8(%ebp),%eax
 8048447:       83 c0 04                add    $0x4,%eax <--- extra offset needed!
 804844a:       50                      push   %eax
 804844b:       e8 e1 ff ff ff          call   8048431 <lock>

** The GOOD Case **

typedef struct {
  /* most-accessed member first! */
  void *mylock;
  char *name;
} lock_t;

resulting x86 asm:

 8048444:       8d 45 f8                lea    0xfffffff8(%ebp),%eax
 8048447:       50                      push   %eax <---- no extra offset!
 8048448:       e8 e4 ff ff ff          call   8048431 <lock>

opcode savings: 3 bytes (9 vs. 12 bytes!)

Note that you should find out the most frequently accessed member not only
by looking at the *number of code places* that actually access this variable,
but also by properly adding up access counts in case a variable gets accessed
multiple times in a *loop*.

Of course any structs that need to keep a backwards compatible struct layout
should not be altered, though hopefully that won't apply to many structs.
----------

Thanks,

Andreas Mohr

--===============82323993917259042==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82323993917259042==--
