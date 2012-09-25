From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 25 Sep 2012 11:31:04 +0000
Subject: Re: [patch] driver: staging: Coding Style correction and removal of unused macro
Message-Id: <20120925113103.GA15852@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <506074C0.2090808@gmail.com>
In-Reply-To: <506074C0.2090808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon 2012-09-24 20:27:04, Harsh Kumar wrote:
> Removed an unused macro. Plus, couple of grammatical and coding style fixes.
> 
> 1) The macro _INLINE is not used anywhere. Anyways __inline is not portable.
> 2) Changed comment from "Not use" to "Unused" make it grammatically correct and
>    to fit in 80 word limit.
> 3.) Removed space after *
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

ACK.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
