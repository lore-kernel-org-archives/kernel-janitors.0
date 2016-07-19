From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jul 2016 08:21:26 +0000
Subject: Re: [PATCH v3] drm/ttm: Delete an unnecessary check before the function call "ttm_tt_destroy"
Message-Id: <20160719082126.GM17101@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <5649EC25.3040004@users.sourceforge.net>
 <ec9bf71e-8d0f-4bf3-b2ba-b0b1bd444b22@users.sourceforge.net>
 <20160718071208.GV17101@phenom.ffwll.local>
 <54338f58-830c-a8b4-4554-5d4459bcd321@users.sourceforge.net>
 <20160718144513.GA17101@phenom.ffwll.local>
 <CAMuHMdWDNrP_TRKddJyR4mURKqmA+5vFG++jSetm4j__t_YW6g@mail.gmail.com>
In-Reply-To: <CAMuHMdWDNrP_TRKddJyR4mURKqmA+5vFG++jSetm4j__t_YW6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, SF Markus Elfring <elfring@users.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Tue, Jul 19, 2016 at 10:14:07AM +0200, Geert Uytterhoeven wrote:
> On Mon, Jul 18, 2016 at 4:45 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Jul 18, 2016 at 04:10:36PM +0200, SF Markus Elfring wrote:
> >> From: Markus Elfring <elfring@users.sourceforge.net>
> >> Date: Mon, 18 Jul 2016 16:06:18 +0200
> >>
> >> The ttm_tt_destroy() function tests whether its argument is NULL
> >> and then returns immediately. Thus the test around the call is not nee=
ded.
> >>
> >> This issue was detected by using the Coccinelle software.
> >>
> >> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >
> > When resending pls describe what changed (and why). Also I'd still like
> > that smatch included in the commit message.
>=20
> A similar change was made in drm-next, causing a merge conflict
> between the drm-next and drm-misc trees.
>=20
> commit 4279cb1423d96e53b6b98ae9f2b41003b013a31f
> Author: Christian K=F6nig <christian.koenig@amd.com>
> Date:   Mon Jun 6 10:17:51 2016 +0200
>=20
>     drm/ttm: remove NULL checks when calling ttm_tt_destroy
>=20
>     The function is a no-op with a NULL pointer.
>=20
>     Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>     Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Yeah, realized that too but then drm-misc is a non-rebasing tree now, so
can't take this out.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
