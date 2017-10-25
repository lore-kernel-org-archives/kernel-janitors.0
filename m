From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Oct 2017 07:32:50 +0000
Subject: Re: drm/rcar-du: Adjust 14 checks for null pointers
Message-Id: <20171025073250.i6v6jwijbkmybmtk@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
 <20171025060209.pqtyqk4weduvmzxj@mwanda>
 <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
In-Reply-To: <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Wed, Oct 25, 2017 at 08:44:38AM +0200, SF Markus Elfring wrote:
> >> The script “checkpatch.pl” pointed information out like the following.
> >>
> >> Comparison to NULL could be written !…
> >>
> >> Thus fix the affected source code places.
> >>
> > 
> > This one is fine
> 
> This kind of feedback is nice.
> 
> 
> > except for the commit message.
> 
> Would you like to support Unicode characters there?
> 

Multiple people have answered this question already and I have answered
it multiple times.

regards,
dan carpenter

