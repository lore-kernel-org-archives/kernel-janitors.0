From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 16:32:19 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040112083219.0bf035d4.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 12 Jan 2004 12:42:49 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| There are a handful of schedule() within spinlocks. That needs to
| be looked at.
| 
| Also, how about an atomic version of check_region() to avoid racy
| conditions? Any idea what the status is?

the status?  check_region() is deprecated and is slowly being
removed.  but you probably know that.

I don't know of anyone working on a non-racy version of check_region().
How would that even work?  It's not check_region() that is racy.
It's using check_region() ... followed by request_region().
The proper fix is to just use request_region().

Were you thinking of a check_region() that reserves the region
for the caller, but still allows request_region() for the same
region and by the same caller?

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
