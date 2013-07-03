From: Logan Blyth <mrbojangles3@gmail.com>
Date: Wed, 03 Jul 2013 00:52:28 +0000
Subject: Re: Require mentoring for picking up
Message-Id: <51D375CC.4060705@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANpOL-w=W47NUg04nHRtL4S+Fpgt7SbigCwigHCsda31woccvQ@mail.gmail.com>
In-Reply-To: <CANpOL-w=W47NUg04nHRtL4S+Fpgt7SbigCwigHCsda31woccvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I also would like help setting up a test box / getting started as a 
janitor.  Imtiyaz beat me to an email :)
On 07/02/2013 07:56 PM, Imtiyaz Hussain wrote:
> Hello list,
>
> I have set up my test-box with help from Kumar Amit Mehta. I would
> like to start kernel janitorial work and would like to take up the
> below task found in TODO link (
> http://kernelnewbies.org/KernelJanitors/Todo ):-
>
> "...From: Hans Grobler
> - audit ioctl functions to make sure there is no way a user can crash
> the machine or do sensitive stuff. For example, check for the
> necessary capabilities. Check that no userspace pointers are accessed
> directly. be careful with this... it takes a while to figure out which
> ioctls are covered by the parent ioctl function (these can be nested
> to great depths)..."
>
> I looked at the mailing lists and found no one is working on this.
> Please correct my understanding. I am new to kernel newbies, so this
> is what i think before starting:-
> 1. Contact Hans Grobler for starting up ?
> 2. Find files with ioctl functions already implemented and do the
> required assessment.
>
> Also, needed some advise on git branching to work on the kernel.
>
> Your advise will be helpful.
>
> Sincerely,
> Immi
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

