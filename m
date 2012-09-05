From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 05 Sep 2012 05:40:25 +0000
Subject: Re: [alsa-devel] [asoc:for-3.7 95/95] sound/soc/codecs/wm0010.c:850:7-27: ERROR: Threaded IRQ with n
Message-Id: <20120905054024.GA16276@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120830151652.GB11964@localhost>
In-Reply-To: <20120830151652.GB11964@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Thu, Aug 30, 2012 at 08:16:52AM -0700, Fengguang Wu wrote:

> [PATCH] wm0010: fix coccinelle warnings
> 
> /c/kernel-tests/src/linux/sound/soc/codecs/wm0010.c:850:7-27: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT

Gah, just noticed the patch buried in here.  If you're generating stuff
like this I'd suggest restructuring the submission so it comes out as an
normal patch, it's not at all obvious that there's a patch in the mail
and even if one notices.  In this case I'd mostly ignored your mail as I
expected Dimitris to fix it, will apply now.

Julia generally does a pretty good job of formatting her mails, perhaps
there's some scripts she uses whcih would help?
