From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 05 May 2017 14:09:16 +0000
Subject: Re: [PATCH 0/5] GPU-DRM-STI: Fine-tuning for some function implementations
Message-Id: <20170505140916.zoe4sxe3xjtvdlag@art_vandelay>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
In-Reply-To: <f4a1bd89-50c4-ea2d-ea70-de5209b8a55a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>

On Fri, May 05, 2017 at 03:50:49PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 May 2017 15:45:45 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 

Hi Markus,
It seems like you're back to submitting cocci patches again :)

We left off in September asking you to contact the list before sending these
types of patches, and to ensure they were properly tested [1]. I don't see any
evidence that either of these things have been done.

I don't want to waste your time by ignoring your patches, so please ensure that
your patches provide value and that they are tested.

Sean


[1]- http://www.spinics.net/lists/linux-kernel-janitors/msg28134.html

> Markus Elfring (5):
>   Reduce function calls for sequence output at five places
>   Replace 17 seq_puts() calls by seq_putc()
>   Fix a typo in a comment line
>   Fix typos in a comment line
>   Adjust two checks for null pointers in sti_hqvdp_probe()
> 
>  drivers/gpu/drm/sti/sti_cursor.c |  5 ++---
>  drivers/gpu/drm/sti/sti_dvo.c    |  3 +--
>  drivers/gpu/drm/sti/sti_gdp.c    |  3 +--
>  drivers/gpu/drm/sti/sti_hda.c    |  9 +++------
>  drivers/gpu/drm/sti/sti_hdmi.c   | 23 ++++++++++-------------
>  drivers/gpu/drm/sti/sti_hqvdp.c  |  7 +++----
>  drivers/gpu/drm/sti/sti_mixer.c  |  3 +--
>  drivers/gpu/drm/sti/sti_tvout.c  |  7 +++----
>  drivers/gpu/drm/sti/sti_vid.c    |  5 ++---
>  9 files changed, 26 insertions(+), 39 deletions(-)
> 
> -- 
> 2.12.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
