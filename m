From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Mar 2015 21:06:30 +0000
Subject: Re: [alsa-devel] [patch v2] ALSA: opl3: small array underflow
Message-Id: <20150303210630.GF5437@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150303191318.GA7569@mwanda>
 <54F620A5.900@ladisch.de>
In-Reply-To: <54F620A5.900@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, Mar 03, 2015 at 09:59:17PM +0100, Clemens Ladisch wrote:
> Dan Carpenter wrote:
> > We don't check for negatives so "pitchbend" can be SHRT_MIN here.  It
> > means that we can read up to 6 elements before the start of the
> > opl3_note_table[] array.
> >
> > There are several ways we could fix this.  I have gone with what is
> > maybe the lazier approach of just changing negative values to zero.
> 
> The lower bound is not zero but -8192.

Oh.  I should have understood that from your previous email.  Sorry for
that.  Third time is lucky, I suppose.

regards,
dan carpenter

