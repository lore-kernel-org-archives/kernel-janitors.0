From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 24 May 2004 18:22:49 +0000
Subject: Re: [Kernel-janitors] VFS: fs/readdir.c
Message-Id: <20040524112249.72f4a5bf.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94870666981001217=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040521115619.11051.qmail@romus.ro>
In-Reply-To: <20040521115619.11051.qmail@romus.ro>
To: kernel-janitors@vger.kernel.org

--===============94870666981001217==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 May 2004 14:56:19 +0300 Adrian Stanciu wrote:

| Hello, 
| 
| I'm doing some research work on VFS and linux filesystems.
| I used kernel 2.4.25 but this things hold true for 2.6 as well 
| 
| 1)
| I found some unused old functions and structures in fs/readdir.c 
| 
| old unused functions: old_readdir, fillonedir and
| old unusedstructures: old_linux_dirent, readdir_callback 
| 
| they aren't reffered anywhere in the kernel, 
| 
| maybe they should be removed? 

I'm looking in 2.6.6, not 2.4.25.  old_readdir() is still a valid
syscall.  fillonedir() calls old_readdir().
See the syscalls in arch/i386/kernel/entry.S e.g.

| 2)
| in function dcache_readdir why we need the variable "i" ?
| the call to filldir doesn't change it,
| so why don't use filp->f_pos ?
| (for kernel 2.6 dcache_reddir is in fs/libfs.c now..) 

<i> does get changed in 2.6.6.  Even if it doesn't, let the
compiler handle whether it really is allocated stack space or
register space or neither.

| BTW, shouldn't MAINTAINERS in kernel 2.4 contain a refference for VFS 
| maintainer? 

There wasn't an official VFS maintainer in 2.4 IIRC.

| If I send this email to the wrong place, please direct me the right place to 
| send it. 

For filesystem-related topics, generally use linux-fsdevel@vger.kernel.org .

--
~Randy

--===============94870666981001217==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94870666981001217==--
