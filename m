From: walter harms <wharms@bfs.de>
Date: Tue, 09 Aug 2016 10:20:06 +0000
Subject: Re: [PATCH] selftests/timers: Add missing error code assignment before test
Message-Id: <57A9AE56.8060706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470737486-5924-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470737486-5924-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: john.stultz@linaro.org, tglx@linutronix.de, shuahkh@osg.samsung.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


The patch looks ok.
but perhaps it is better to replace this with clock_gettime() ?

from the manpage:
"POSIX.1-2008 marks gettimeofday() as obsolete, recommending the
 use of clock_gettime(2) instead."

just my 2 cents.

re,
 wh


Am 09.08.2016 12:11, schrieb Christophe JAILLET:
> In order to work, the 'err' return value has to be updated otherwise the
> test can never be true.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  tools/testing/selftests/timers/posix_timers.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
> index 5a246a0..15cf56d 100644
> --- a/tools/testing/selftests/timers/posix_timers.c
> +++ b/tools/testing/selftests/timers/posix_timers.c
> @@ -122,7 +122,7 @@ static int check_itimer(int which)
>  	else if (which = ITIMER_REAL)
>  		idle_loop();
>  
> -	gettimeofday(&end, NULL);
> +	err = gettimeofday(&end, NULL);
>  	if (err < 0) {
>  		perror("Can't call gettimeofday()\n");
>  		return -1;
> @@ -175,7 +175,7 @@ static int check_timer_create(int which)
>  
>  	user_loop();
>  
> -	gettimeofday(&end, NULL);
> +	err = gettimeofday(&end, NULL);
>  	if (err < 0) {
>  		perror("Can't call gettimeofday()\n");
>  		return -1;
