From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 11 Mar 2016 14:31:05 +0000
Subject: Re: tracing: Make tracer_flags use the right set_flag callback
Message-Id: <20160311093105.16c8868b@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160310194403.GA17979@mwanda>
In-Reply-To: <20160310194403.GA17979@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Mar 2016 06:50:07 -0500 (EST)
Chunyu Hu <chuhu@redhat.com> wrote:


> Thanks so much for catching this. I missed this check. I was just
> thinking that this fail was nearly impossible, and during my tests
> I didn't hit any warn, so i missed this. You taught me a lesson. 
> BTW, How did you hit the warn? a special gcc version / feature?
> 
> You are right, It should be a 'goto out', this has already tested by me.
>  
>                           if (!type->flags) {
>                                   ret = -ENOMEM;
>                                   goto out;
>                           }
> 
> Hi Steve,
> I'm so sorry for this. Can I resubmit a v2 for my part of the patch?
> 

What I push to linux-next doesn't get rebased. Please just send a patch
to fix this on top of what's already in my for-next branch.

Thanks!


-- Steve
