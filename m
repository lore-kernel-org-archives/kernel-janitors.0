From: Michal Nazarewicz <mina86@mina86.com>
Date: Tue, 09 Sep 2014 16:37:02 +0000
Subject: Re: [patch] usb: gadget: f_fs: signedness bug in __ffs_func_bind_do_descs()
Message-Id: <xa1tha0g21jl.fsf@mina86.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140909120609.GB19760@mwanda>
In-Reply-To: <20140909120609.GB19760@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Tue, Sep 09, 2014 at 03:57:26PM +0200, Michal Nazarewicz wrote:
>> On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > Btw, there is a sparse warning:
>> >
>> > drivers/usb/gadget/function/f_fs.c:401:44: warning: Variable length array is used.
>> >
>> > The risk here is that the array would be too large.  I don't know the
>> > code well enough to say if it can be triggered, but from an outsider
>> > perspective it looks scary (security implications).  There should be a
>> > comment explaining why it can't be used to overflow the 8k stack.
>> 
>> n in that function can be at most 4
>
> I looked for where this limit is set but couldn't figure it out.  Which
> function is it?

The limit is never explicitly set, but logic in this function guarantees
it:

static void __ffs_event_add(struct ffs_data *ffs,
			    enum usb_functionfs_event_type type)
{
	enum usb_functionfs_event_type rem_type1, rem_type2 = type;
	int neg = 0;

	/*
	 * Abort any unhandled setup
	 *
	 * We do not need to worry about some cmpxchg() changing value
	 * of ffs->setup_state without holding the lock because when
	 * state is FFS_SETUP_PENDING cmpxchg() in several places in
	 * the source does nothing.
	 */
	if (ffs->setup_state = FFS_SETUP_PENDING)
		ffs->setup_state = FFS_SETUP_CANCELLED;

	switch (type) {
	case FUNCTIONFS_RESUME:
		rem_type2 = FUNCTIONFS_SUSPEND;
		/* FALL THROUGH */
	case FUNCTIONFS_SUSPEND:
	case FUNCTIONFS_SETUP:
		rem_type1 = type;
		/* Discard all similar events */
		break;

	case FUNCTIONFS_BIND:
	case FUNCTIONFS_UNBIND:
	case FUNCTIONFS_DISABLE:
	case FUNCTIONFS_ENABLE:
		/* Discard everything other then power management. */
		rem_type1 = FUNCTIONFS_SUSPEND;
		rem_type2 = FUNCTIONFS_RESUME;
		neg = 1;
		break;

	default:
		BUG();
	}

	{
		u8 *ev  = ffs->ev.types, *out = ev;
		unsigned n = ffs->ev.count;
		for (; n; --n, ++ev)
			if ((*ev = rem_type1 || *ev = rem_type2) = neg)
				*out++ = *ev;
			else
				pr_vdebug("purging event %d\n", *ev);
		ffs->ev.count = out - ffs->ev.types;
	}

	pr_vdebug("adding event %d\n", type);
	ffs->ev.types[ffs->ev.count++] = type;
	wake_up_locked(&ffs->ev.waitq);
}

Looking at the last four cases, BIND, UNBIND, DISABLE and ENABLE events
will never be present on the event list at the same time.  Since there's
only three more event types, this means that the list can contain at
most four events.

So ffs->ev.count <= 4, and since __ffs_ep0_read_events is called with
n = min(n, (size_t)ffs->ev.count)), n <= 4.


-- 
Best regards,                                         _     _
.o. | Liege of Serenely Enlightened Majesty of      o' \,=./ `o
..o | Computer Science,  Michał “mina86” Nazarewicz    (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--
