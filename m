From: Garry Hurley <garry.hurley.jr@gmail.com>
Date: Tue, 24 Oct 2017 13:54:58 +0000
Subject: Re: drm/i915/gvt: Use common error handling code in shadow_workload_ring_buffer()
Message-Id: <1A433E6A-DE06-4407-9E33-3CBBA4ADF01B@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f563de94-afaa-ecde-2907-d6baaad65939@users.sourceforge.net>
 <87efpsiu7r.fsf@intel.com>
 <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
In-Reply-To: <636f6272-9074-53dc-2c90-cbb4a7cd0901@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: intel-gfx@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>

Markus, 

I normally keep quiet on threads like this. I half agree with you. Yes, perhaps a reportError function would be a good idea, but it seems that what you are suggesting is trading an inline subroutine call for a spaghetti-code vondition. The goto is used only if you do not have any code that follows, and what you are taking out is a function call that DOES return execution flow to the calling block. You are replacing it with a goto call which does not return execution flow. The risks of process termination during a goto call make it a bad idea. In this case, the subroutine call is the right move. If the reuse of the error message bothers you, perhaps it is a good candidate for a static string definition, so that if it is changed it can be changed in one location in the code. The tradeoff there is that the static string definition will eat a few bytes of memory from the variable storage. Just my perspective. I could be wrong. 

Sent from my iPhone

On Oct 24, 2017, at 9:17 AM, SF Markus Elfring <elfring@users.sourceforge.net> wrote:

>>> Add a jump target so that a call of the function "gvt_vgpu_err" is stored
>>> only once at the end of this function implementation.
>>> Replace two calls by goto statements.
>>> 
>>> This issue was detected by using the Coccinelle software.
>> 
>> I don't think this is an issue or an improvement.
> 
> Do you care for the detail how often an error message is stored in the code?
> 
> Regards,
> Markus
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
