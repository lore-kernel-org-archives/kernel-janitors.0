From: maximilian attems <janitor@sternwelten.at>
Date: Tue, 25 May 2004 08:56:15 +0000
Subject: Re: [Kernel-janitors] [PATCH] h8.c (maybe)
Message-Id: <20040525085615.GE1466@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40613488202325421=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405020843210.1663@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405020843210.1663@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============40613488202325421==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 02 May 2004, MJK wrote:

> 
> 	Added code in case kernel_thread fails. I also can't test this. I
> can't seem to locate the uCLinux files necessary to compile the kernel and
> include these. If it's already in the 2.6.5 kernel, can someone tell me
> where or how to trick menuconfig to add these in? :)

well h8 depends on CONFIG_OBSOLETE, forget it,
hmm looked at lkml, there were already requests to remove it:
http://www.cs.helsinki.fi/linux/linux-kernel/2003-28/0191.html

a++ maks
 

--===============40613488202325421==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40613488202325421==--
