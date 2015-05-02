From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Sat, 02 May 2015 17:17:14 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <EC5ACFB5-7431-4B84-963B-CC947EA2BBDB@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello!

On May 2, 2015, at 4:26 AM, Greg Kroah-Hartman wrote:

> On Sat, May 02, 2015 at 01:18:48AM +0000, Simmons, James A. wrote:
>>      Second and far more importantly the upstream lustre code
>> currently does not have the same level of QA with what the Intel
>> branch gets.  The bar is very very high to get any patch merged for
>> the Intel branch. Each patch has to first pass a regression test suite
>> besides the normal review process.
> Pointers to this regression test suite?  Why can't we run it ourselves?
> Why not add it to the kernel test scripts?

The more "basic" stuff is here:
http://git.whamcloud.com/fs/lustre-release.git/tree/HEAD:/lustre/tests

With staging lustre client, the tests must be multinode, due to servers.

There are basic sanity "correctness" tests, multinode sanity tests,
various failure-testing scripts, node-failure tests, specific feature
testing scripts and so on.
A lot of this is automatically run by our regression test suite for
every commit, here's an example:
http://review.whamcloud.com/#/c/14602/

There you can see 4 test sessions were kicked of for various (simple)
supported configurations:
The results are available in our aoutomated systems linked from the
patch, like this one:
https://testing.hpdd.intel.com/test_sessions/130587e6-ed0f-11e4-bca3-5254006e85c2
This lists all the test run and you can examine every subtest (also if anything fails,
it'd helpfully set -1 verified in the patch).

Passing all of that is the bare minimum to get a patch accepted into our lustre tree.

Then on top of that, various "big" sites (like ORNL, Cray, LLNL and others)
do their own testing on systems of arious sizes, ranging from a few nodes to
tens of thousands, they run variety of tests, also various mixed workloads,
sometimes randomly killing nodes too.


We are trying to setup a similar thing for upstream client, but it's not cooperating
yet (builds, but crashes in a strange way with apparent memory corruption of some sort):
https://testing.hpdd.intel.com/test_logs/0b6963be-edef-11e4-848f-5254006e85c2/show_text
(I am not expecting you to look and solve this, just as a demonstration, I am digging
into it myslef).
The idea is that it'll build (works) and test (not yet) staging-next lustre-wise every
time you submit new changes automatically and alert us if something is broken so we can
fix it, as otherwise I am manually doing the testing from time to time (and also for
every bunch of patches that I submit to you).

>> Besides that sites like ORNL have to evaluated all the changes at all
>> the scales present on site.
> I don't understand what this sentence means.
> 
>> This means doing testing on Titan because unique problems only show up
>> at that scale.
> 
> What is "Titan"?

Titan is something like #3 or #2 biggest supercomputer in the world,
it has 22k compute clients with a bunch of cpus on each and this sort of extreme-scale
machines present their own challenges due to the sheer scale.
http://en.wikipedia.org/wiki/Titan_%28supercomputer%29

>> Now I like to see the current situation change and Greg you have know
>> me for a while so you can expect a lot of changes are coming.  In fact
>> I already have rallied people from vendors outside Intel as well as
>> universities which have done some excellent work which you will soon
>> see. Now I hope this is the last email I do like this. Instead I just
>> want to send you patches. Greg I think the changes you will see soon
>> will remove your frustration.
> 
> When is "soon"?  How about, if I don't see some real work happening from
> you all in the next 2 months (i.e. before 4.1-final), I drop lustre from
> the tree in 4.2-rc1.  Given that you all have had over 2 years to get
> your act together, and nothing has happened, I think I've been waiting
> long enough, don't you?

I agree we've been much slower in doing a bunch of requested cleanups than initially
hoped for variety of reasons, not all of which are under our direct control.

Still, please don't drop Lustre client from the staging tree. People seem to be
actively using that port too (on smaller scale) and we'll improve the cleanups
situation.

Bye,
    Oleg

