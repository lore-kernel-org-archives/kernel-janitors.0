From: John Stultz <john.stultz@linaro.org>
Date: Wed, 17 Aug 2016 21:31:20 +0000
Subject: Re: [PATCH] selftests/timers: Add missing error code assignment before test
Message-Id: <CALAqxLWs67opMzUK4wj4N68JF7GmHQOFKJ=RkqZ5b8xsPV-Zow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470737486-5924-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470737486-5924-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 9, 2016 at 3:11 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> In order to work, the 'err' return value has to be updated otherwise the
> test can never be true.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
