From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 16 Feb 2009 14:11:00 +0000
Subject: Re: [PATCH] wusb: Storage class should be before const qualifier
Message-Id: <alpine.LNX.1.10.0902161510440.18110@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209220735.GA8082@xenon.distanz.ch>
In-Reply-To: <20090209220735.GA8082@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 16 Feb 2009, David Vrabel wrote:

> >> diff --git a/include/linux/usb/wusb.h b/include/linux/usb/wusb.h
> >> index 5f401b6..429c631 100644
> >> --- a/include/linux/usb/wusb.h
> >> +++ b/include/linux/usb/wusb.h
> >> @@ -80,8 +80,7 @@ struct wusb_ckhdid {
> >>  	u8 data[16];
> >>  } __attribute__((packed));
> >>  
> >> -const static
> >> -struct wusb_ckhdid wusb_ckhdid_zero = { .data = { 0 } };
> >> +static const struct wusb_ckhdid wusb_ckhdid_zero = { .data = { 0 } };
> >>  
> >>  #define WUSB_CKHDID_STRSIZE (3 * sizeof(struct wusb_ckhdid) + 1)
> > 
> > David, are you going to take this through wusb tree, or should I take it 
> > through trivial tree together with the rest of these patches? I don't seem 
> > to see this present in current -next.
> Through trivial is best I think, thanks.  You can add
> Acked-by: David Vrabel <david.vrabel@csr.com>
> if you wish.

Done, thanks.

-- 
Jiri Kosina
SUSE Labs
