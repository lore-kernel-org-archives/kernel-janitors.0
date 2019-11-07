From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2019 06:44:04 +0000
Subject: Re: [PATCH][next] xfs: remove redundant assignment to variable error
Message-Id: <20191107064404.GL10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106155248.266489-1-colin.king@canonical.com>
 <20191106155631.GJ4153244@magnolia>
 <cbb99652-c6b2-c81c-128d-6d85be04fddc@canonical.com>
 <a77fff95-0591-bcca-2541-3fd68c0da908@sandeen.net>
In-Reply-To: <a77fff95-0591-bcca-2541-3fd68c0da908@sandeen.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@sandeen.net>
Cc: Colin Ian King <colin.king@canonical.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 06, 2019 at 10:19:18AM -0600, Eric Sandeen wrote:
> 
> 
> On 11/6/19 9:59 AM, Colin Ian King wrote:
> > On 06/11/2019 15:56, Darrick J. Wong wrote:
> >> On Wed, Nov 06, 2019 at 03:52:48PM +0000, Colin King wrote:
> >>> From: Colin Ian King <colin.king@canonical.com>
> >>>
> >>> Variable error is being initialized with a value that is never read
> >>> and is being re-assigned a couple of statements later on. The
> >>> assignment is redundant and hence can be removed.
> >>>
> >>> Addresses-Coverity: ("Unused value")
> >>
> >> Er... is there a coverity id that goes with this?
> > 
> > Unfortunately it is a private one, so it does not make sense to use it.
> 
> If it's not in the upstream coverity scan (and AFAICT it's not),
> it makes no sense to reference coverity in the commit log.
> It's not useful to anyone IMHO.
> 

It's sort of useful if want to see how the bug was found or if you want
to count how many bugs coverity finds...  I'm pretty sure I remember
someone complaining that it wasn't mentioned in the commit.

regards,
dan carpenter
