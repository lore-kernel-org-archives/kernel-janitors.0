From: Julia Lawall <julia@diku.dk>
Date: Wed, 26 Dec 2007 19:19:13 +0000
Subject: Re: [PATCH 1/4] fs/autofs: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712262016230.22244@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk> <477293F3.60304@zytor.com>
In-Reply-To: <477293F3.60304@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: autofs@linux.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 26 Dec 2007, H. Peter Anvin wrote:

> Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > The functions time_before, time_before_eq, time_after, and time_after_eq
> > are more robust for comparing jiffies against other values.
> > 
> 
> More robust, how?  You already almost introduced a bug here...

I'm just summarizing the comment that goes with the definition of the 
time_after etc functions:

include/linux/jiffies.h:88
/*
 *	These inlines deal with timer wrapping correctly. You are 
 *	strongly encouraged to use them
 *	1. Because people otherwise forget
 *	2. Because if the timer wrap changes in future you won't have to
 *	   alter your driver code.
 *

julia
