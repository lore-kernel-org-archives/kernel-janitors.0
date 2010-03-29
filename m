From: David Ellingsworth <david@identd.dyndns.org>
Date: Mon, 29 Mar 2010 15:54:52 +0000
Subject: Re: [patch] video/s255drv: cleanup. remove uneeded NULL check
Message-Id: <30353c3d1003290854s7a1a119cm5fdf8cf0142762df@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328112909.GP5069@bicker>
In-Reply-To: <20100328112909.GP5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Dean Anderson <dean@sensoray.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mike Isely <isely@pobox.com>, =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

I don't have any problems with this patch in particular but would like
to note that this driver could use a little refactoring.

One thing I noticed just while glancing at the code is that the return
value from s2255_probe_v4l is not checked in s2255_probe. As a result
the driver could fail to register some or all of it's video device
nodes and still continue to load.

Also the use of kref, while needed in this driver due to the number of
video nodes created, is probably a bit overused. In my opinion
video_unregister_device should be called in the usb disconnect
callback for each registered video device. This ensures that no future
calls to open will occur for that device. Subsequently, once all
applications have stopped using the previously registered
video_device, the release callback of the video_device struct will
fire. Therefore if the device kref is incremented for each registered
video device (during probe) and then properly decremented during the
video_device release callback for each device the device driver's
structure may then be freed. This approach should lead to a much
cleaner implementation of the open, release, and disconnect callbacks.

Regards,

David Ellingsworth
