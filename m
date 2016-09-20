From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Sep 2016 12:40:13 +0000
Subject: Re: [PATCH 6/6] GPU-DRM-GMA500: Rename a jump label in mid_get_vbt_data()
Message-Id: <20160920124013.GL13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <64e06a00-42d1-e7a8-1fe7-1b5de026b060@users.sourceforge.net>
 <87ponylw8j.fsf@intel.com>
In-Reply-To: <87ponylw8j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>

On Tue, Sep 20, 2016 at 01:08:12PM +0300, Jani Nikula wrote:
> On Tue, 20 Sep 2016, SF Markus Elfring <elfring@users.sourceforge.net> wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 20 Sep 2016 10:40:22 +0200
> >
> > * Adjust a jump target.
> 
> Please don't.
> 

Also there is nothing in CodingStyle that prohibits out: labels.  I
wrote that section and I wrote it in a deliberately way because no one
wants to see a bunch of "cleanup" patches that change the label names
for no reason.

People have been complaining about this in the kernel-summit mailing
list as if CodingStyle bans out labels and that it's my fault.  Neither
of these complaints are accurate.

regards,
dan carpenter
