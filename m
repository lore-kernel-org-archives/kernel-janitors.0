From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 12 Jun 2010 14:32:09 +0000
Subject: Re: [PATCH] MTD: remove redundant dependency checks in Kconfig
Message-Id: <1276353129.19028.124.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100608134822.GA18437@caffeine.csclub.uwaterloo.ca>
In-Reply-To: <20100608134822.GA18437@caffeine.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Kyle Spaans <kspaans@uwaterloo.ca>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Tue, 2010-06-08 at 09:48 -0400, Kyle Spaans wrote:
> Look for dependency checks for "FOO" when inside of an "if FOO" block and remove them.
> 
> Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
> Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>

Pushed to l2-mtd-2.6.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

