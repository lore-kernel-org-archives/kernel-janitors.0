From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 14:07:35 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <s5hbmn78zmg.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda>
 <s5hziar9483.wl-tiwai@suse.de>
 <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
 <s5ho9r792yl.wl-tiwai@suse.de>
 <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
In-Reply-To: <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, 22 Aug 2017 15:15:02 +0200,
SF Markus Elfring wrote:
> 
> >> Is it appropriate to treat non-zero values as error codes there generally?
> > 
> > No, it can't be in general.
> 
> I got the impression that the functions which are called at the updated places
> by the function “snd_card_pcsp_probe” indicate a successful execution
> only by zero so far.

You have the impression, great.  And what's the reason to drop the
negative check?  It's not clearer, not better readable.
And, the worst part is that you've done it silently even without
mentioning in the change log at all.  That's really bad.
Just don't do it.

> > Lots of functions return a positive value, too.
> 
> Would you like to point any example out from the programming interface?

For example, the control API functions may return the positive number
when the value got changed, 0 for else, and a negative number for the
error.  The functions returning some numbers may return positive
numbers, of course.


Takashi
