From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 20 Mar 2006 16:07:24 +0000
Subject: Re: [KJ][Patch] coding style cleanp in pcnet_cs.c
Message-Id: <20060320080724.00926664.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============025822852184684386=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142231320.7791.44.camel@localhost.localdomain>
In-Reply-To: <1142231320.7791.44.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============025822852184684386==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Mar 2006 23:41:20 +1100 Darren Jenkins\\ wrote:

> G'day list,
> 
> OK after a bit of digging on my part I have worked out how to compare
> object files, (I think) and compared the object files in my three coding
> style patches.

Thanks for the confirmations.

> Steps taken
> 
> create object files with 	:make -> orig.o, patch1.o, patch2.o
> disassemble object files with	:objdump -d file.x > file.y
> remove extraneous 1'st columns	: cut -f 2-15 file.y > file.z
> diff files			: diff -up patch1.z patch2.z
> 
> results axnet_cs.c patches
> 
> darren@ubuntu:~/Desktop/objectfiles/axnet_cs$ diff -up patch1.diss patch2.diss
> --- patch1.diss 2006-03-20 22:30:14.000000000 +1100
> +++ patch2.diss 2006-03-20 22:30:26.000000000 +1100
> @@ -1,5 +1,5 @@
> 
> -axnet_cs.patch1.o:     file format elf32-i386
> +axnet_cs.patch2.o:     file format elf32-i386
> 
>  Disassembly of section .text:
> 
> 
> results for i82365.c
> 
> 
> darren@ubuntu:~/Desktop/objectfiles/i82365$ diff -up patch1.diss patch2.diss
> --- patch1.diss 2006-03-20 22:50:33.000000000 +1100
> +++ patch2.diss 2006-03-20 22:50:45.000000000 +1100
> @@ -1,5 +1,5 @@
> 
> -i82365.patch1.o:     file format elf32-i386
> +i82365.patch2.o:     file format elf32-i386
> 
>  Disassembly of section .text:
> 
> 
> results for pcnet_cs.c
> 
> The first patch doesn't actually apply cleanly (because of the file names I used)
> so I will redo (hand edit?) this one and resend (probably tomorrow).
> 
> 
> darren@ubuntu:~/Desktop/objectfiles/pcnet_cs$ diff -up patch1.diss patch2.diss
> --- patch1.diss 2006-03-20 23:26:34.000000000 +1100
> +++ patch2.diss 2006-03-20 23:26:42.000000000 +1100
> @@ -1,5 +1,5 @@
> 
> -pcnet_cs.patch1.o:     file format elf32-i386
> +pcnet_cs.patch2.o:     file format elf32-i386
> 
>  Disassembly of section .text:
> 
> 
> To ensure this was correct I also did a diff against the original files this way, 
> and there were differences in the asm (in all 3 cases), so as there were no differences 
> here, I believe this shows there are no code changes in the three coding style patches.
> 
> Also if anyone is interested I can send you my files. 
> (but I guess you can all follow what I have done, and it isn't terribly 
> interesting anyway :)

---
~Randy

--===============025822852184684386==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============025822852184684386==--
