From: Bojan Smojver <bojan@rexursive.com>
Date: Sun, 09 Oct 2011 22:26:12 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <1318199172.2004.3.camel@shrek.rexursive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 2011-10-09 at 17:11 +0300, Dan Carpenter wrote:
> In general if you care about total bugs over the entire project then
> simpler code is less buggy.

Agreed. And thank you for finding that problem.

At times, I also complicate things unnecessarily. Ah, well...

-- 
Bojan

