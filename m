From: Bojan Smojver <bojan@rexursive.com>
Date: Sat, 08 Oct 2011 10:25:29 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <1318069530.2057.3.camel@shrek.rexursive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2011-10-08 at 07:58 +1100, Bojan Smojver wrote:
> I'm working on a new patch that will also produce a SHA1 of the
> image, so that we know for sure we read in the right thing.

Actually, even with threads, SHA1 is just too slow (and it obviously
cannot be done in parallel). So, I'll probably just use CRC32, because
we are not after security here - we only want to be reasonably sure that
what we read in is valid.

-- 
Bojan

