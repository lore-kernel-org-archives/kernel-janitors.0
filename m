From: "Adrian Stanciu" <adrian@sadyc.net>
Date: Fri, 21 May 2004 11:56:19 +0000
Subject: [Kernel-janitors] VFS: fs/readdir.c
Message-Id: <20040521115619.11051.qmail@romus.ro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75750240660550228=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75750240660550228==
Content-Type: text/plain; format=flowed; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello, 

I'm doing some research work on VFS and linux filesystems.
I used kernel 2.4.25 but this things hold true for 2.6 as well 

1)
I found some unused old functions and structures in fs/readdir.c 

old unused functions: old_readdir, fillonedir and
old unusedstructures: old_linux_dirent, readdir_callback 

they aren't reffered anywhere in the kernel, 

maybe they should be removed? 

2)
in function dcache_readdir why we need the variable "i" ?
the call to filldir doesn't change it,
so why don't use filp->f_pos ?
(for kernel 2.6 dcache_reddir is in fs/libfs.c now..) 


BTW, shouldn't MAINTAINERS in kernel 2.4 contain a refference for VFS 
maintainer? 


If I send this email to the wrong place, please direct me the right place to 
send it. 

Thank you,
 --adrian. 


--===============75750240660550228==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75750240660550228==--
