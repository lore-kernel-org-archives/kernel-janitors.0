From: Andi Kleen <ak@linux.intel.com>
Date: Wed, 28 Jul 2010 17:07:32 +0000
Subject: Re: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <4C5063D4.4070108@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335185-23265-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335185-23265-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Borislav Petkov <borislav.petkov@amd.com>, linux-kernel@vger.kernel.org

  On 7/28/2010 6:39 PM, Kulikov Vasiliy wrote:
> mcheck_init_device() poorly handles errors. If any request fails
> unregister and free everything.

Actually these are at early boot time and only contain memory errors,
and if you run out of memory at this stage the system is usually
dead in the water anyways. The best you can do at this stage
is panicing, but silently returning from the the init function doesn't
help anyone. But someone else will likely panic anyways.

e.g. boot time allocations of cpu masks generally do not check for memory
failures and I think that's ok, not a bug.

Your patch would be good if the driver was modular, but it isn't.

-Andi

