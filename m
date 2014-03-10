From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 10 Mar 2014 07:37:53 +0000
Subject: Re: [patch] x86/efi: use GFP_ATOMIC under spin_lock
Message-Id: <20140310073753.GA4658@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140307112055.GE2351@elgon.mountain>
 <20140307121022.GA32575@gmail.com>
 <20140307122103.GM4774@mwanda>
 <20140309161946.GA10262@console-pimps.org>
 <20140309163141.GA18824@srcf.ucam.org>
 <20140309185028.GB10262@console-pimps.org>
 <531D7786020000780012230D@nat28.tlf.novell.com>
In-Reply-To: <531D7786020000780012230D@nat28.tlf.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Beulich <JBeulich@suse.com>
Cc: Matt Fleming <matt@console-pimps.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Matt Fleming <matt.fleming@intel.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@redhat.com>, Nathan Zimmer <nzimmer@sgi.com>, kernel-janitors@vger.kernel.org, linux-efi@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>


* Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 09.03.14 at 19:50, Matt Fleming <matt@console-pimps.org> wrote:
> > On Sun, 09 Mar, at 04:31:41PM, Matthew Garrett wrote:
> >> On Sun, Mar 09, 2014 at 04:20:20PM +0000, Matt Fleming wrote:
> >> 
> >> > We have tried to use the time functions before, with little success
> >> > because of various bugs in the runtime implementations, e.g. see commit
> >> > bacef661acdb ("x86-64/efi: Use EFI to deal with platform wall clock")
> >> > and commit bd52276fa1d4 ("x86-64/efi: Use EFI to deal with platform wall
> >> > clock (again)").
> >> 
> >> I'd naively expected that these would be more reliable after the 
> >> 1:1 mapping patches, so it might actually be time to give them 
> >> another go.
> > 
> > Is there any value in that? Do machines exist where we absolutely 
> > must have access to the EFI time services? Either because there's 
> > no other method or no other working one?
> 
> Is it such a bad thing to be prepared for this sort of machine to 
> arrive even if likely there are none so far?

"Be prepared for a not yet existing machine" != "time to give them 
another go on existing machines", right?

Thanks,

	Ingo
