From: Joe Perches <joe@perches.com>
Date: Fri, 06 Feb 2015 21:04:30 +0000
Subject: Re: [PATCH 1/1] drivers/base: Remove unnecessary OOM message
Message-Id: <1423256670.4752.16.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150206153912.GA8486@sloth> <20150206205852.GA14126@amd>
In-Reply-To: <20150206205852.GA14126@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Quentin Lambert <lambert.quentin@gmail.com>, Ming Lei <ming.lei@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org

On Fri, 2015-02-06 at 21:58 +0100, Pavel Machek wrote:
> On Fri 2015-02-06 16:39:12, Quentin Lambert wrote:
> > This patch fix checkpatch warnings concerning the possible
> > duplication of an "out of memory" message.
> 
> So, instead of nice and readable "not enough memory for clock..." we
> get OOM, stackdump, and backtrace...? Not sure it is improvement.

All allocs without __GFP_NOWARN already gets an OOM and stackdump.
These are just unnecessary.


