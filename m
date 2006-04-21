From: "Ulrich Drepper" <drepper@gmail.com>
Date: Fri, 21 Apr 2006 14:32:43 +0000
Subject: [KJ] Re: [PATCH] Extending getrusage
Message-Id: <a36005b50604210732h69f4408ey99b7895de8dbd902@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d0191dad0604200821l3fa0ed70ga2faabe79d7718ec@mail.gmail.com>
	 <20060420162140.0a03e227.akpm@osdl.org>
	 <20060421074129.GA31972@outpost.ds9a.nl>
	 <d0191dad0604210305n7ce4b59aja5d215d92f95e1f4@mail.gmail.com>
In-Reply-To: <d0191dad0604210305n7ce4b59aja5d215d92f95e1f4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudio Scordino <cloud.of.andor@gmail.com>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, luto@myrealbox.com, alan@lxorguk.ukuu.org.uk, torvalds@osdl.org, kernel-janitors@lists.osdl.org, bert.hubert@netherlabs.nl

On 4/21/06, Claudio Scordino <cloud.of.andor@gmail.com> wrote:
> Recently, while writing some code at user level, I needed a fast way
> to have such information about another process.

That's not very specific.  And one program isn't really a compelling
reason.  You should specify with some level of detail why you need
that information and why you cannot depend on collaboration of the
process you try to get the information for.


> -               return -EINVAL;
> -       return getrusage(current, who, ru);
> +       struct rusage r;
> +       struct task_struct *tsk = current;
> +       read_lock(&tasklist_lock);

You are introducing scalability problems where there were none before.
 Even if there is some justification revealed in the end IMO the patch
shouldn't be accepted in this form.  You should not slow down the
normal case of operation.  If the current thread is observed the lock
isn't needed.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
