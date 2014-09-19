From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 19 Sep 2014 15:15:21 +0000
Subject: Re: [patch] UBI: return on error in rename_volumes()
Message-Id: <1411139721.28850.143.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140919104848.GC26391@mwanda>
In-Reply-To: <20140919104848.GC26391@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, 2014-09-19 at 13:56 +0300, Dan Carpenter wrote:
> I noticed this during a code review.  We are checking that the strlen()
> of ->name is not less than the ->name_len which the user gave us.  I
> believe this bug is harmless but clearly we meant to return here instead
> of setting an error code and then not using it.

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

