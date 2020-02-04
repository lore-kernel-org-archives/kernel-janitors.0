From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Feb 2020 06:27:49 +0000
Subject: Re: [PATCH] USB HID random timeout failures fixed by trying 20 times
Message-Id: <20200204062749.GP1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
In-Reply-To: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Lauri,

There are a bunch of issues with this patch.

1)  There is no way we're going to add a retry loop to
    usb_control_msg().  We might add it to a driver, but probably we
    would suspect that the hardware is bad.  Maybe the cable is faulty?
    Or I could be wrong on that...

2)  You would need to send this to a different list.  Use
    ./scripts/get_maintainer.pl to find out who.  The
    linux-usb@vger.kernel.org is the main USB list.

3)  The patch doesn't apply.  Read the first paragraph of
    Documentation/process/email-clients.rst

4) The subject needs to be formatted slightly differently.
    [PATCH] USB: HID: Fix timeout by adding retry loop

5) The commit message should be more clear what was affected.  Don't
   start the commit message in the middle of a sentence.

regards,
dan carpenter
