From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Aug 2017 15:03:00 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <b434f976-33a1-7ced-55b5-b55487f2fb14@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda> <s5hziar9483.wl-tiwai@suse.de>
 <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
 <s5ho9r792yl.wl-tiwai@suse.de>
 <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
 <s5hbmn78zmg.wl-tiwai@suse.de>
 <139363f6-e059-defb-357e-f18645ba9768@users.sourceforge.net>
 <s5h378j8xos.wl-tiwai@suse.de>
In-Reply-To: <s5h378j8xos.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

>> * I find it a bit safer when the error predicate is “return value != 0”.
> 
> Can't agree.

How do you think about to reduce the probability that positive return values
will accidentally be interpreted as a successful function execution.


> And I have no interest to continue bike-shedding, sorry.

I do not like that you prefer to put this technical detail into such
a communication category.


> You can't convince me regarding this.

Would you still like to integrate the proposed refactoring with the use
of previous failure predicates then?

Regards,
Markus
