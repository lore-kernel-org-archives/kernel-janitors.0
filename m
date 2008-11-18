From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 18 Nov 2008 17:34:40 +0000
Subject: Re: [PATCH] sound: Fix warnings relating to ignored return value in snd_card_register
Message-Id: <s5hprktc4zz.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811180759x4db4ba61k467fa2275710938f@mail.gmail.com>
	<s5hej19dn9o.wl%tiwai@suse.de>
	<154e089b0811180906r69099866vf0b80cd40d7e2cc7@mail.gmail.com>
	<s5h1vx9dkl7.wl%tiwai@suse.de>
	<154e089b0811180925j7f35e87k22926d3c354b2c58@mail.gmail.com>
In-Reply-To: <154e089b0811180925j7f35e87k22926d3c354b2c58@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Richard Holden <aciddeath@gmail.com>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Tue, 18 Nov 2008 12:25:06 -0500,
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
> All warnings and errors reported by checkpatch.pl fixed.

Thanks!  Applied now.


Takashi
