From: "Howell, David P" <david.p.howell@intel.com>
Date: Tue, 29 Mar 2005 16:16:11 +0000
Subject: RE: [KJ] A question about uninitializing static variables
Message-Id: <331AD7BED1579543AD146F5A1A44D52506B6A4C9@fmsmsx403.amr.corp.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17432802000389358=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40875.158.102.162.5.1112106681.squirrel@picard.linux.it>
In-Reply-To: <40875.158.102.162.5.1112106681.squirrel@picard.linux.it>
To: kernel-janitors@vger.kernel.org

--===============17432802000389358==
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8bit

Using the symbol table display tools like objcmp or nm on the object
file should show what section the symbol is allocated in after a link.
By definition .bss is always zero'ed by the implementation. If they 
can see all of the symbols in this category allocated in .bss, that 
should be enough.

Thanks,
Dave Howell

david.p.howell@intel.com
 

-----Original Message-----
From: kernel-janitors-bounces@lists.osdl.org
[mailto:kernel-janitors-bounces@lists.osdl.org] On Behalf Of Carlo
Perassi
Sent: Tuesday, March 29, 2005 9:31 AM
To: kernel-janitors@lists.osdl.org
Subject: [KJ] A question about uninitializing static variables

Hi.
One of the tasks at http://janitor.kernelnewbies.org/TODO
is described as

"
uninitialize static variables initialized to 0, to make it go to the
.bss, instead of .data.
"

I made two patches for two maintainers which uninitialize some static
int used as module parameters and actually initialized to 0.

One maintainer do not have problems with the patches but the maintainer
of the file the second patch refers to would like to have some kind of
"proof" that "it is still guaranteed that those variables will be
initialized to 0". I wrote him something like "this simple hello module
shows it is still guaranteed..." but it's not enough for him. I guess
he'd like a more formal explanation of the following statement:

An uninitialized static variable of {the kernel, a kernel module} will
be compiled to go to the .bss and it is guaranteed that will be
"zero-ed" there.

Is there someone with a link or something I could send to this
maintainer to show him the reasons why the previous statement is true?
Maybe it could be useful to put this reference in the TODO itself.

Thanks.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============17432802000389358==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17432802000389358==--
