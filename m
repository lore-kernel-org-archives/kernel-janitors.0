From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 15:07:54 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <s5hwp5v7i9h.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda>
 <s5hziar9483.wl-tiwai@suse.de>
 <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
 <s5ho9r792yl.wl-tiwai@suse.de>
 <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
 <s5hbmn78zmg.wl-tiwai@suse.de>
 <139363f6-e059-defb-357e-f18645ba9768@users.sourceforge.net>
 <s5h378j8xos.wl-tiwai@suse.de>
 <b434f976-33a1-7ced-55b5-b55487f2fb14@users.sourceforge.net>
In-Reply-To: <b434f976-33a1-7ced-55b5-b55487f2fb14@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, 22 Aug 2017 17:03:00 +0200,
SF Markus Elfring wrote:
> 
> >> * I find it a bit safer when the error predicate is “return value != 0”.
> > 
> > Can't agree.
> 
> How do you think about to reduce the probability that positive return values
> will accidentally be interpreted as a successful function execution.

It's not zero.

> > And I have no interest to continue bike-shedding, sorry.
> 
> I do not like that you prefer to put this technical detail into such
> a communication category.
> 
> 
> > You can't convince me regarding this.
> 
> Would you still like to integrate the proposed refactoring with the use
> of previous failure predicates then?

That's fine.

But, please don't forget what others already mentioned.
For example, Joe Perches suggested to put a blank line before the
label for your patches.  But you completely ignored it and did the
same again.


thanks,

Takashi
