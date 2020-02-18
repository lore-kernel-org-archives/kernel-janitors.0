From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Feb 2020 06:47:59 +0000
Subject: [bug report] clone3: allow spawning processes into cgroups
Message-Id: <20200218064759.4n6vwqgtxqlysjsk@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Christian Brauner,

The patch ef2c41cf38a7: "clone3: allow spawning processes into
cgroups" from Feb 5, 2020, leads to the following static checker
warning:

	kernel/fork.c:2632 copy_clone_args_from_user()
	warn: unsigned 'args.cgroup' is never less than zero.

kernel/fork.c
  2598  noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
  2599                                                struct clone_args __user *uargs,
  2600                                                size_t usize)
  2601  {
  2602          int err;
  2603          struct clone_args args;
  2604          pid_t *kset_tid = kargs->set_tid;
  2605  
  2606          if (unlikely(usize > PAGE_SIZE))
  2607                  return -E2BIG;
  2608          if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
  2609                  return -EINVAL;
  2610  
  2611          err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
  2612          if (err)
  2613                  return err;
  2614  
  2615          if (unlikely(args.set_tid_size > MAX_PID_NS_LEVEL))
  2616                  return -EINVAL;
  2617  
  2618          if (unlikely(!args.set_tid && args.set_tid_size > 0))
  2619                  return -EINVAL;
  2620  
  2621          if (unlikely(args.set_tid && args.set_tid_size = 0))
  2622                  return -EINVAL;
  2623  
  2624          /*
  2625           * Verify that higher 32bits of exit_signal are unset and that
  2626           * it is a valid signal
  2627           */
  2628          if (unlikely((args.exit_signal & ~((u64)CSIGNAL)) ||
  2629                       !valid_signal(args.exit_signal)))
  2630                  return -EINVAL;
  2631  
  2632          if ((args.flags & CLONE_INTO_CGROUP) && args.cgroup < 0)
                                                        ^^^^^^^^^^^^^^^
This is a u64 so it can't be negative.  I'm not sure what was intended.

  2633                  return -EINVAL;
  2634  

regards,
dan carpenter
