From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 18 Nov 2008 17:12:36 +0000
Subject: Re: [PATCH] sound: Fix warnings relating to ignored return value in snd_card_register
Message-Id: <s5h1vx9dkl7.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811180759x4db4ba61k467fa2275710938f@mail.gmail.com>
	<s5hej19dn9o.wl%tiwai@suse.de>
	<154e089b0811180906r69099866vf0b80cd40d7e2cc7@mail.gmail.com>
In-Reply-To: <154e089b0811180906r69099866vf0b80cd40d7e2cc7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Tue, 18 Nov 2008 18:06:23 +0100,
Hannes Eder wrote:
> 
> Do not ignore the return of 'device_create_file' in
> 'snd_card_register' and thereby fixing the following warnings:
> 
> sound/core/init.c: In function 'snd_card_register':
> sound/core/init.c:640: warning: ignoring return value of
> 'device_create_file', declared with attribute warn_unused_result
> sound/core/init.c:641: warning: ignoring return value of
> 'device_create_file', declared with attribute warn_unused_result
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> 
> On Tue, Nov 18, 2008 at 11:14 AM, Takashi Iwai <tiwai@suse.de> wrote:
> > The changes look good, but please run checkpatch.pl to your patch and
> > fix the coding style issues suggested there.
> 
> I did not fix:
> 
> "WARNING: line over 80 characters" as they a hardly longer than 80
> characters and there are lines longer than this in the same file.

It's no excuse to add such lines again :)
(But, don't try to clean up the other lines -- mostly not worth, and
 it'd just make the change history dirty.)

> "ERROR: do not use assignment in if condition" as this pattern seems
> to be quite common.

Note this is an ERROR.

> Comments? Should I fix them?

Yes.


thanks,

Takashi
