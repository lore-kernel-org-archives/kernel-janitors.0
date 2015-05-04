From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Mon, 04 May 2015 14:07:13 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <a81596f4a9134f319c52b031b768b72d@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>> > When is "soon"?  How about, if I don't see some real work happening from
>> > you all in the next 2 months (i.e. before 4.1-final), I drop lustre from
>> > the tree in 4.2-rc1.  Given that you all have had over 2 years to get
>> > your act together, and nothing has happened, I think I've been waiting
>> > long enough, don't you?

As you see from a earlier email from Oleg work is being done to change things.

>> I agree we've been much slower in doing a bunch of requested cleanups than initially
>> hoped for variety of reasons, not all of which are under our direct control.
>> 
>> Still, please don't drop Lustre client from the staging tree. People seem to be
>> actively using that port too (on smaller scale) and we'll improve the cleanups
>> situation.
>
>"much slower"?  Seriously?  It would take one junior developer a month
>tops to clean up all of the obvious issues with the in-kernel code, so
>that you could then tackle the real issues.  A "good" developer could do
>it all in a single week.  As that's obviously not going to ever happen,
>I have no choice but to delete the code from the kernel tree as no one
>is working to get it out of staging at all.
>
>Also, having it in the tree is wasting core kernel developer's time and
>energy trying to work around things in your codebase.

Since I'm just starting to get involved in this work I'm not aware of the
task you are looking for. What needs to be done from your perspective?
One of the things I have discussed with other developers is the idea
of breaking the cleanup into two stages. First is bringing  libcfs/lnet
up to date and synced to the upstream standards. This is due to lustre
being a application of LNet. LNet is used by various vendors for other
purposes. If this is acceptable to you it can be started right away.  Please
send of list of task that needs to be done for libcfs/lnet work.
