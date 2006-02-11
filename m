From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Feb 2006 03:28:08 +0000
Subject: Re: [KJ][Patch] re-send of remove second masking instance of
Message-Id: <1139628488.7781.27.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41238807532858468=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139572879.17620.23.camel@localhost.localdomain>
In-Reply-To: <1139572879.17620.23.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============41238807532858468==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-02-10 at 05:41 -0700, Matthew Wilcox wrote:

> Do you ever compare the code before and after your changes?  I ask
> because I don't think gcc does live range splitting yet.  So a variable
> which may have been register-allocated before may now move to the stack.
> It may often make more sense to rename a variable or manually do LRS.

Looking at that file I think you might be right, perhaps the author was
trying to manually do LRS or something as in the next function there is

...
else if ()
{
	u_char sign =
}
else if ()
{
	u_char sign =
}

but as they have mutually exclusive scope here I think that it is ok to
do it like that? or perhaps I should change that too ?

> Option (c) [the one you use] can be better.  If foo is a stack allocated
> variable anyway, this will force gcc to use the same stack slot for both.
> 
> So I'm not saying these patches are wrong, and I really want to see
> shadow variables eliminated (we should always have -Wshadow enabled, IMO).
> I'd just like to see some analysis of the consequences of each change.
> 

Ok doing a objdump on both the .o files then doing a diff on the two
gives me this. 

Note: I _think_ I did this right, but no guarantees.

--- fpu_trig.S.orig	2006-02-11 13:32:09.000000000 +1100
+++ fpu_trig.S	2006-02-11 13:40:28.000000000 +1100
@@ -1,5 +1,5 @@
 
-fpu_trig.o.orig:     file format elf32-i386
+fpu_trig.o:     file format elf32-i386
 
 Disassembly of section .text:
 
@@ -725,7 +725,7 @@ Disassembly of section .text:
      872:	75 48                	jne    8bc <fyl2xp1+0x99>
      874:	8a 57 09             	mov    0x9(%edi),%dl
      877:	80 e2 80             	and    $0x80,%dl
-     87a:	88 55 d2             	mov    %dl,0xffffffd2(%ebp)
+     87a:	88 55 db             	mov    %dl,0xffffffdb(%ebp)
      87d:	8d 55 e8             	lea    0xffffffe8(%ebp),%edx
      880:	8a 46 09             	mov    0x9(%esi),%al
      883:	24 80                	and    $0x80,%al
@@ -738,7 +738,7 @@ Disassembly of section .text:
      896:	e8 fc ff ff ff       	call   897 <fyl2xp1+0x74>
      89b:	0f b6 55 d3          	movzbl 0xffffffd3(%ebp),%edx
      89f:	8d 4d e8             	lea    0xffffffe8(%ebp),%ecx
-     8a2:	0f b6 45 d2          	movzbl 0xffffffd2(%ebp),%eax
+     8a2:	0f b6 45 db          	movzbl 0xffffffdb(%ebp),%eax
      8a6:	56                   	push   %esi
      8a7:	57                   	push   %edi
      8a8:	e8 fc ff ff ff       	call   8a9 <fyl2xp1+0x86>
@@ -896,11 +896,11 @@ Disassembly of section .text:
      aa1:	8a 56 09             	mov    0x9(%esi),%dl
      aa4:	b8 00 00 00 00       	mov    $0x0,%eax
      aa9:	80 e2 80             	and    $0x80,%dl
-     aac:	88 55 db             	mov    %dl,0xffffffdb(%ebp)
+     aac:	88 55 d2             	mov    %dl,0xffffffd2(%ebp)
      aaf:	ba 02 00 00 00       	mov    $0x2,%edx
      ab4:	e8 fc ff ff ff       	call   ab5 <fyl2xp1+0x292>
      ab9:	8a 46 09             	mov    0x9(%esi),%al
-     abc:	80 7d db 00          	cmpb   $0x0,0xffffffdb(%ebp)
+     abc:	80 7d d2 00          	cmpb   $0x0,0xffffffd2(%ebp)
      ac0:	74 04                	je     ac6 <fyl2xp1+0x2a3>
      ac2:	0c 80                	or     $0x80,%al
      ac4:	eb 02                	jmp    ac8 <fyl2xp1+0x2a5>



Like I said I know almost nothing about x86 arch asm but it looks to me
like they use the same addressing mode, just grab it from a different
location in memory. Perhaps you can tell me exactly whats going on ?

Also I went back and looked at the C code for problems resulting from
inserting the intermediate "int sign" variable into the global scope and
clobbering the global "int sign" variable. There are places where the
global "int sign" is used after(in the source file) the intermediate
without an assignment first but they all appear (and I hope I got this
right) to be on paths excluding the intermediate "int sign" variable
use.

I hope this answers your questions

Darren J.


--===============41238807532858468==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41238807532858468==--
