From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Sep 2016 16:55:09 +0000
Subject: Re: x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <6f626c15-aac1-a0ad-402a-425874e4908e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
 <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
 <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
 <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com>
 <f9edcf05-482e-dfbb-b661-c070ee1debf4@users.sourceforge.net>
 <3eea073a-b271-54b7-1eec-e841e0f4bdf9@redhat.com>
 <07f2cb49-662f-590f-acf6-686f8432015d@users.sourceforge.net>
 <CAGXu5jJ=YsdYegd3L2RzPKA9OGxE2vzo7U8BQjgK+qAaxEu0pQ@mail.gmail.com>
In-Reply-To: <CAGXu5jJ=YsdYegd3L2RzPKA9OGxE2vzo7U8BQjgK+qAaxEu0pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Fixing these kmalloc calls would be a nice thing to clean up everywhere.

Thanks for your acknowledgement of such a software improvement opportunity.


> Since it is a mistake people may continue to make, I think it would
> make sense to add a coccinelle script that can do this to the
> existing coccinelle scripts in the kernel if one to do it does not
> already exist. That way, it will be part of the coccinelle checking
> that is automatically run on the kernel regularly.

I am curious on how many contributors would like to help a bit more
in such a software development task.

How do you think about to clarify corresponding challenges better?

Do you find any details interesting which are described in a feature
request (or article) like "Improve determination of sizes with SmPL"?
https://github.com/coccinelle/coccinelle/issues/80

Regards,
Markus
