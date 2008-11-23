From: Ingo Molnar <mingo@elte.hu>
Date: Sun, 23 Nov 2008 18:59:07 +0000
Subject: Re: [PATCH] x86: boot - fix sparse warnings
Message-Id: <20081123185907.GC21106@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811231037l18d4d8erce62eb4e77e28b10@mail.gmail.com>
In-Reply-To: <154e089b0811231037l18d4d8erce62eb4e77e28b10@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


* Hannes Eder <hannes@hanneseder.net> wrote:

> Fix this sparse warnings:
> 
> arch/x86/boot/video.c:233:3: warning: symbol 'saved' was not declared.
> Should it be static?
> arch/x86/boot/video-vga.c:37:13: warning: symbol 'video_vga' was not
> declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
>  arch/x86/boot/video-vga.c |    4 ++--
>  arch/x86/boot/video.c     |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

applied to tip/x86/sparse-fixes, thanks Hannes!

	Ingo
