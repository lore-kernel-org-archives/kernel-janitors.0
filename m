From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 14:49:23 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <s5h378j8xos.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda>
 <s5hziar9483.wl-tiwai@suse.de>
 <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
 <s5ho9r792yl.wl-tiwai@suse.de>
 <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
 <s5hbmn78zmg.wl-tiwai@suse.de>
 <139363f6-e059-defb-357e-f18645ba9768@users.sourceforge.net>
In-Reply-To: <139363f6-e059-defb-357e-f18645ba9768@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, 22 Aug 2017 16:36:35 +0200,
SF Markus Elfring wrote:
> 
> >> I got the impression that the functions which are called at the updated places
> >> by the function “snd_card_pcsp_probe” indicate a successful execution
> >> only by zero so far.
> > 
> > You have the impression, great.
> 
> This aspect is also a general programming interface issue for some functions.
> 
> 
> > And what's the reason to drop the negative check?
> 
> * I find it a bit safer when the error predicate is “return value != 0”.

Can't agree.  And I have no interest to continue bike-shedding,
sorry.  You can't convince me regarding this.


Takashi
