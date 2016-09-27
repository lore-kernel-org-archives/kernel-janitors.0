From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Sep 2016 09:47:38 +0000
Subject: Re: [PATCH] greybus: manifest: style fix missing space before '('
Message-Id: <20160927094738.GX13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160927092028.13119-1-lambert.quentin@gmail.com>
 <CAOh2x=m31uDE8Nn5CyX9_2XKQ594fe0XKqz9j6pqW3Gj++u+fg@mail.gmail.com>
 <728f3214-c9f2-837b-6725-f95777c23bab@gmail.com>
In-Reply-To: <728f3214-c9f2-837b-6725-f95777c23bab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 27, 2016 at 11:33:49AM +0200, Quentin Lambert wrote:
> 
> 
> On 27/09/2016 11:31, Viresh Kumar wrote:
> >On Tue, Sep 27, 2016 at 2:50 PM, Quentin Lambert
> ><lambert.quentin@gmail.com> wrote:
> >>Checkpatch printed a style ERROR concerning a missing space befire '('.
> >>This patch fix this issue.
> >>
> >>Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
> >>---
> >>  drivers/staging/greybus/manifest.c |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>--- a/drivers/staging/greybus/manifest.c
> >>+++ b/drivers/staging/greybus/manifest.c
> >>@@ -11,7 +11,7 @@
> >>
> >>  static const char *get_descriptor_type_string(u8 type)
> >>  {
> >>-       switch(type) {
> >>+       switch (type) {
> >>         case GREYBUS_TYPE_INVALID:
> >>                 return "invalid";
> >>         case GREYBUS_TYPE_STRING:
> >Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Wow I just noticed the typo: "befire" do you want me to resend ?

No one cares about tiny typos in the patch description, but resend if
you want.

regards,
dan carpenter

