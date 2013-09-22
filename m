From: Pavel Machek <pavel@ucw.cz>
Date: Sun, 22 Sep 2013 13:35:50 +0000
Subject: Re: [PATCH 17/19] staging: Change variable type to bool
Message-Id: <20130922133550.GA8643@amd.pavel.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
 <1379802471-30252-17-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-17-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: gregkh@linuxfoundation.org, harsh1kumar@gmail.com, dan.carpenter@oracle.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun 2013-09-22 00:27:49, Peter Senna Tschudin wrote:
> The variable Trigger is only assigned the values true and false.
> Change its type to bool.
> 
> The simplified semantic patch that find this problem is as
> follows (http://coccinelle.lip6.fr/):
> 
> @exists@
> type T;
> identifier b;
> @@
> - T
> + bool
>   b = ...;
>   ... when any
>   b = \(true\|false\)
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
