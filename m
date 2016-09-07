From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Sep 2016 11:45:56 +0000
Subject: Re: x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <07f2cb49-662f-590f-acf6-686f8432015d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
 <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
 <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
 <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com>
 <f9edcf05-482e-dfbb-b661-c070ee1debf4@users.sourceforge.net>
 <3eea073a-b271-54b7-1eec-e841e0f4bdf9@redhat.com>
In-Reply-To: <3eea073a-b271-54b7-1eec-e841e0f4bdf9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Would the following script (for the semantic patch language)
>> be useful enough for further development considerations?
>>
>> usage_of_kmalloc_array1-excerpt2.cocci:
>> @replacement2@
>> expression count, pointer, target;
>> @@
>>  target >> -         kmalloc(sizeof(*pointer) * (count)
>> +         kmalloc_array(count, sizeof(*pointer)
>>                         , ...);
> 
> Why don't you include the _exact_ script that you run?

I showed only the "excerpt" above because of the current situation
that this single SmPL rule triggered the software change
which I suggested for the referenced source file.

How do you think about to try a command out like the following
also in your development (or test) environment?

elfring@Sonne:~/Projekte/Linux/next-patched> spatch.opt ~/Projekte/Coccinelle/janitor/usage_of_kmalloc_array1-excerpt2.cocci arch/x86/kernel/ksysfs.c


Regards,
Markus
