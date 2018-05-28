From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 28 May 2018 09:29:08 +0000
Subject: Re: [PATCH][next] ALSA: xen-front: remove redundant error check on ret
Message-Id: <s5ha7skuo0r.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180527212312.23997-1-colin.king@canonical.com>
 <ee539e2d-568e-4bfa-a4aa-4a9b39bc1bd8@sakamocchi.jp>
In-Reply-To: <ee539e2d-568e-4bfa-a4aa-4a9b39bc1bd8@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Colin King <colin.king@canonical.com>

On Mon, 28 May 2018 00:42:12 +0200,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> On May 28 2018 06:23, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The error for a -ve value in ret is redundant as all previous
> > assignments to ret have an associated -ve check and hence it
> > is impossible for ret to be less that zero at the point of the
> > check.  Remove this redundant error check.
> >
> > Detected by CoveritScan, CID#1469407 ("Logically Dead code")
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   sound/xen/xen_snd_front_evtchnl.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
> > index d70a62e7f910..102d6e096cc8 100644
> > --- a/sound/xen/xen_snd_front_evtchnl.c
> > +++ b/sound/xen/xen_snd_front_evtchnl.c
> > @@ -351,8 +351,6 @@ int xen_snd_front_evtchnl_create_all(struct xen_snd_front_info *front_info,
> >   			}
> >   		}
> >   	}
> > -	if (ret < 0)
> > -		goto fail;
> >     	front_info->num_evt_pairs = num_streams;
> >   	return 0;
> 
> Yep. All branches for error path on the nested for loop have goto
> statement, thus no need to check error outer the loop.
> 
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Applied, thanks.


Takashi
