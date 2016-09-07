From: Kees Cook <keescook@chromium.org>
Date: Wed, 07 Sep 2016 17:01:27 +0000
Subject: Re: x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <CAGXu5j+Wv7YXJRm-9kYCSLQbkWoXTXJKU++qsVUrjOUDGg4rpg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
 <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
 <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
 <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com> <f9edcf05-482e-dfbb-b661-c070ee1debf4@users.sourceforge.net>
 <3eea073a-b271-54b7-1eec-e841e0f4bdf9@redhat.com> <07f2cb49-662f-590f-acf6-686f8432015d@users.sourceforge.net>
 <CAGXu5jJ=YsdYegd3L2RzPKA9OGxE2vzo7U8BQjgK+qAaxEu0pQ@mail.gmail.com> <1473266220.29864.17.camel@perches.com>
In-Reply-To: <1473266220.29864.17.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Wed, Sep 7, 2016 at 9:37 AM, Joe Perches <joe@perches.com> wrote:
> On Wed, 2016-09-07 at 09:23 -0700, Kees Cook wrote:
>> Fixing these kmalloc calls would be a nice thing to clean up
>> everywhere.
>
> Dubious as gcc cannot currently optimize known small fixed size
> allocations with alloc_array and will always perform the
> multiplication.

Oh, that's sad. Is it not able to tell what the types are to basic
overflow validation? Could we help gcc in some way?

> Also the style of sizeof(*ptr) is not always as clear, obvious
> nor as easy to grep as sizeof(type).

I've always been on the fence about this (I like being able to see
destination:thing, sizeof(*thing) for easy scanning), but having the
type right there can be easier for text searches.

-Kees

-- 
Kees Cook
Nexus Security
