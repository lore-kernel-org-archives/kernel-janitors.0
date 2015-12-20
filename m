From: Richard Cochran <richardcochran@gmail.com>
Date: Sun, 20 Dec 2015 20:09:34 +0000
Subject: Re: [PATCH] posix-clock: Use an unsigned data type for a variable
Message-Id: <20151220200934.GB2027@netboy>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56766488.9050402@users.sourceforge.net>
In-Reply-To: <56766488.9050402@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Dec 20, 2015 at 09:19:20AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 20 Dec 2015 09:09:34 +0100
> 
> The data type "int" was used by the variable "result" in the
> function "posix_clock_poll" even though the type "uint" will usually
> be needed for the return value from a call of the function which was
> assigned to the pointer "poll" of the variable "clk".
> Reuse the type from this poll call instead.
> 
> This issue was detected by using the Coccinelle software.

Coccinelle has pointed out a type mismatch.  This fact may or may not
indicate a real problem.  You need to analyze code to see if there is
a problem and then fix the problem.

In this case, there is indeed a problem.  However, just changing the
type won't fix it.

Thanks,
Richard
