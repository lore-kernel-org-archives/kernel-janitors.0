From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 12 Nov 2007 07:44:06 +0000
Subject: Re: [PATCH] sound/pci: remove duplicated defines
Message-Id: <s5h8x53ykl5.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071109114757.616b1d0b@lucky.kitzblitz>
In-Reply-To: <20071109114757.616b1d0b@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

At Mon, 12 Nov 2007 08:41:37 +0100,
I wrote:
> 
> > diff -ur a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
> > --- a/sound/pci/rme9652/hdsp.c	2007-11-07 11:26:36.000000000 +0100
> > +++ b/sound/pci/rme9652/hdsp.c	2007-11-09 11:22:31.000000000 +0100
> > @@ -104,8 +104,6 @@
> >  #define HDSP_statusRegister    0
> >  #define HDSP_timecode        128
> >  #define HDSP_status2Register 192
> > -#define HDSP_midiDataOut0    352
> > -#define HDSP_midiDataOut1    356
> >  #define HDSP_midiDataIn0     360
> >  #define HDSP_midiDataIn1     364
> >  #define HDSP_midiStatusOut0  384
> 
> These are definitions of registers, thus it'd be helpful to keep for
> the future extension/debug (as currently no datasheet is available).

Urgh, my mistake.  This patch just removes the duplicated defines.
I'll take all, of course, then.


thanks,

Takashi
