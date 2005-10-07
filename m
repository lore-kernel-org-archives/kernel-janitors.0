From: Felix Oxley <lkml@oxley.org>
Date: Fri, 07 Oct 2005 11:34:03 +0000
Subject: [KJ] Fixing:  char *foo = "blah";
Message-Id: <200510071234.04923.lkml@oxley.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57787305285060708=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57787305285060708==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> From: Jeff Garzik <jgarzik at mandrakesoft dot com>
> 
> 1) The string form
> 
>         [const] char *foo = "blah";
> 
> creates two variables in the final assembly output, a static string, and
> a char pointer to the static string.  The alternate string form
> 
>         [const] char foo[] = "blah";
> 
> is better because it declares a single variable.
> 
> For variables marked __initdata, the "*foo" form causes only the
> pointer, not the string itself, to be dropped from the kernel image,
> which is a bug.  Using the "foo[]" form with regular 'ole local
> variables also makes the assembly shorter.
> 

I plan to take on this task as described at:
			http://www.kerneljanitors.org/TODO

I have a number of queries:

1. 	I presume that the [brackets] indicate that const is optional.
	Therefore the following needs correcting:
		char *foo = "blah";

2.	I suppose that the following form would also need correcting:
		static const char *foo = "blah"

3.	Does the following (with an empty string) need correcting?
		[const] char *foo = "";

4. 	What about this?
		static const char *class_name[] = { "off","UBR","CBR","VBR","ABR" };


5. 	These changes are spread across the kernel code.
	Do patches need to be submitted to individual subsystem maintainers, or will 
a single patch be ok?

cheers,
felix


--===============57787305285060708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57787305285060708==--
