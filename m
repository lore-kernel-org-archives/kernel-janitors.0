From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 07 Sep 2016 11:17:40 +0000
Subject: Re: x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <f9edcf05-482e-dfbb-b661-c070ee1debf4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
 <CAGXu5jLSsU+daPP=uX+3T02RkTFguG1rtemOF-7Py_Fi=qYP6A@mail.gmail.com>
 <e24dae2d-b55a-d90a-9934-080e6165802b@users.sourceforge.net>
 <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com>
In-Reply-To: <f1caa945-b808-f6b5-6047-35c43330431f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Are you looking for further possibilities to improve the involved
>> source code search patterns?
> 
> Why are you not answering the simple question that was asked?

I find that I answered it to some degree.

It can be that you do not really like the kind of answer that I chose
a moment ago.
But I guess that a more pleasing (and complete) answer can become
another software development challenge as you might know already.

Would the following script (for the semantic patch language)
be useful enough for further development considerations?

usage_of_kmalloc_array1-excerpt2.cocci:
@replacement2@
expression count, pointer, target;
@@
 target -         kmalloc(sizeof(*pointer) * (count)
+         kmalloc_array(count, sizeof(*pointer)
                        , ...);

Regards,
Markus
