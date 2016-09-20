From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Sep 2016 10:48:55 +0000
Subject: Re: [PATCH 5/6] GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_da
Message-Id: <20160920104855.GJ13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
 <87shsulw9k.fsf@intel.com>
In-Reply-To: <87shsulw9k.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>

On Tue, Sep 20, 2016 at 01:07:35PM +0300, Jani Nikula wrote:
> On Tue, 20 Sep 2016, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 20 Sep 2016 10:36:19 +0200
> >
> > A single error message should be sufficient to inform about
> > the detection of an unknown GCT revision at the end.
> > Thus return after the logging call in this case directly.
> 
> Did you test this?
> 

Don't be a dummy...  This is easy to review an it fixes a bug.

I'm fine with you NAKing all these patches based on who they are from.
I mostly just delete these without responding because the guy has
history of introducing bugs and never listens to feedback.  But asking
pointless rhetorical questions is not helpful.

A lot of people are CC'd and you're wasting everyone's time by asking
questions where you know the answer.

regards,
dan carpenter

