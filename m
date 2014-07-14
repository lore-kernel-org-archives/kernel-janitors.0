From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 14 Jul 2014 17:26:02 +0000
Subject: Re: [PATCH V2 1/4] staging: vt6556: Cleanup coding style issues
Message-Id: <20140714172602.GB9870@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405278681-3348-1-git-send-email-peter.senna@gmail.com>
 <20140713193647.GA31010@kroah.com>
 <20140714085932.GA2958@hp-peter.rsr.lip6.fr>
 <20140714141231.GM25880@mwanda>
 <CA+MoWDpQBQYqZ2ZLM3-17cfQQ0LjMcv702ZxVv10M5Wd895rJg@mail.gmail.com>
In-Reply-To: <CA+MoWDpQBQYqZ2ZLM3-17cfQQ0LjMcv702ZxVv10M5Wd895rJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, devel@driverdev.osuosl.org, Malcolm Priestley <tvboxspy@gmail.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Forest Bond <forest@alittletooquiet.net>

On Mon, Jul 14, 2014 at 07:01:37PM +0200, Peter Senna Tschudin wrote:
> <note>
> I'm not trying to push my changes over the rules. I'm trying to
> understand the problem, to avoid creating similar noise in the future.
> </note>
> 
> Now I understand that the problem with the series of 4 patches is that
> the subject is the same on the 4 patches. Having the same subject in 4
> patches is not good. I got this one.
> 
> But I have no clue why joining 4 cleanup patches into 1 is bad. The
> patches are all for the same driver, are all silencing checkpatch
> warnings, and even the typedef stuff was reported by checkpatch. The
> commit message of the single patch describes it all. If the subject of
> the series is the problem, why not make a single patch instead of a
> series of similar patches? It made sense from my perspective. So what
> is the problem in re-submit 4 similar patches as a single patch?

Because it is _much_ harder to review a patch that way.  I get a few
hundred patches a week to review.  If you only do one thing per patch,
it is trivial to review, and you don't have to pick through a patch to
determine if all of it is correct based on a larger patch, that does
multiple things.

Also, the rule for a kernel patch is "do only one thing".  If you do:
	- remove typedef
	- fix space layout
for a single file, that really is 2 different things, yet you could
claim they are both "coding style cleanups".  Reviewing both of these at
the same time, together, makes it much harder to do.

Remember, for the kernel, we waste individual developer's time, at the
expense of reviewer's time, as we have far more developers than
reviewers.

Hope this helps explain things more.

greg k-h
