From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 16:35:22 +0000
Subject: Re: [patch 2/2] usbhid: fix some error codes in hiddev_connect()
Message-Id: <20110526163522.GH14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110526085018.GE14591@shale.localdomain>
 <alpine.LNX.2.00.1105261406260.28291@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1105261406260.28291@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: "open list:USB HID/HIDBP DRI..." <linux-usb@vger.kernel.org>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, May 26, 2011 at 02:07:00PM +0200, Jiri Kosina wrote:
> Why would that matter?
>
> hid_connect() (which is the only caller) only checks for the return value 
> being (non-)zero.

It's just a cleanup.  It silences a Smatch complaint.

regards,
dan carpenter 
