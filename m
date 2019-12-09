From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 09 Dec 2019 19:05:23 +0000
Subject: Re: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Message-Id: <CAKXUXMzd1OBdoOToPpuv6fh=eW+mNUPHcFdUjARxx+qBGMw=Bg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
 <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
In-Reply-To: <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com

On Mon, Dec 9, 2019 at 11:21 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> > De: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
> > À: "Thomas Hellstrom" <thellstrom@vmware.com>, dri-devel@lists.freedesktop.org
> > Cc: "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>, "Sinclair Yeh" <syeh@vmware.com>,
> > linux-graphics-maintainer@vmware.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Lukas Bulwahn"
> > <lukas.bulwahn@gmail.com>
> > Envoyé: Dimanche 8 Décembre 2019 18:53:28
> > Objet: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
>
> > Commit 508108ea2747 ("drm/vmwgfx: Don't refcount command-buffer managed
> > resource lookups during command buffer validation") slips in use of
> > deprecated PTR_RET. Use PTR_ERR_OR_ZERO instead.
> >
> > As the PTR_ERR_OR_ZERO is a bit longer than PTR_RET, we introduce
> > local variable ret for proper indentation and line-length limits.
>
> Is 0 actually possible?  I have the impression that it is not, but perhaps I missed something.
>

I did not sanity-check if 0 is possible before patch submission, just
cleaning the syntatic stuff here to prepare final removal of the
deprecated PTR_RET.
But as far as I see:

vmw_cmd_dx_clear_rendertarget_view
-> vmw_view_id_val_add
-> vmw_view_lookup
-> vmw_cmdbuf_res_lookup

which would then return a proper pointer/a non PTR_ERR value and
hence, it would be possible that PTR_ERR_OR_ZERO returns 0. It all
looks pretty sane.

Lukas
