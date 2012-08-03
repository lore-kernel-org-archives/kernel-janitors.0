From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 03 Aug 2012 23:53:02 +0000
Subject: Re: [digsig:next-ima-module 13/36] {standard input}:5: Error: file not found: pubkey.pem.bin
Message-Id: <20120803235302.GA6871@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344037447.2742.17.camel@falcor>
In-Reply-To: <1344037447.2742.17.camel@falcor>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mimi,

On Fri, Aug 03, 2012 at 07:44:07PM -0400, Mimi Zohar wrote:
> On Sat, 2012-08-04 at 07:08 +0800, Fengguang Wu wrote:
> > Hi Mimi,
> > 
> > Kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kasatkin/linux-digsig.git next-ima-module
> > head:   31baf831da8f67a11c14de7989bf68551396b356
> > commit: d396af8b7f5b9a72b15470284ca13aac1372e9d9 [13/36] integrity: create and inititialize a keyring with builtin public key
> > config: x86_64-allmodconfig (attached as .config)
> > 
> > Build errors:
> > 
> > {standard input}:5: Error: file not found: pubkey.pem.bin
> 
> Hi Fengguang,
> 
> Congratulations on receiving an invitation to the kernel summit!

Thank you! :)

> I really appreciate your running tests on the different trees, but
> Dmitry and I are still working on the next-ima-modules and
> next-ima-directory branches.  Instead of pushing out a branch to show
> Dmitry the patches, I sent him a tar, so that I wouldn't get dinged for
> build issues.  We haven't finalized the patch content or ordering yet.
> 
> We need some sort of mechanism that allows us to collaborate.  What do
> you think if Dmitry and I suffix a branch with 'test' until we're ready?

Hmm, the problem is, some other people also have a 'test' suffix in
the branch name w/o the intention to skip the auto builds.. 

For a topic branch that is currently in heavy development and will
become testable eventually, you may temporarily carry a line

Dont-Auto-Build

in any of the branch's commits (in the changelog). Then my script will
skip that branch automatically. Does this scheme sound good to you?

Thanks,
Fengguang
