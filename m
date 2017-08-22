From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 22 Aug 2017 12:55:30 +0000
Subject: Re: [alsa-devel] ALSA: pcsp: Use common error handling code in snd_card_pcsp_probe()
Message-Id: <s5ho9r792yl.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08ee0d6b-788b-2845-6964-e1e55c2d2292@users.sourceforge.net>
        <20170822121625.syvr64kwyh5xjexg@mwanda>
        <s5hziar9483.wl-tiwai@suse.de>
        <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
In-Reply-To: <f138ba40-a61f-cdab-3d9b-699dbcacad9d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Tue, 22 Aug 2017 14:47:20 +0200,
SF Markus Elfring wrote:
> 
> > Also, please don't omit the negative value check.
> 
> Is it appropriate to treat non-zero values as error codes there generally?

No, it can't be in general.  Lots of functions return a positive
value, too.


Takashi
