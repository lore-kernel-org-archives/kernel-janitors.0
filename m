From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Fri, 27 Oct 2017 18:45:17 +0000
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <87tvyke8g2.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
In-Reply-To: <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 24 Oct 2017, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.

Please also look into the GCC software, which will detect that your
patch does not compile.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
