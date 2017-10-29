From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Sun, 29 Oct 2017 17:12:16 +0000
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <1864580.oVLIQZJ4NS@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net> <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net> <87tvyke8g2.fsf@intel.com>
In-Reply-To: <87tvyke8g2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Jani,

On Friday, 27 October 2017 21:45:17 EET Jani Nikula wrote:
> On Tue, 24 Oct 2017, SF Markus Elfring wrote:
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function.
> > 
> > This issue was detected by using the Coccinelle software.
> 
> Please also look into the GCC software, which will detect that your
> patch does not compile.

Just for the record, I've been bitten in the past by applying one of Markus' 
patches that seemed to make sense, only to discover later that it introduced a 
security hole. I now drop his patches altogether, so could you please keep an 
eye open to make sure none of them touching the rcar-du driver will be applied 
through drm-misc ?

-- 
Regards,

Laurent Pinchart

