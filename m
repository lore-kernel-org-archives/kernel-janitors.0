From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 14:09:58 +0000
Subject: Re: Tips for a Newcomer
Message-Id: <20130725140958.GB5585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51D0A0D7.4070408@gmail.com>
In-Reply-To: <51D0A0D7.4070408@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 25, 2013 at 08:13:36AM -0400, Logan Blyth wrote:
> 
> On 07/03/2013 03:28 AM, Dan Carpenter wrote:
> >On Sun, Jun 30, 2013 at 05:19:19PM -0400, Logan Blyth wrote:
> >>Hello list,
> >>
> >>I am looking for some tips on starting as a kernel janitor, and I
> >>was hoping to find out the general work flow that people use. From
> >>what I can tell, we search through the kernel-next git repo, then
> >>either by grep, ctags, or some other method?
> >I use cscope with vim.  There is a "make cscope" build target.
> >
> >>We are looking for
> >>things in the KernelJanitors/Todo, possibly stuff turned up by
> >>sparse? Maybe a different static analyser like from clang?
> >Yeah.  That's a lot of it.  I don't think anyone is doing clang so
> >you could find some unique bugs that way.  Do you know how to get
> >clang working for the kernel?
> I thought I did, turns out, I am struggling. I am planning on
> watching this video
> http://video.linux.com/videos/applying-clang-static-analyzer-to-linux-kernel
> but it is 30 min, and I am about to head off to work. I am also
> having some problems finding bugs, I saw that we should be looking
> in drivers/staging for bugs, Do we need to make changes to the
> .config to get those to show up in the tools (clang, smatch,
> sparse)? If so, are their any other changes?
> 

Watch the video on clang.  It's pretty complicated from what I
remember, but maybe it's easier these days.

Someone already posted the links for sparse.

For Smatch the commands are:

git clone git://repo.or.cz/smatch.git
cd smatch
make
cd ~/kernel/src/

From here you could build the database (optional):
~/progs/smatch/devel/smatch_scripts/build_kernel_data.sh

To test the whole kernel the command is:
~/progs/smatch/devel/smatch_scripts/test_kernel.sh
creates a warns.txt file at the end.

Or to test only one file the command is:
~/progs/smatch/devel/smatch_scripts/kchecker drivers/file.c

regards,
dan carpenter


