From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 01 Jan 2018 14:57:17 +0000
Subject: Re: Kernel Janitor ToDo List
Message-Id: <alpine.DEB.2.20.1801011554120.2700@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Mon, 1 Jan 2018, Ravi Kumar wrote:

> I was told in #kernelnewbies that
> "https://kernelnewbies.org/KernelJanitors/Todo"  is too old and is not
> worth looking at for janitors.
>
> I'm interested in contributing to the project starting with trivial
> things. Do we have an updated ToDo list for kernel janitors?

The obvious starting point is to run checkpatch on the code.  Do this only
on staging drivers (drivers/staging) directory, and be sure to use common
sense when interpreting the results.

Once you feel comfortable with the patch submission process and your
checkpatch patches mostly get a favorable response, you can try using
other tools found in the scripts subdirectory.  You can also look at what
others have done, by looking through commits and mailing lists.  But to
start with, only work on the staging drivers.  And read
Documentation/SubmittingPatches documentation very carefully.

julia


> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
