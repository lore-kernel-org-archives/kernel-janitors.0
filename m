From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 12 Jul 2004 11:06:09 +0000
Subject: Re: [Kernel-janitors] [PATCH] h8.c (maybe)
Message-Id: <20040712110609.GD1831@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45143401230665026=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405020843210.1663@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405020843210.1663@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============45143401230665026==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 25 May 2004, maximilian attems wrote:

> On Sun, 02 May 2004, MJK wrote:
> 
> > 
> > 	Added code in case kernel_thread fails. I also can't test this. I
> > can't seem to locate the uCLinux files necessary to compile the kernel and
> > include these. If it's already in the 2.6.5 kernel, can someone tell me
> > where or how to trick menuconfig to add these in? :)
> 
> well h8 depends on CONFIG_OBSOLETE, forget it,
> hmm looked at lkml, there were already requests to remove it:
> http://www.cs.helsinki.fi/linux/linux-kernel/2003-28/0191.html

h8 has now been removed in linux tree speaking of: 2.6.8-rc1

a++ maks


--===============45143401230665026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45143401230665026==--
