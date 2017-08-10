From: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
Date: Thu, 10 Aug 2017 13:38:49 +0000
Subject: Re: [PATCH 04/12] [media] V4L2: platform: rcar_jpu: constify v4l2_m2m_ops structures
Message-Id: <CALi4nhp_xQodYy9Y=Cma4NSJh5wwPKhSksfj+HAtJ4jnCMHrxg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr> <1502007921-22968-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502007921-22968-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-kernel@vger.kernel.org

On Sun, Aug 6, 2017 at 11:25 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The v4l2_m2m_ops structures are only passed as the only
> argument to v4l2_m2m_init, which is declared as const.
> Thus the v4l2_m2m_ops structures themselves can be const.
>
> Done with the help of Coccinelle.
>
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct v4l2_m2m_ops i@p = { ... };
>
> @ok1@
> identifier r.i;
> position p;
> @@
> v4l2_m2m_init(&i@p)
>
> @bad@
> position p != {r.p,ok1.p};
> identifier r.i;
> struct v4l2_m2m_ops e;
> @@
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct v4l2_m2m_ops i = { ... };
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Ulyanov Mikhail <mikhail.ulyanov@cogentembedded.com>
