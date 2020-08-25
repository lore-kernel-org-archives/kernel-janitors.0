From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 07:29:03 +0000
Subject: Re: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_write_settings()
Message-Id: <20200825072903.GQ1793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1597819984.4101.16.camel@web.de>
 <20200824085735.GA208317@mwanda>
 <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
In-Reply-To: <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Stefan Achatz <erazor_de@users.sourceforge.net>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Aug 24, 2020 at 03:35:16PM +0000, Walter Harms wrote:
> hello Dan, 
> 
> i notice that you can shorten the line to:
> (line above checks for count=sizeof(struct kone_settings))
> 
> difference = memcmp(settings, &kone->settings, count);
> 
> nothing special just to shorten the line and make use of count.
> 
> and just to save one indent level and because its  readabel nicely:
>     if ( ! difference ) 
>           goto unlock;
> 
> hope that helps

Yeah.  I wrote that version and I wanted to send it, but then I decided
not to change the style too much.  I definitely agree with you, but I
figured I would keep the patch less intrusive.

regards,
dan carpenter
