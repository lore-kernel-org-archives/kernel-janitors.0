From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 04 Mar 2005 00:24:00 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <20050304002400.GD16078@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64981918406792127=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============64981918406792127==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2005 at 02:42:14AM +0200, Alexey Dobriyan wrote:
> On Thursday 03 March 2005 20:36, Nishanth Aravamudan wrote:
> 
> > Alexey, I'm curious, do you see a lot of these compile-time warnings with
> > the kernel?
> 
> No. [i386, ppc64, sparc, x86_64] x [2.6.11-rc5-mm1, 2.6.11, 2.6.11-kj]
> contain only one. It seems they are silently fixed in -mm by Andrew.
> 
> > In that driver alone I see a handful of other places where 
> > dec's and code are mixed.
> 
> Not a single one in mcdx.c. Declarations in mcdx_audio_ioctl(), mcdx_talk(),
> mcdx_init_drive(), mcdx_readtoc() ... are surrounded with { }. ;-)

Oh ok, so it's not function-oriented, but code block-oriented. Thanks
for the info!

-Nish

--===============64981918406792127==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64981918406792127==--
