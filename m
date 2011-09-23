From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 23 Sep 2011 07:30:41 +0000
Subject: Re: [patch] Input: potential info leak in uiput_ff_upload_to_user()
Message-Id: <20110923073041.GB613@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923062240.GG4387@elgon.mountain>
In-Reply-To: <20110923062240.GG4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrik Rydberg <rydberg@euromail.se>, Ping Cheng <pingc@wacom.com>, Peter Hutterer <peter.hutterer@who-t.net>, Aristeu Rozanski <aris@ruivo.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 23, 2011 at 09:22:40AM +0300, Dan Carpenter wrote:
> Smatch has a new check for Rosenberg type information leaks where
> structs are copied to the user with uninitialized stack data in them.
> 
> The issue here is that struct uinput_ff_upload_compat has a hole in
> it.
> 
> struct uinput_ff_upload_compat {
>         int                        request_id;           /*     0     4 */
>         int                        retval;               /*     4     4 */
>         struct ff_effect_compat    effect;               /*     8     0 */
> 
>         /* XXX 44 bytes hole, try to pack */
> 
>         struct ff_effect_compat    old;                  /*    52     0 */


44 bytes... doubtful...

Thanks.

-- 
Dmitry
