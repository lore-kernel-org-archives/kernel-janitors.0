From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 13:22:42 +0000
Subject: Re: cris-cryptocop: Apply another recommendation from "checkpatch.pl"
Message-Id: <b739ce57-5e5c-e9f6-0e4d-966308445867@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net>
 <0e29d372-ef5f-afa7-50b1-70ddc089ef00@users.sourceforge.net>
 <alpine.DEB.2.10.1608272105110.3363@hadrien>
 <130cda68-feed-8b48-e928-7e915888c7c9@users.sourceforge.net>
 <alpine.DEB.2.10.1608281225010.3321@hadrien>
In-Reply-To: <alpine.DEB.2.10.1608281225010.3321@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linux-doc@vger.kernel.org

>>> There is plenty of room for at least &(*pj)->iop on the line before.
>>
>> This is true. - Do you prefer an other indentation approach here?
> 
> Very much.  Most of the kernel code puts as much information on a line as
> possible, unless there is a reason to do otherwise.  Then more of the code
> will fit on the screen at one time.

How do you think about to clarify such an implementation detail also
in a document like "CodingStyle"?

Regards,
Markus
