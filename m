From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Thu, 13 Oct 2005 23:30:46 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <29495f1d0510131630u47449f3fpb7ee5ebae1c6f3bf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/13/05, Masoud Sharbiani <masouds@masoud.ir> wrote:
> Hello,
> the following patch removes yield() from all drivers. They have been replaced
> by schedule_timeout() or cond_resched(). Please verify and comment.

Which entry in the TODO is this in reference to?

schedule_timeout() should either be schedule_interruptible_timeout()
or schedule_uninterruptible_timeout() now. Calling just
schedule_timeout() without setting the state is a noop and will cause
loops to busy wait.

Have you boot-tested any of the affected drivers to make sure the
behavior is the same?

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
