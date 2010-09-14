From: "H. Peter Anvin" <hpa@zytor.com>
Date: Tue, 14 Sep 2010 18:20:49 +0000
Subject: Re: [PATCH 1/4] x86: remove cast from void*
Message-Id: <4C8FBD01.40900@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284441511-11511-1-git-send-email-mfm@muteddisk.com>
	<4C8FB5C3.3050806@goop.org>
In-Reply-To: <4C8FB5C3.3050806@goop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: xen-devel@lists.xensource.com, Jeremy Fitzhardinge <jeremy@xensource.com>, matt mooney <mfm@muteddisk.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, virtualization@lists.osdl.org, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ian Campbell <ian.campbell@citrix.com>

On 09/14/2010 10:49 AM, Jeremy Fitzhardinge wrote:
>  On 09/13/2010 10:18 PM, matt mooney wrote:
>> Unnecessary cast from void* in assignment.
> 
> Not very keen on this.  The cast may not be strictly required, but it
> does document what's going on there.
> 

But unnecessary casts are problematic in that if the type changes, they
can hide a real bug in the future.
	
	-hpa
