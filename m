From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 May 2015 15:01:22 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150504150122.GP14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Email chopped up and responded to out of order.

> If this is acceptable to you it can be started right away.

No one is going to approve your patches until you send them.  Start and
then we'll see.  Send them in as they are ready so you don't get too far
along and we ask you to redo everything.

> Since I'm just starting to get involved in this work I'm not aware of the
> task you are looking for. What needs to be done from your perspective?

There are so many things.  Let's take drivers/staging/lustre/lnet/lnet/module.c

The copyright header has dead URLs and other information which should
probably be changed.

    46  static int
    47  lnet_configure(void *arg)
    48  {
    49          /* 'arg' only there so I can be passed to cfs_create_thread() */

If there was no comment then I would have assumed correctly that it was
an unused argument pointer.  Instead I assumed it was something more
complicated.  I took embarrassingly long to figure out that the comment
was just out of date.  Just delete it.

    50          int    rc = 0;

Every variable in this file is indented a different random number of
spaces.  Just use one space unless there is a good reason.

    51  
    52          LNET_MUTEX_LOCK(&lnet_config_mutex);

Use mutex_lock() directly instead of obfuscating.

    53  
    54          if (!the_lnet.ln_niinit_self) {
    55                  rc = LNetNIInit(LUSTRE_SRV_LNET_PID);

CamelCase.

    56                  if (rc >= 0) {
    57                          the_lnet.ln_niinit_self = 1;
    58                          rc = 0;
    59                  }
    60          }
    61  
    62          LNET_MUTEX_UNLOCK(&lnet_config_mutex);
    63          return rc;
    64  }

Tons and tons of minor things everywhere.

> One of the things I have discussed with other developers is the idea
> of breaking the cleanup into two stages. First is bringing  libcfs/lnet
> up to date and synced to the upstream standards. This is due to lustre
> being a application of LNet. LNet is used by various vendors for other
> purposes.

In theory code sharing is nice, but it doesn't ever really work to share
stuff between the linux-kernel and the rest of the world.

Normally it's things like, "We want to support Windows, BSD and Linux
with the same code." so it ends up adding all kinds of abstraction.  It
sucks.  It's normally less work to just implement clean drivers on all
the OSes.  In lnet, it uses ifdefs in the .c file to separate the
userspace and kernel space code which is considered bad style.  Put the
kernelspace and user space code in different files and use the Makefile
to pull in the correct file.

There are a few files in ACPI which are shared and we can't touch them
in the kernel but those are very rare.  And I sometimes find myself
wanting to modify the ACPI files to add error handling or whatever.

In the linux-kernel we really don't care about things outside the kernel
tree so we often do tree wide renames.

regards,
dan carpenter

