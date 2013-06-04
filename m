From: Markus Grabner <grabner@icg.tugraz.at>
Date: Tue, 04 Jun 2013 20:10:07 +0000
Subject: Re: [PATCH] staging: line6: fix use-after-free bug
Message-Id: <1771458.Msa69nKv88@mark>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
In-Reply-To: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 03 June 2013 16:08:21 Greg Kroah-Hartman wrote:
> On Tue, Jun 04, 2013 at 12:49:36AM +0200, Markus Grabner wrote:
> > I'm currently re-investigating this, and I have been informed by users
> > that
> > some newer Line6 devices talk a device-specific protocol over USB which is
> > different from the MIDI standard and should therefore not be mapped to a
> > virtual MIDI device. This raises some additional questions:
> > 
> > *) The easiest way to deal with this would be to use libusb in user space
> > to exchange data with the device. However, as far as I understand, if the
> > device is being used as an ALSA sound card (i.e., the kernel driver has
> > claimed the USB interface to access isochronous endpoints), libusb can't
> > access interrupt endpoints of the same interface at the same time since
> > it can't claim the interface while it is claimed by the kernel. Is this
> > correct?
> 
> Yes, that is correct.
Thanks for the clarification!

> > *) If shared kernel/user space access to the same USB interface is not
> > possible as discussed above, what would be the preferred interface for
> > user
> > space applications to talk to the kernel driver? I think netlink is a good
> > candidate, or do you have any other suggestions?
> 
> What exactly do you need to communicate from user to kernel?  That is
> going to dictate what interface to use.
Line6 devices use USB interrupt messages for the following purposes:
*) device->host: when the user interacts with the device (e.g., turns the 
volume dial), the modified state is reported to the host by an asynchronous 
message (typically 2 to 16 bytes)
*) host->device: the state of the device can be changed by sending similar 
messages from host to device (e.g., a GUI application would do so when the 
user turns the volume dial on screen)
*) some device information can explicitly be queried by sending a message, to 
which the device responds with one or more messages (these can be much longer, 
e.g., the device's NVRAM content)

Moreover, some (few) information is exchanged via USB control messages. All 
messages are encoded in a device-dependent binary format, so far I am aware of 
~200 different message types.

All of this could be done by libusb, if there weren't the restriction that the 
user space can't claim the interface after the kernel has done so. Since the 
Line6 kernel driver has exclusive access to the USB interface, it must provide 
some additional "entry point" to route messages between user space code and 
the Line6 USB device.

With these requirements in mind, I did some search and found the page
"http://people.ee.ethz.ch/~arkeller/linux/kernel_user_space_howto.html", from 
which I think netlink is best suited. What do you think?

	Kind regards,
		Markus

