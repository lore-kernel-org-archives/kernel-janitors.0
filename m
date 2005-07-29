From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 29 Jul 2005 17:38:13 +0000
Subject: Re: [KJ] [PATCH] drivers/video/vgastate.c - remove unnecessary calls
Message-Id: <20050729173812.GA7115@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19421894503242321=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42EA32EB.5010609@steunenberg.org>
In-Reply-To: <42EA32EB.5010609@steunenberg.org>
To: kernel-janitors@vger.kernel.org

--===============19421894503242321==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-07-29 at 15:45:15 +0200, Jerome Steunenberg <jerome@steunenberg.org> wrote:
> Second try for this patch. Please tell me if I got it OK!
> For the line wrapping, it now passes patch-tester@coderock.org, so I hope 
> it's OK.
> If not, can those of you who use Thunderbird tell me what settings you use 
> ? Thanks
> 
> In drivers/video/vgastate.c, the unnecessary calls to init_module and 
> cleanup_module have been removed
> 
> Signed-off-by: Jerome Steunenberg <jerome@steunenberg.org>
> 
> 
> 
> --- linux-2.6.13-rc3/drivers/video/vgastate.c.orig	2005-07-25 
> 15:09:51.000000000 +0200
> +++ linux-2.6.13-rc3/drivers/video/vgastate.c	2005-07-29 
> 15:03:45.000000000 +0200

Unfortunately it still wraps lines.

I'm not using TB so I just do a shot in the dark; Try to attach your
patch + description as a _plain text_ attachement. This should also
work.

Cheers, Tobias

--===============19421894503242321==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19421894503242321==--
