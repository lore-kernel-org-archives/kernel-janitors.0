From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Aug 2017 14:36:35 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <139363f6-e059-defb-357e-f18645ba9768@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
 <20170822121625.syvr64kwyh5xjexg@mwanda> <s5hziar9483.wl-tiwai@suse.de>
 <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
 <s5ho9r792yl.wl-tiwai@suse.de>
 <fc4d8c96-7de2-e8f0-4cb4-5dda795d298a@users.sourceforge.net>
 <s5hbmn78zmg.wl-tiwai@suse.de>
In-Reply-To: <s5hbmn78zmg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

>> I got the impression that the functions which are called at the updated places
>> by the function “snd_card_pcsp_probe” indicate a successful execution
>> only by zero so far.
> 
> You have the impression, great.

This aspect is also a general programming interface issue for some functions.


> And what's the reason to drop the negative check?

* I find it a bit safer when the error predicate is “return value != 0”.

* It is also a small source code reduction.


> It's not clearer, not better readable.

It seems that we have got different development opinions this time.


> And, the worst part is that you've done it silently even without
> mentioning in the change log at all.  That's really bad.
> Just don't do it.

I found it not relevant enough for the commit message.


> For example, the control API functions may return the positive number
> when the value got changed, 0 for else, and a negative number for the
> error.  The functions returning some numbers may return positive
> numbers, of course.

Did I touch any specific function calls which belong to this
programming interface category?

Regards,
Markus
