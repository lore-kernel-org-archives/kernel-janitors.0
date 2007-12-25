From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 25 Dec 2007 12:19:23 +0000
Subject: Re: [PATCH 1/38] arch/alpha: Use time_before, time_before_eq, etc.
Message-Id: <20071225121923.GB31662@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712241516010.23999@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712241516010.23999@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: rth@twiddle.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon 2007-12-24 15:16:46, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The functions time_before, time_before_eq, time_after, and time_after_eq
> are more robust for comparing jiffies against other values.
> 
> A simplified version of the semantic patch making this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @ change_compare_np @
> expression E;
> @@
> 
> (
> - jiffies <= E
> + time_before_eq(jiffies,E)
> |
> - jiffies >= E
> + time_after_eq(jiffies,E)
> |
> - jiffies < E
> + time_before(jiffies,E)
> |
> - jiffies > E
> + time_after(jiffies,E)
> )

Maybe you should create new macro so that you don't have to pass the
jiffies all the time?

>  	if (!test_thread_flag (TIF_UAC_NOPRINT)) {
> -		if (cnt >= 5 && jiffies - last_time > 5*HZ) {
> +		if (cnt >= 5 && time_after(jiffies, last_time + 5*HZ)) {

			     && time_after_now(last_time + 5*HZ)

or something?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
