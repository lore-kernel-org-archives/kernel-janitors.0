From: Borislav Petkov <bp@alien8.de>
Date: Fri, 09 Nov 2018 17:44:10 +0000
Subject: HELP WANTED: Fix -Wmissing-prototypes warnings
Message-Id: <20181109174357.GE21243@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, driverdev-devel@linuxdriverproject.org
Cc: wang.yi59@zte.com.cn, Greg KH <gregkh@linuxfoundation.org>

Hi all,

gcc has a warning option

  -Wmissing-prototypes

which fires when a global function is missing a prototype declaration.
This warning is important as it catches cases when that global
function's prototype has been changed but its callers haven't been
updated. And they should be.

Currently, if enabled, this warning triggers ~1400 times for an
allmodconfig build and we would like to have 0 warnings and then add
that option to the main Makefile.

So helping out here would be lovely!

And it is very easy to do: you simply build the kernel with W=1:

	make -j<num_cpus+1> W=1 2>w.log

choose one -Wmissing-prototypes warning in the w.log build log and fix
it by including the header which has the function prototype. Or you
declare the function static. If that function prototype is missing, it
needs to be added, of course.

For every function, one should ask oneself, is it better to make the
function static and save ourselves the prototype and include file
dependency - that would be the preferred solution - or if not possible,
should one make the prototype visible by including the proper header so
that gcc sees the prototype.

This should be a good exercise for newbies who'd like to get involved
into kernel development.

Feel free to ask if there are any questions.

Thanks!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
