From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 13:30:52 +0000
Subject: Re: [patch] perf/x86/intel/pt: cleanup error handling in pt_pmu_hw_init()
Message-Id: <20150409133052.GA16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090805.GG17605@mwanda>
In-Reply-To: <20150409090805.GG17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 02:45:30PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 09, 2015 at 03:33:36PM +0300, Dan Carpenter wrote:
> > Also I have come to despise "err" labels.  They do one of three things:
> > 
> > 1) Nothing.  These are a pointless interruption for people reading the
> >    code from top to bottom because you wonder, "How is goto err
> >    different from return -ENOMEM?".  You scroll down to the bottom and
> >    find that they are the same.  Now you have lost your place and your
> >    train of thought.
> > 
> > 2) One thing.  In this case the label is poorly named, better to say
> >    "goto unlock".
> > 
> > 3) Everything.  This is a leading source of error handling bugs.  It
> >    looks like this.
> > 
> > err:
> > 	kfree(foo);
> > 	return ret;
> 
>   4) unwind complex state; see for example copy_process(). You do not
>   want to endlessly duplicate the increasing cleanup for every exit.

I *like* using gotos for unwinding.  It's specifically the err:, out:,
and bail: type labels I object to.  The error handling in copy_process()
is pretty clean but the fork_out label is kind of useless.  Here is how
it's used.

kernel/fork.c
  1285          if (clone_flags & CLONE_SIGHAND) {
  1286                  if ((clone_flags & (CLONE_NEWUSER | CLONE_NEWPID)) ||
  1287                      (task_active_pid_ns(current) !  1288                                  current->nsproxy->pid_ns_for_children))
  1289                          return ERR_PTR(-EINVAL);
                                ^^^^^^^^^^^^^^^^^^^^^^^
This direct return is clear.

  1290          }
  1291  
  1292          retval = security_task_create(clone_flags);
  1293          if (retval)
  1294                  goto fork_out;
                        ^^^^^^^^^^^^^

This does the same thing but it's more ambigous.  You have to scroll
down 350 lines to find out what it does.

> 
> > Later we will change it so that foo is allocated with kmemdup_user()
> > instead of kmalloc() so now kfree() will oops trying to free the error
> > pointer.  
> 
> That's just poor engineering in the first place, if you change the alloc
> site you had better also look for all the free sites. Error labels have
> nothing to do with that, alloc/free can be otherwise separated and hard
> to correlate, in fact error labels can be some of the easier places to
> find.

A more typical example is:

err:
	mega_free_function(foo);
	return ret;

But inside mega_free_function() function it dereferences foo->bar which
is still NULL.  The problem with one err bugs is that you're merging
a lot of error paths together and then separating them out using if
statements and it's easy to make a mistake.  If you unwind like:

err_free_bar:
	kfree(foo->bar);
err_free_foo:
	kfree(foo);
	return ret;

That is less error prone.

regards,
dan carpenter

