From: Markus Grabner <grabner@icg.tugraz.at>
Date: Sun, 20 Jan 2013 22:51:36 +0000
Subject: Re: [PATCH] staging: line6: fix use-after-free bug
Message-Id: <79932126.Fq7s3nYeNP@medialab>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
In-Reply-To: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Sonntag, 20. Januar 2013, 09:11:50 schrieb Greg Kroah-Hartman:
> On Sat, Jan 19, 2013 at 10:55:29PM +0100, Markus Grabner wrote:
> > Am Freitag, 18. Januar 2013, 16:57:31 schrieb Greg Kroah-Hartman:
> > > On Fri, Jan 18, 2013 at 10:52:14PM +0100, Markus Grabner wrote:
> > > > The function "line6_send_raw_message_async" now has an additional
> > > > argument
> > > > "bool copy", which indicates whether the supplied buffer should be
> > > > copied
> > > > into a dynamically allocated block of memory. The copy flag is also
> > > > stored in the "message" struct such that the temporary memory can be
> > > > freed when appropriate without intervention of the caller.
> > > 
> > > Why do this?  Why not either always copy it, or always not?
> > 
> > Some messages are sent to the device which have no parameters, they are
> > declared at global scope as constant byte arrays and therefore must be
> > copied into a dynamically allocated block of memory in order to be sent
> > over the USB interface. On the other hand, there are messages which do
> > have parameters and which are composed in dynamically allocated memory
> > and can therefore directly be sent without copying.
> 
> Then if you always copy the memory, and "own" it after the call, you
> should be fine, right?
> 
> > > What is this fixing?
> > 
> > Two users reported to me independently that the driver doesn't work for
> > them. I couldn't reproduce the problem since it seems to be triggered by
> > subtle timing issues in the system, but after some further
> > investigations, the kfree() of the message buffer immediately after
> > submitting the message for asynchronous transmission was clearly
> > identified as the reason for the driver not working. The patch puts the
> > kfree() at the right place and (hopefully) prevents incorrect use of the
> > new buffer copy feature. The patch is tested by me and the users who
> > initially reported the bug, and they confirmed that the issue is fixed
> > for them.
> > 
> > If anybody has a better idea how to fix this, please go ahead! The patch
> > might also become obsolete in the future due to refactoring. But
> > currently there is a bug which prevents some people from using the driver
> > at all, and this should be fixed soon IMO.
> 
> I agree, it should be fixed, but having the code always do the copy and
> manage the memory, and not have the crazy "flag" option, should solve
> the bug for everyone.
Removing the flag saves three lines of code, keeping the flag saves a tiny 
amount of time and memory, so it's not really worth a lengthy discussion, and 
I actually don't care much. I will focus on the user space library I'm 
currently working on since it will make much of the MIDI-related Line6 kernel 
driver code obsolete.

On the other hand, would it be possible in usb_submit_urb to detect whether 
the data pointer provided to it is suitable for DMA, and if not, transparently 
make a copy and free it if no longer used (or, by the same argument as above, 
just always make a copy)?

	Kind regards,
		Markus

