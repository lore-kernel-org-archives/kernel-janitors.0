From: Eamonn Lachlan <eol@boo.st>
Date: Mon, 07 Mar 2005 00:17:38 +0000
Subject: Re: [KJ] kernel-parameters.txt
Message-Id: <20050307001741.4AB1C24135@boo.st>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29743335891817746=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <422A58AB.8040601@osdl.org>
In-Reply-To: <422A58AB.8040601@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============29743335891817746==

Randy wrote:
>
>  ... [Documentation/x86_64/boot-options.txt]
> should be merged into kernel-parameters.txt,
> with indications that they are X86-64 only.

I'll have a look at merging the two files first, then,
alright?

A quick grep of the arch trees in 2.6.11 says there are 

   1 arch/alpha       1 arch/ppc
  11 arch/arm         9 arch/ppc64
   5 arch/arm26       5 arch/s390
  21 arch/i386        4 arch/sh
  12 arch/ia64        2 arch/sh64
   1 arch/m32r        1 arch/sparc
   3 arch/mips        8 arch/um
   2 arch/parisc     22 arch/x86_64

so many occurences of "__setup(".

But in the kernel-parameters.txt file, I only see only
four params with a PPC* arch flag where I would expect
to find ten.

There seem to be a lot missing. :)

Should I hunt the missing params down in their arch trees
and add them in?

e.

--===============29743335891817746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29743335891817746==--
