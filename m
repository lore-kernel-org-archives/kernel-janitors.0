From: Irwan Djajadi <irwan.djajadi@iname.com>
Date: Thu, 27 Oct 2005 04:22:31 +0000
Subject: Re: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/acsi_slm.c: replace
Message-Id: <43605607.8000909@iname.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Nishanth Aravamudan wrote:
> On 25.10.2005 [21:44:09 -0500], Irwan Djajadi wrote:
> 
>>Nishanth Aravamudan wrote:
>>
>>>On 24.10.2005 [18:46:01 -0500], Irwan Djajadi wrote:
>>>
>>>
>>>>Alexey Dobriyan wrote:
>>>>
>>>>
>>>>
>>>>>On Sat, Oct 22, 2005 at 09:53:51PM -0500, irwan.djajadi@iname.com wrote:
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>drivers/block/acsi_slm.c: replace interruptible_sleep_on() with
>>>>>>wait_event_interruptible()
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>--- 2.6.14-rc5/drivers/block/acsi_slm.c
>>>>>>+++ mod/drivers/block/acsi_slm.c
>>>>>>@@ -627,7 +627,7 @@ static ssize_t slm_write( struct file *f
>>>>>>
>>>>>>	while( SLMState = PRINTING ||
>>>>>>		   (SLMState = FILLING && SLMBufOwner != device) ) {
>>>>>>-		interruptible_sleep_on( &slm_wait );
>>>>>>+		wait_event_interruptible( slm_wait, SLMState=IDLE );
>>>>>>		if (signal_pending(current))
>>>>>>			return( -ERESTARTSYS );
>>>>>>	}
>>>>>>
>>>>>>
>>>>>
>>>>>acsi_slm_replace_interruptible_sleep_on_with_wait_event_interruptible.patch
>>>>
>>>>>from -kj looks more correct.
>>>>
>>>>
>>>>>From: Nishanth Aravamudan
>>>>>
>>>>>Use wait_event_interruptible() instead of the deprecated
>>>>>interruptible_sleep_on(). The sleep_on() call later in the same
>>>>>function is replaced with inline wait-queue code which achieves the
>>>>>same. This required adding a local wait-queue, though.
>>>>>
>>>>>--- a/drivers/block/acsi_slm.c
>>>>>+++ b/drivers/block/acsi_slm.c
>>>>>@@ -625,12 +626,10 @@ static ssize_t slm_write( struct file *f
>>>>>	int		device = iminor(node);
>>>>>	int		n, filled, w, h;
>>>>>
>>>>>-	while( SLMState = PRINTING ||
>>>>>-		   (SLMState = FILLING && SLMBufOwner != device) ) {
>>>>>-		interruptible_sleep_on( &slm_wait );
>>>>>-		if (signal_pending(current))
>>>>>-			return( -ERESTARTSYS );
>>>>>-	}
>>>>>+	wait_event_interruptible(slm_wait, (SLMState != PRINTING &&
>>>>>+				(SLMState != FILLING || SLMBufOwner = 
>>>>>device)));
>>>>>+	if (signal_pending(current))
>>>>>+		return -ERESTARTSYS;
>>>>>	if (SLMState = IDLE) {
>>>>>		/* first data of page: get current page size  */
>>>>>		if (slm_get_pagesize( device, &w, &h ))
>>>>>
>>>>>
>>>>>
>>>>
>>>>That does look more correct. Please ignore my patch.
>>>>Thanks!
>>>
>>>
>>>@Irwan:
>>>
>>>Have you tested any of the patches you are sending? I stopped replacing
>>>the *sleep_on*() family of functions once I was outside of the domain of
>>>trivial substitution.
>>>
>>>You can't simply s/interruptible_sleep_on/wait_event_interruptible/ as
>>>in many places the sleep_on() caller is not a loop, but one-time sleep!
>>>I have noticed at least one case of this in the patches you are sending
>>>out, but will try to make a more complete analysis soon.
>>>
>>>@Alexey:
>>>
>>>Be very careful pulling in these patches. I don't think any of the
>>>remaining *sleep_on*() replacements are easy or trivial (at least the
>>>ones w/o patches already in -KJ). I'll try to take a look more in depth
>>>soon.
>>>
>>>Thanks,
>>>Nish
>>>
>>
>>Hi Nish,
>>
>>I only compile-test most of my patch over the weekend.. There are some 
>>that I didn't even do compile test on because it's for a different 
>>platform (I'm on x86). But yes, I am aware that some of *sleep_on*() 
>>family function fixes are not trivial. I only changed ones that I 
>>thought trivial. When the end-wait-condition is not clear to me, I left 
>>it alone, and I went to the next.
> 
> 
> It's not just the wait-condition, it's also the surrounding code
> (including how the wait-queue gets woken).
> 
> [ On a sidenote: it took me a while to drive this through my own thick
> skull, but the *most* important thing to do with KJ patches is
> compile-test. If you don't have the arch at hand, get a cross-compiler,
> I know there are guides for setting one up around. ]
> 
> 
>>Maybe I'm missing something here, but I don't really see why 
>>interruptible_sleep_on() or wait_event_interruptible() is not a straight 
>>substitution when the caller is not in a loop..
> 
> 
> First of all, there's the straightforward semantic difference between
> sleeping on a wait queue and waiting for an event! Second, because the
> caller is not in a loop, you are introducing a *new* loop by using
> wait_event*(). That may not be desired. Depends on the condition you
> put in, as well.
> 
> 
>>interruptible_sleep_on() does not have a loop inside, and it's a single 
>>incantation of wait. When it wakes up, it could be because of a signal 
>>or end-condition.
> 
> 
> Or someone manually waking up the wait-queue. There is no "end
> condition" with sleep_on().
> 
> 
>>I see that wait_event_interruptible() has a check outside and a loop 
>>inside to ensure that when it returns it's because of a signal or 
>>end-condition. (So it's a more correct version of interruptible_sleep_on())
> 
> 
> Right, so whereas with sleep_on, waking-up the wait-queue is sufficient
> to terminate the sleep, it is *not* for wait_event() -- either the event
> *must* be satisfied or a signal *must* have arrived for wait_event() to
> return.
> 
> 
>>The semantic looks the same to me, so why can't it be a straight 
>>substitution when the end-wait-condition is straightforward?
>>
>>I don't intend to inject bugs, so I appreciate y'all's review of my 
>>patches, and let me know/smack me when I do dumb things.
> 
> 
> I appreciate the effort. Getting rid of sleep_on() & co. would be a nice
> benefit IMO (or getting it closer to the point where we can mark them
> deprecated).
> 
> Thanks,
> Nish
> 

OK, you're right, the semantic is different..

I've gone back and reviewed my changes, and I think the code before was 
buggy because it should've used the end-condition loop surrounding the 
interruptible_sleep_on, so I think my changes are OK.. IMHO..

Anyway, I think there is a bigger problem even with 
wait_event_interruptible.. When it returns, there is only a guarantee 
that the end-condition happened at the time, but there may not be a 
guarantee that the end-condition is still happening on the current time. 
  I noticed that some drivers uses this synchronization construct to do 
resource management, and I think this is dangerous..

For example: mcdx.c uses it to do locking, swim3.c and swim_iop.c also 
use it for doing "locking" (it waits till fs->state = available, but by 
the time we wake up, fs->state might not be available anymore)..
The rest of the changes mostly have something to do with ASYNC_CLOSING 
stuff with serial port, and using wait_event_interruptible() is probably 
OK here, since hopefully we can only close the serial port once.. or 
something.. :-)

OK, well, lemme know what you think, or maybe I'm just smoking crack
Thanks guys,
--
Irwan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
