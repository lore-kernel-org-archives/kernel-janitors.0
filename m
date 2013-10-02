From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Oct 2013 19:24:23 +0000
Subject: Re: [PATCH] FIXED sparse warning : drivers/cpuidle/cpuidle.c:27:1: warning: symbol 'cpuidle_dev' was
Message-Id: <20131002192423.GX6192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1380739624-17257-1-git-send-email-sgr.m.pdy@gmail.com>
In-Reply-To: <1380739624-17257-1-git-send-email-sgr.m.pdy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 03, 2013 at 12:17:04AM +0530, Sagar Padhye wrote:
> ---
> This is the first patch I am sending out, hope this is ok.

Hi hi,

Kernel Janitors is a newbie friendly list so that's fine.

> I checked that cpuidle_devices is only being used in cpuidle.c - hence
> thought that it can be made static and be removed from header.

"cpuidle_devices" is actually used in drivers/cpuidle/coupled.c as well
so this breaks the build.

Even for "cpuidle_dev" the patch isn't right.  It doesn't fix the
warning, for me.  The DEFINE_PER_CPU() macro defines several variables
actually.  Per CPU variables are a bit complicated and they have to have
globally unique names.  So just ignore the Sparse warning for per CPU
variables.

There are several other "process" problems with the patch submission.

1) Incorrect subject.  It should be:
	[PATCH] cpuidle: make a variable static

   This is based on `git log --oneline drivers/cpuidle/cpuidle.c`
   output.

2) No blank line between subject and body of commit message.
3) Line wrap the body of the email at 72 characters.
4) No Signed-off-by line.

Anyway, don't feel bad that your first patch had problems, we all
started as beginners.

regards,
dan carpenter


