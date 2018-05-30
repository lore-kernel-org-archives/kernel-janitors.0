From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 30 May 2018 11:20:40 +0000
Subject: Re: [Xen-devel] [PATCH] ALSA: xen-front: freeing an error pointer
Message-Id: <s5h7enlo0dz.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530103655.bnjzq2jpfrjjwvvj@kili.mountain>
 <588658f1-520f-be06-3ad5-9b97e3f8e866@gmail.com>
In-Reply-To: <588658f1-520f-be06-3ad5-9b97e3f8e866@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, kernel-janitors@vger.kernel.org, xen-devel@lists.xenproject.org, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, 30 May 2018 13:14:58 +0200,
Oleksandr Andrushchenko wrote:
> 
> On 05/30/2018 01:36 PM, Dan Carpenter wrote:
> > kfree() doesn't accept error pointers so I've set "str" to NULL on these
> > paths.
> >
> > Fixes: fd3b36045c2c ("ALSA: xen-front: Read sound driver configuration from Xen store")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/sound/xen/xen_snd_front_cfg.c b/sound/xen/xen_snd_front_cfg.c
> > index 38c7e1eefbb9..68dcd7d1f09e 100644
> > --- a/sound/xen/xen_snd_front_cfg.c
> > +++ b/sound/xen/xen_snd_front_cfg.c
> > @@ -306,6 +306,7 @@ static int cfg_get_stream_type(const char *path, int index,
> >   	str = xenbus_read(XBT_NIL, stream_path, XENSND_FIELD_TYPE, NULL);
> >   	if (IS_ERR(str)) {
> >   		ret = PTR_ERR(str);
> > +		str = NULL;
> >   		goto fail;
> >   	}
> >   @@ -347,6 +348,7 @@ static int cfg_stream(struct
> > xen_snd_front_info *front_info,
> >   	str = xenbus_read(XBT_NIL, stream_path, XENSND_FIELD_TYPE, NULL);
> >   	if (IS_ERR(str)) {
> >   		ret = PTR_ERR(str);
> > +		str = NULL;
> >   		goto fail;
> >   	}
> >   
> >
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xenproject.org
> > https://lists.xenproject.org/mailman/listinfo/xen-devel
> Thank you for your patch,
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Applied now.  Thanks.


Takashi
