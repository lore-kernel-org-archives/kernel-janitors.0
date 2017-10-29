From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 29 Oct 2017 18:19:22 +0000
Subject: Re: drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <3b553cd9-f923-7e45-70b8-008d3b78b202@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
 <87tvyke8g2.fsf@intel.com> <1864580.oVLIQZJ4NS@avalon>
In-Reply-To: <1864580.oVLIQZJ4NS@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Just for the record, I've been bitten in the past by applying one of Markus' 
> patches that seemed to make sense, only to discover later that it introduced a 
> security hole.

How do you think about to take another look at the circumstances
under which a questionable commit happened in the referenced case?

A few glitches occur occasionally. They can be fixed by appropriate collaboration.


> I now drop his patches altogether, so could you please keep an eye open
> to make sure none of them touching the rcar-du driver will be applied
> through drm-misc ?

I hope that you can become interested in a more constructive software development
dialogue (also with me) again.

* Can additional ideas be taken into account here?

* Will any other contributor pick related update suggestions up?

Regards,
Markus
