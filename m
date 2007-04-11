From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Wed, 11 Apr 2007 17:57:28 +0000
Subject: [KJ] timer_del() vs. timer_del_sync()
Message-Id: <20070411175728.GP24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

i wanted to take a look on the timer_del() vs. timer_del_sync() issue
at http://kernelnewbies.org/KernelJanitors/Todo. the link describing
the issue (a mail from andrew morton in 7 years ago ...) mentions the
necessity to call timer_exit() to tell del_timer_sync() that it has
finished. i looked for timer_exit() on lxr, but it isn't defined. has
the issue been resolved in another way (googling i found a proposal of
andrew about using a deadlock detector) and the TODO is just outdated?
if it's still an issue, what would be the steps for fixing?

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

       The yellow ships hung in the air just like bricks dont do
                 (The Hitch-Hiker's Guide to the Galaxy)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
