From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Mar 2013 17:45:35 +0000
Subject: Re: [patch] HID: hid-logitech-dj: add some range checks
Message-Id: <20130305174535.GD9189@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130305130626.GA17801@longonot.mountain>
 <CAN+gG=E_b3ydgPpt1c0-5Z6Ktkzw1bN7Kro=WUC7UmJenPAfMg@mail.gmail.com>
 <CAE7qMrouxdpjtBRpTUjKBdiAr-wwhy8x3M23Q_twP+kkTFFALA@mail.gmail.com>
In-Reply-To: <CAE7qMrouxdpjtBRpTUjKBdiAr-wwhy8x3M23Q_twP+kkTFFALA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>, Jiri Kosina <jkosina@suse.cz>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Mar 05, 2013 at 05:34:08PM +0100, Nestor Lopez Casado wrote:
> > If you want to add a check, it need to be in logi_dj_recv_forward_report().
> > The current access to djrcv_dev->paired_dj_devices[] in
> > delayedwork_callback() has been removed in latest HID tree:
> > https://git.kernel.org/cgit/linux/kernel/git/jikos/hid.git/log/?h=for-3.10/logitech
> The test could be added there. It would be quite defensive though, as
> we should always get the right device indexes.


Ah...  I appologize for the noise.  I misunderstood how
hid_input_report() works.  I thought it could be called with user
supplied parameters.

Never mind.

regards,
dan carpenter

