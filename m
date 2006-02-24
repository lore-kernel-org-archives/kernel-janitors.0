From: "John W. Linville" <linville@tuxdriver.com>
Date: Fri, 24 Feb 2006 21:46:46 +0000
Subject: Re: [KJ][Patch] alter prototypes in airo.c platform.h
Message-Id: <20060224214641.GC1698@tuxdriver.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98851754999892871=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140516994.7780.37.camel@localhost.localdomain>
In-Reply-To: <1140516994.7780.37.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============98851754999892871==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2006 at 09:16:34PM +1100, Darren Jenkins" wrote:
> G'day list,
> 
> This one finishes up the altering prototypes (because they contain
> register) patches.
> 
> >From http://linuxicc.sourceforge.net/
> 
> ICC complains about :Storage Class is not First
> 
> @ line 231 of platform.h &
> @ lines 1078 & 1079 of airo.c
> 
> These are caused by the prototypes miss-naming the variables as
> "register". Which as it is a keyword is an error.
> 
> The patch below renames the variables in the prototypes to match the
> functions.
> 
> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
Acked-by: John W. Linville <linville@tuxdriver.com>

Do I need to merge the airo hunk?

John
-- 
John W. Linville
linville@tuxdriver.com

--===============98851754999892871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98851754999892871==--
